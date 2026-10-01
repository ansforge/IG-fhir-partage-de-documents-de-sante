Ce flux contient les informations relatives à la modification des métadonnées clés de la fiche (statut, niveau de confidentialité, archivage et suppression logique). Cette demande de modification est faite par le producteur de documents. 

### Flux 03 : mise à jour des métadonnées de la fiche

Le flux de mise à jour des métadonnées de la fiche est basé sur l’interaction « [patch](https://www.hl7.org/fhir/R4/http.html#patch) » de l’API REST FHIR qui est assurée par une requête HTTP PATCH. Elle permet la mise à jour partielle d’une ressource DocumentReference.

Au niveau applicatif, les mises à jour sont restreintes aux éléments `DocumentReference.status`, `DocumentReference.securityLabel` et aux extensions [PDSm_IsArchived](StructureDefinition-pdsm-ext-is-archived.html) et [PDSm_IsDeleted](StructureDefinition-pdsm-ext-is-deleted.html).

La suppression d’une fiche est logique et non physique : elle consiste à positionner l’extension PDSm_IsDeleted à `true`. La ressource DocumentReference est conservée par le gestionnaire de partage de documents. Les règles applicables sont décrites dans la section « Suppression logique d’une fiche » ci-dessous.

La correspondance entre les valeurs de la métadonnée availabilityStatus d’une fiche définies dans le [volet Partage de documents de santé](https://esante.gouv.fr/sites/default/files/media_entity/documents/ci-sis_service_volet-partage-documents-sante_v1.16.4.pdf) (section 3.3.5.2.1, Tableau 1) et les éléments de la ressource DocumentReference est la suivante :

| availabilityStatus (volet XDS) | Extension | `DocumentReference.status` |
|---|---|---|
| Approved | – | `current` |
| Deprecated | – | `superseded` |
| Archived | `isArchived` = `true` | `current` ou `superseded` |
| Deleted | `isDeleted` = `true` | `superseded` |

Les changements d’état autorisés et leurs conséquences sont ceux décrits dans le Tableau 1 du volet Partage de documents de santé. En particulier, une fiche archivée qui est remplacée par une nouvelle version passe au statut `superseded` et la nouvelle version reprend la valeur de l’extension PDSm_IsArchived, et aucun changement d’état n’est possible depuis une fiche supprimée.

La valeur `entered-in-error` ne doit pas être utilisée pour l’élément `DocumentReference.status` (cf. [IHE ITI.MHD issue #274](https://github.com/IHE/ITI.MHD/issues/274)).

La requête Patch contient l’identifiant métier de la ressource à modifier ainsi que la liste des mises à jour à effectuer.

Afin d’effectuer la demande de mise à jour sur l’identifiant métier et non l’identifiant logique de la ressource DocumentReference, le gestionnaire de partage de documents doit prendre en charge le « conditional Patch ».

Les corrections à apporter à la ressource peuvent être communiquées de trois manières différentes :
* [JSON patch](https://datatracker.ietf.org/doc/html/rfc6902) (status : Proposed standard),
* [XML patch](https://datatracker.ietf.org/doc/html/rfc5261) (status : Proposed standard),
* [FHIRPath Patch utilisant la ressource Parameters](https://www.hl7.org/fhir/R4/fhirpatch.html) (niveau de maturité : 2).

A noter que la méthode JSON patch est mature et plus adaptée à un usage en mobilité.

Lorsque toutes les modifications sont traitées, le serveur traite la fiche du document de la même façon qu’au cours d’une opération update créant ainsi une nouvelle version (modification des éléments `meta.versionId` et `meta.lastUpdated`). 

#### Mise à jour des extensions avec JSON Patch

Les règles suivantes s’appliquent lorsque la demande de mise à jour est transmise au format JSON Patch :

* **Adressage par index** : en JSON Patch, le chemin (`path`) d’une opération est un [JSON Pointer](https://datatracker.ietf.org/doc/html/rfc6901) qui désigne un élément de tableau par sa position et non par la valeur d’un de ses attributs. Une extension est donc désignée par sa position dans le tableau `extension` (par exemple `/extension/1/valueBoolean` pour la deuxième extension, les positions commençant à 0). Le producteur de documents doit au préalable lire la fiche pour connaître la position de l’extension à modifier.
* **Extension absente** : l’opération `replace` échoue si le chemin n’existe pas. Si l’extension n’est pas encore présente dans la fiche, elle doit être ajoutée avec l’opération `add` ; la position `-` ajoute l’élément à la fin du tableau :

```json
{
    "op":"add",
    "path":"/extension/-",
    "value":{
        "url":"https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-is-deleted",
        "valueBoolean":true
    }
}
```

* **Vérification de l’état de la fiche** : l’opération [`test`](https://datatracker.ietf.org/doc/html/rfc6902#section-4.6) ne modifie pas la fiche ; elle vérifie que la valeur d’un élément est celle attendue par le producteur de documents. Une demande JSON Patch étant atomique, si une opération `test` échoue, aucune des opérations de la demande n’est appliquée et la demande est rejetée. Ce mécanisme correspond à la vérification de l’annotation « OriginalStatus » par le registre dans le volet Partage de documents de santé.
* **Modification concurrente** : pour éviter qu’une modification intervenue entre la lecture de la fiche et la demande de mise à jour ne décale les positions des extensions, le producteur de documents doit transmettre l’en-tête HTTP [`If-Match`](https://www.hl7.org/fhir/R4/http.html#concurrency) contenant la valeur de l’[`ETag`](https://www.hl7.org/fhir/R4/http.html#versioning) obtenue lors de la lecture de la fiche. Si la fiche a été modifiée entre-temps, le gestionnaire de partage de documents rejette la demande.

A noter que le format FHIRPath Patch permet de désigner une extension par son URL (par exemple `extension.where(url='https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-is-deleted')`) et évite ainsi l’adressage par index.

Ci-dessous un exemple de requête avec le body en JSON pour la mise à jour du statut, du niveau de confidentialité et de l’archivage :

```
PATCH [base]/DocumentReference?identifier=http://my-lab-system|123 HTTP/1.1
Content-Type: application/json-patch+json
If-Match: W/"1"
```

```json
[
    {
        "op":"replace",
        "path":"/status",
        "value":"current"
    },
    {
        "op":"replace",
        "path":"/securityLabel",
        "value":"restricted"
    },
    {
        "op":"replace",
        "path":"/extension/0/valueBoolean",
        "value":true
    }
]
```

Dans cet exemple, l’extension PDSm_IsArchived (`https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-is-archived`) est en position 0 du tableau `extension` de la fiche.

Ci-dessous un exemple de requête avec le body en JSON pour la suppression logique de la fiche :

```
PATCH [base]/DocumentReference?identifier=http://my-lab-system|123 HTTP/1.1
Content-Type: application/json-patch+json
If-Match: W/"1"
```

```json
[
    {
        "op":"test",
        "path":"/status",
        "value":"current"
    },
    {
        "op":"replace",
        "path":"/status",
        "value":"superseded"
    },
    {
        "op":"replace",
        "path":"/extension/1/valueBoolean",
        "value":true
    }
]
```

Dans cet exemple, l’extension PDSm_IsDeleted (`https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-is-deleted`) est en position 1 du tableau `extension` de la fiche. L’opération `test` vérifie que la fiche est la version la plus récente (`status` = `current`) avant de la supprimer.

#### Suppression logique d’une fiche

La suppression logique d’une fiche correspond à la dépublication d’un document définie par le [volet Partage de documents de santé](https://esante.gouv.fr/sites/default/files/media_entity/documents/ci-sis_service_volet-partage-documents-sante_v1.16.4.pdf) (valeur « Deleted » de la métadonnée availabilityStatus en XDS). Elle est faite à la demande du patient ou d’un professionnel de santé ; la définition des acteurs habilités à la demander est du ressort du gestionnaire de partage de documents. Le document reste stocké par le gestionnaire de partage de documents mais n’est plus accessible.

Les règles suivantes s’appliquent :

* **Fiche concernée** : la demande de suppression porte sur la version la plus récente de la fiche (`DocumentReference.status` = `current`), archivée ou non. Une fiche dont le statut est `superseded` ne peut pas être supprimée directement : elle l’est uniquement par propagation (voir ci-dessous).
* **Mise à jour de la fiche** : la demande du producteur de documents positionne l’extension PDSm_IsDeleted à `true` et l’élément `DocumentReference.status` à `superseded`. À réception de la demande, le gestionnaire de partage de documents vérifie que ces deux valeurs sont bien demandées et, si la fiche était archivée, positionne l’extension PDSm_IsArchived à `false` : une fiche supprimée n’est plus considérée comme archivée.
* **Propagation aux versions antérieures** : la suppression s’applique à toutes les versions antérieures de la fiche :
  * les fiches remplacées, directement ou non, par la fiche supprimée (`DocumentReference.relatesTo.code` = `replaces`) : le gestionnaire de partage de documents positionne leur extension PDSm_IsDeleted à `true` ;
  * les versions historiques de la ressource DocumentReference de la fiche supprimée et des fiches remplacées (`meta.versionId`), créées par les mises à jour successives : elles ne sont plus accessibles par les interactions [vread](https://www.hl7.org/fhir/R4/http.html#vread) et [history](https://www.hl7.org/fhir/R4/http.html#history).
* **Suppression logique du document** : le document référencé par `DocumentReference.content.attachment.url` de la fiche supprimée et de ses versions antérieures n’est plus accessible (voir [Consultation d’un document](st_consultation.html)).
* **Inaccessibilité** : une fiche supprimée ne peut plus faire l’objet d’une mise à jour. De plus, dans le présent volet, une fiche supprimée n’est plus retournée par la recherche de fiches (voir [Recherche de fiches](st_recherche_fiche.html)) ; le volet Partage de documents de santé précisant uniquement que le document n’est plus accessible, cette règle est propre au présent volet.
* **Irréversibilité** : la suppression logique est définitive. L’extension PDSm_IsDeleted d’une fiche ne peut pas repasser à `false`.
* **Document transformé** : lorsque deux documents sont liés par une transformation (`DocumentReference.relatesTo.code` = `transforms`) et doivent être supprimés ensemble, le producteur de documents envoie une demande de suppression pour chacune des deux fiches.
* **Traçabilité** : la traçabilité des suppressions logiques doit être assurée par le gestionnaire de partage de documents, par exemple dans ses traces fonctionnelles.

Répercussion sur les lots de soumission et les classeurs :

Dans le volet Partage de documents de santé, la suppression logique d’une fiche fait passer à l’état « Deprecated » les associations qui la lient, ainsi que ses versions antérieures, à son lot de soumission et à ses classeurs (Tableau 1 et Tableau 3). Dans le présent volet, ces liens sont portés par l’élément `List.entry` du lot de soumission ([PDSm_SubmissionSetComprehensive](StructureDefinition-pdsm-submissionset-comprehensive.html)) et du classeur ([PDSm_FolderComprehensive](StructureDefinition-pdsm-folder-comprehensive.html)). Le profil MHD interdisant l’élément `List.entry.deleted`, la désactivation d’un lien se traduit par le retrait de l’entrée correspondante. Lors de la suppression logique d’une fiche, le gestionnaire de partage de documents :

* retire du lot de soumission de la fiche supprimée, et du lot de soumission de chacune de ses versions antérieures, l’entrée qui référence cette fiche ; les autres éléments du lot de soumission ne sont pas modifiés et le lot de soumission n’est pas supprimé ;
* retire de chaque classeur l’entrée qui référence la fiche supprimée ou l’une de ses versions antérieures, et met à jour l’élément `List.date` du classeur avec la date et l’heure de la suppression.

Le retrait d’une entrée est définitif.

### Flux 04 : résultat de la mise à jour des métadonnées de la fiche

Ce flux retourne le résultat de demande de modification des métadonnées de la fiche. La demande peut être un succès ou un échec.

Il doit être indiqué dans la réponse, le statut (succès ou échec) de la requête. Le contenu qui a été modifié est aussi retourné.

Il s'agit de la réponse à la demande de mise à jour des métadonnées de la fiche.

Le gestionnaire de partage de documents de santé retourne un "HTTP Status code" approprié au résultat de la mise à jour de chaque élément contenu dans la requête. Par exemple :

* Si la mise à jour de la ressource DocumentReference est correctement effectuée, un code HTTP 200 « OK » doit être retourné.
* Si la mise à jour de la ressource DocumentReference porte sur des éléments autres que status, securityLabel, PDSm_isArchived et PDSm_isDeleted, une erreur 405 « Method Not Allowed » doit être retournée.
* Si la fiche visée a été supprimée logiquement, elle est considérée comme inexistante : une erreur 404 « Not Found » doit être retournée.
* Si la demande de suppression logique porte sur une fiche qui n’est pas la version la plus récente, ou si une opération `test` échoue, une erreur 422 « Unprocessable Entity » doit être retournée. Ce code est celui prévu par [FHIR R4](https://www.hl7.org/fhir/R4/http.html#update) lorsque la demande enfreint les règles métier du serveur ; [FHIR R5](https://hl7.org/fhir/R5/http.html#patch) le précise explicitement pour l’échec d’une opération `test`.
* Si la valeur de l’en-tête `If-Match` ne correspond pas à la version courante de la fiche, une erreur 412 « Precondition Failed » doit être retournée.

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
