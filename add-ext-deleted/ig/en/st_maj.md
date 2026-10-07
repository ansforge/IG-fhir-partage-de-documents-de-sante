# Mise à jour de documents - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

## Mise à jour de documents

Ce flux contient les informations relatives à la modification des métadonnées clés de la fiche (statut, niveau de confidentialité, archivage et suppression logique). Cette demande de modification est faite par le producteur de documents.

### Flux 03 : mise à jour des métadonnées de la fiche

Le flux de mise à jour des métadonnées de la fiche est basé sur l’interaction « [patch](https://www.hl7.org/fhir/R4/http.html#patch) » de l’API REST FHIR qui est assurée par une requête HTTP PATCH. Elle permet la mise à jour partielle d’une ressource DocumentReference.

Au niveau applicatif, les mises à jour sont restreintes aux éléments `DocumentReference.status`, `DocumentReference.securityLabel` et aux extensions [PDSm_IsArchived](StructureDefinition-pdsm-ext-is-archived.md) et [PDSm_IsDeleted](StructureDefinition-pdsm-ext-is-deleted.md).

La suppression d’une fiche est logique et non physique : elle consiste à positionner l’extension PDSm_IsDeleted à `true`. La ressource DocumentReference est conservée par le gestionnaire de partage de documents. Les règles applicables sont décrites dans la section « Suppression logique d’une fiche » ci-dessous.

La correspondance entre les valeurs de la métadonnée availabilityStatus d’une fiche définies dans le [volet Partage de documents de santé](https://esante.gouv.fr/sites/default/files/media_entity/documents/ci-sis_service_volet-partage-documents-sante_v1.16.4.pdf) (section 3.3.5.2.1, Tableau 1) et les éléments de la ressource DocumentReference est la suivante :

| | | |
| :--- | :--- | :--- |
| Approved | – | `current` |
| Deprecated | – | `superseded` |
| Archived | `isArchived`=`true` | `current`ou`superseded` |
| Deleted | `isDeleted`=`true` | `superseded` |

Les changements d’état autorisés et leurs conséquences sont ceux décrits dans le Tableau 1 du volet Partage de documents de santé. En particulier, une fiche archivée qui est remplacée par une nouvelle version passe au statut `superseded` et la nouvelle version reprend la valeur de l’extension PDSm_IsArchived, et aucun changement d’état n’est possible depuis une fiche supprimée.

La valeur `entered-in-error` ne doit pas être utilisée pour l’élément `DocumentReference.status` (cf. [IHE ITI.MHD issue #274](https://github.com/IHE/ITI.MHD/issues/274)).

La requête Patch contient l’identifiant métier de la ressource à modifier ainsi que la liste des mises à jour à effectuer.

Afin d’effectuer la demande de mise à jour sur l’identifiant métier et non l’identifiant logique de la ressource DocumentReference, le gestionnaire de partage de documents doit prendre en charge le « conditional Patch ».

La demande de mise à jour est transmise au format [FHIRPath Patch](https://www.hl7.org/fhir/R4/fhirpatch.html), sous la forme d’une ressource Parameters (en-tête `Content-Type: application/fhir+json` ou `application/fhir+xml`). Le gestionnaire de partage de documents doit accepter ce format.

Ce choix assure la cohérence avec la transaction IHE MHD « Provide Document Bundle [ITI-65](https://profiles.ihe.net/ITI/MHD/ITI-65.html) », qui utilise déjà le FHIRPath Patch (profil [IHE.MHD.Patch.Parameters](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.Patch.Parameters.html)) pour mettre à jour le statut d’une fiche remplacée : le gestionnaire de partage de documents n’a ainsi qu’un seul format de mise à jour partielle à prendre en charge.

Le gestionnaire de partage de documents peut accepter également les formats [JSON Patch](https://datatracker.ietf.org/doc/html/rfc6902) et [XML Patch](https://datatracker.ietf.org/doc/html/rfc5261) ; il les déclare alors dans l’élément `patchFormat` de son CapabilityStatement. Un producteur de documents qui utilise l’un de ces formats doit s’assurer au préalable que le gestionnaire de partage de documents l’accepte.

Lorsque toutes les modifications sont traitées, le serveur traite la fiche du document de la même façon qu’au cours d’une opération update créant ainsi une nouvelle version (modification des éléments `meta.versionId` et `meta.lastUpdated`).

#### Construction de la demande

Les règles suivantes s’appliquent à la construction de la demande :

* **Opérations** : chaque modification est décrite par un paramètre `operation` dont les parties indiquent le type d’opération (`type`), l’élément visé sous la forme d’une expression FHIRPath (`path`) et la nouvelle valeur (`value`).
* **Désignation des extensions** : une extension est désignée par son URL, par exemple `DocumentReference.extension.where(url='https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-is-deleted').value`. Il n’est donc pas nécessaire de connaître sa position dans la ressource.
* **Extension absente** : l’opération `replace` échoue si le chemin ne désigne aucun élément. Si l’extension n’est pas encore présente dans la fiche, elle doit être ajoutée avec l’opération `add` sur l’élément `DocumentReference`, avec la partie `name` valant `extension` (voir l’exemple de suppression logique ci-dessous).
* **Vérification de l’état de la fiche** : le format FHIRPath Patch ne propose pas d’opération permettant au producteur de documents de vérifier la valeur d’un élément avant de le modifier. C’est le gestionnaire de partage de documents qui vérifie que la demande est applicable à l’état courant de la fiche (voir les règles de suppression logique et le flux 04). Ce mécanisme correspond à la vérification de l’annotation « OriginalStatus » par le registre dans le volet Partage de documents de santé.
* **Modification concurrente** : pour éviter d’appliquer une demande à une fiche modifiée entre-temps, le producteur de documents devrait transmettre l’en-tête HTTP [`If-Match`](https://www.hl7.org/fhir/R4/http.html#concurrency) contenant la version de la fiche qu’il connaît, c’est-à-dire la valeur de l’[`ETag`](https://www.hl7.org/fhir/R4/http.html#versioning) retournée lors du dépôt de la fiche ou de sa dernière mise à jour. Si la fiche a été modifiée entre-temps, le gestionnaire de partage de documents rejette la demande. En l’absence de cet en-tête, les contrôles réalisés par le gestionnaire de partage de documents sur l’état courant de la fiche s’appliquent.

Ci-dessous un exemple de requête pour la mise à jour du statut, du niveau de confidentialité et de l’archivage :

```
PATCH [base]/DocumentReference?identifier=http://my-lab-system|123 HTTP/1.1
Content-Type: application/fhir+json
If-Match: W/"1"

```

```
{
    "resourceType":"Parameters",
    "parameter":[
        {
            "name":"operation",
            "part":[
                { "name":"type", "valueCode":"replace" },
                { "name":"path", "valueString":"DocumentReference.status" },
                { "name":"value", "valueCode":"current" }
            ]
        },
        {
            "name":"operation",
            "part":[
                { "name":"type", "valueCode":"replace" },
                { "name":"path", "valueString":"DocumentReference.securityLabel.coding.where(system='http://terminology.hl7.org/CodeSystem/v3-Confidentiality').code" },
                { "name":"value", "valueCode":"R" }
            ]
        },
        {
            "name":"operation",
            "part":[
                { "name":"type", "valueCode":"replace" },
                { "name":"path", "valueString":"DocumentReference.extension.where(url='https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-is-archived').value" },
                { "name":"value", "valueBoolean":true }
            ]
        }
    ]
}

```

Dans cet exemple, l’extension PDSm_IsArchived est déjà présente dans la fiche : sa valeur est remplacée.

Ci-dessous un exemple de requête pour la suppression logique de la fiche :

```
PATCH [base]/DocumentReference?identifier=http://my-lab-system|123 HTTP/1.1
Content-Type: application/fhir+json
If-Match: W/"1"

```

```
{
    "resourceType":"Parameters",
    "parameter":[
        {
            "name":"operation",
            "part":[
                { "name":"type", "valueCode":"replace" },
                { "name":"path", "valueString":"DocumentReference.status" },
                { "name":"value", "valueCode":"superseded" }
            ]
        },
        {
            "name":"operation",
            "part":[
                { "name":"type", "valueCode":"add" },
                { "name":"path", "valueString":"DocumentReference" },
                { "name":"name", "valueString":"extension" },
                {
                    "name":"value",
                    "part":[
                        { "name":"url", "valueUri":"https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-is-deleted" },
                        { "name":"valueBoolean", "valueBoolean":true }
                    ]
                }
            ]
        }
    ]
}

```

Dans cet exemple, l’extension PDSm_IsDeleted n’est pas encore présente dans la fiche : elle est ajoutée avec l’opération `add`. Si elle était présente avec la valeur `false`, sa valeur serait remplacée avec l’opération `replace`, comme dans l’exemple précédent.

#### Suppression logique d’une fiche

La suppression logique d’une fiche correspond à la dépublication d’un document définie par le [volet Partage de documents de santé](https://esante.gouv.fr/sites/default/files/media_entity/documents/ci-sis_service_volet-partage-documents-sante_v1.16.4.pdf) (valeur « Deleted » de la métadonnée availabilityStatus en XDS). Elle est faite à la demande du patient ou d’un professionnel de santé ; la définition des acteurs habilités à la demander est du ressort du gestionnaire de partage de documents. Le document reste stocké par le gestionnaire de partage de documents mais n’est plus accessible.


**Suppression logique d’une fiche : Flux 03 et 04**

Les règles suivantes s’appliquent :

* **Fiche concernée** : la demande de suppression porte sur la version la plus récente de la fiche (`DocumentReference.status` = `current`), archivée ou non. Une fiche dont le statut est `superseded` ne peut pas être supprimée directement : elle l’est uniquement par propagation (voir ci-dessous).
* **Mise à jour de la fiche** : la demande du producteur de documents positionne l’extension PDSm_IsDeleted à `true` et l’élément `DocumentReference.status` à `superseded`. À réception de la demande, le gestionnaire de partage de documents vérifie que ces deux valeurs sont bien demandées et, si la fiche était archivée, positionne l’extension PDSm_IsArchived à `false` : une fiche supprimée n’est plus considérée comme archivée.
* **Propagation aux versions antérieures** : la suppression s’applique à toutes les versions antérieures de la fiche : 
* les fiches remplacées, directement ou non, par la fiche supprimée (`DocumentReference.relatesTo.code` = `replaces`) : le gestionnaire de partage de documents positionne leur extension PDSm_IsDeleted à `true` ;
* les versions historiques de la ressource DocumentReference de la fiche supprimée et des fiches remplacées (`meta.versionId`), créées par les mises à jour successives : elles ne sont plus accessibles par les interactions [vread](https://www.hl7.org/fhir/R4/http.html#vread) et [history](https://www.hl7.org/fhir/R4/http.html#history).
 
* **Suppression logique du document** : le document référencé par `DocumentReference.content.attachment.url` de la fiche supprimée et de ses versions antérieures n’est plus accessible (voir [Consultation d’un document](st_consultation.md)).
* **Inaccessibilité** : une fiche supprimée ne peut plus faire l’objet d’une mise à jour. De plus, dans le présent volet, une fiche supprimée n’est plus retournée par la recherche de fiches (voir [Recherche de fiches](st_recherche_fiche.md)) ; le volet Partage de documents de santé précisant uniquement que le document n’est plus accessible, cette règle est propre au présent volet.
* **Irréversibilité** : la suppression logique est définitive. L’extension PDSm_IsDeleted d’une fiche ne peut pas repasser à `false`.
* **Document transformé** : lorsque deux documents sont liés par une transformation (`DocumentReference.relatesTo.code` = `transforms`) et doivent être supprimés ensemble, le producteur de documents envoie une demande de suppression pour chacune des deux fiches.
* **Traçabilité** : la traçabilité des suppressions logiques doit être assurée par le gestionnaire de partage de documents, par exemple dans ses traces fonctionnelles.

Répercussion sur les lots de soumission et les classeurs :

Dans le volet Partage de documents de santé, la suppression logique d’une fiche fait passer à l’état « Deprecated » les associations qui la lient, ainsi que ses versions antérieures, à son lot de soumission et à ses classeurs (Tableau 1 et Tableau 3). Dans le présent volet, ces liens sont portés par l’élément `List.entry` du lot de soumission ([PDSm_SubmissionSetComprehensive](StructureDefinition-pdsm-submissionset-comprehensive.md)) et du classeur ([PDSm_FolderComprehensive](StructureDefinition-pdsm-folder-comprehensive.md)). Le profil MHD interdisant l’élément `List.entry.deleted`, la désactivation d’un lien se traduit par le retrait de l’entrée correspondante. Lors de la suppression logique d’une fiche, le gestionnaire de partage de documents :

* retire du lot de soumission de la fiche supprimée, et du lot de soumission de chacune de ses versions antérieures, l’entrée qui référence cette fiche ; les autres éléments du lot de soumission ne sont pas modifiés et le lot de soumission n’est pas supprimé ;
* retire de chaque classeur l’entrée qui référence la fiche supprimée ou l’une de ses versions antérieures, et met à jour l’élément `List.date` du classeur avec la date et l’heure de la suppression.

Le retrait d’une entrée est définitif.

### Flux 04 : résultat de la mise à jour des métadonnées de la fiche

Ce flux retourne le résultat de demande de modification des métadonnées de la fiche. La demande peut être un succès ou un échec.

Il doit être indiqué dans la réponse, le statut (succès ou échec) de la requête. Le contenu qui a été modifié est aussi retourné.

Il s'agit de la réponse à la demande de mise à jour des métadonnées de la fiche.

Le gestionnaire de partage de documents de santé retourne un "HTTP Status code" approprié au résultat de la mise à jour de chaque élément contenu dans la requête. Par exemple :

* Si la mise à jour de la ressource DocumentReference est correctement effectuée, un code HTTP 200 « OK » doit être retourné.
* Si la demande est transmise dans un format que le gestionnaire de partage de documents n’accepte pas, une erreur 415 « Unsupported Media Type » doit être retournée.
* Si la mise à jour de la ressource DocumentReference porte sur des éléments autres que status, securityLabel, PDSm_isArchived et PDSm_isDeleted, une erreur 405 « Method Not Allowed » doit être retournée.
* Si aucune fiche ne correspond à l’identifiant métier, ou si la fiche visée a été supprimée logiquement (elle est alors considérée comme inexistante), une erreur 404 « Not Found » doit être retournée.
* Si plusieurs fiches correspondent à l’identifiant métier, une erreur 412 « Precondition Failed » doit être retournée, conformément au [« conditional Patch »](https://www.hl7.org/fhir/R4/http.html#patch).
* Si la demande de suppression logique porte sur une fiche qui n’est pas la version la plus récente ou si elle ne conduit pas à `DocumentReference.status` = `superseded` et à l’extension PDSm_IsDeleted à `true`, une erreur 422 « Unprocessable Entity » doit être retournée. Ce code est celui prévu par [FHIR R4](https://www.hl7.org/fhir/R4/http.html#update) lorsque la demande enfreint les règles métier du serveur.
* Si l’en-tête `If-Match` est transmis et que sa valeur ne correspond pas à la version courante de la fiche, une erreur 412 « Precondition Failed » doit être retournée.

Pour des informations sur les autres codes HTTP retournés en cas d’échec, consultez la documentation relative à [l’interaction « patch »](https://www.hl7.org/fhir/R4/http.html#summary) de l’API REST FHIR.

Le corps de la réponse doit contenir une ressource DocumentReference constituée des éléments modifiés.

Ci-dessous un exemple de réponse suite au succès de la mise à jour du statut à « current » de la ressource DocumentReference d’identifiant 35 (cf annexe VI).

```
HTTP/1.1 200 Ok
Content-Type : application/fhir+JSON
Last-Modified : 2021-06-07
ETag : W/"2"
{
 "resourceType":"DocumentReference",
 "meta": { "versionId": "2" },
 "id":"35",
 "status":"current ",
 …
}

```

