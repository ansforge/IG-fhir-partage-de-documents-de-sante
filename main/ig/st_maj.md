# Mise à jour de documents - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Spécifications techniques - vue d'ensemble**](construction_des_flux.md)
* **Mise à jour de documents**

## Mise à jour de documents

Ce flux contient les informations relatives à la modification des métadonnées clés de la fiche (statut, niveau de confidentialité et archivage). Cette demande de modification est faite par le producteur de documents.

### Flux 03 : mise à jour des métadonnées de la fiche

Le flux de mise à jour des métadonnées de la fiche est basé sur l’interaction « [patch](https://www.hl7.org/fhir/R4/http.html#patch) » de l’API REST FHIR qui est assurée par une requête HTTP PATCH. Elle permet la mise à jour partielle d’une ressource DocumentReference.

Au niveau applicatif, les mises à jour sont restreintes aux éléments `DocumentReference.status`, `DocumentReference.securityLabel` et l’extension [PDSm_IsArchived](StructureDefinition-pdsm-ext-is-archived.md).

La requête Patch contient l’identifiant métier de la ressource à modifier ainsi que la liste des mises à jour à effectuer.

Afin d’effectuer la demande de mise à jour sur l’identifiant métier et non l’identifiant logique de la ressource DocumentReference, le gestionnaire de partage de documents doit prendre en charge le « conditional Patch ».

Les corrections à apporter à la ressource peuvent être communiquées de trois manières différentes :

* [JSON patch](https://datatracker.ietf.org/doc/html/rfc6902) (status : Proposed standard),
* [XML patch](https://datatracker.ietf.org/doc/html/rfc5261) (status : Proposed standard),
* [FHIRPath Patch utilisant la ressource Parameters](https://www.hl7.org/fhir/R4/fhirpatch.html) (niveau de maturité : 2).

A noter que la méthode JSON patch est mature et plus adaptée à un usage en mobilité.

Lorsque toutes les modifications sont traitées, le serveur traite la fiche du document de la même façon qu’au cours d’une opération update créant ainsi une nouvelle version (modification des éléments `meta.versionId` et `meta.lastUpdated`).

Ci-dessous un exemple de requête avec le body en JSON :

```
PATCH [base]/DocumentReference?identifier=http://my-lab-system|123 HTTP/1.1
Content-Type: application/json-patch+json

```

```
[
    {
        "op":"replace" ,
        "path":"/status" ,
        "value":"current "
    },
    {
        "op":"replace" , 
        "path":"/securtityLabel" , 
        "value":"restricted"
    },
    {   "op":"replace",
        "path":"/extension[url:”https://interop.esante.gouv.fr/ig/fhir/pdsm/SearchParameter/PDSm-isArchived”]/valueBoolean", 
        "value":"true"
    }
]

```

### Flux 04 : résultat de la mise à jour des métadonnées de la fiche

Ce flux retourne le résultat de demande de modification des métadonnées de la fiche. La demande peut être un succès ou un échec.

Il doit être indiqué dans la réponse, le statut (succès ou échec) de la requête. Le contenu qui a été modifié est aussi retourné.

Il s'agit de la réponse à la demande de mise à jour des métadonnées de la fiche.

Le gestionnaire de partage de documents de santé retourne un "HTTP Status code" approprié au résultat de la mise à jour de chaque élément contenu dans la requête. Par exemple :

* Si la mise à jour de la ressource DocumentReference est correctement effectuée, un code HTTP 200 « OK » doit être retourné.
* Si la mise à jour de la ressource DocumentReference porte sur des éléments autres que status, securityLabel et PDSm_isArchived, une erreur 405 « Method Not Allowed » doit être retournée.

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

