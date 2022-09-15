### Flux 03 : mise à jour des métadonnées de la fiche

Ce flux contient les informations relatives à la modification des métadonnées clés de la [fiche](StructureDefinition-PDSmComprehensiveDocumentReference.html) (statut, niveau de confidentialité et archivage). Cette demande de modification est faite par le producteur de documents. 

### Construction du flux 

Le flux de mise à jour des métadonnées de la fiche est basé sur l’interaction « [patch](https://www.hl7.org/fhir/http.html#patch) » de l’API REST FHIR qui est assurée par une requête HTTP PATCH. Elle permet la mise à jour partielle d’une ressource DocumentReference.

Au niveau applicatif, les mises à jour sont restreintes aux éléments DocumentReference.status, DocumentReference.securityLabel et l’extension PDSm_isArchived.

La requête Patch contient l’identifiant métier de la ressource à modifier ainsi que la liste des mises à jour à effectuer.

Afin d’effectuer la demande de mise à jour sur l’identifiant métier et non l’identifiant logique de la ressource DocumentReference, le gestionnaire de partage de documents doit prendre en charge le « conditional Patch ».

Les corrections à apporter à la ressource peuvent être communiquées de trois manières différentes :
* [JSON patch](https://datatracker.ietf.org/doc/html/rfc6902) (status : Proposed standard),
* [XML patch](https://datatracker.ietf.org/doc/html/rfc5261) (status : Proposed standard),
* [FHIRPath Patch utilisant la ressource Parameters](https://www.hl7.org/fhir/fhirpatch.html) (niveau de maturité : 2).

A noter que la méthode JSON patch est mature et plus adaptée à un usage en mobilité.

Lorsque toutes les modifications sont traitées, le serveur traite la [fiche](StructureDefinition-PDSmComprehensiveDocumentReference.html) du document de la même façon qu’au cours d’une opération update créant ainsi une nouvelle version (modification des éléments meta.versionId et meta.lastUpdated). 

Ci-dessous un exemple de requête avec le body en JSON : 
```
PATCH [base]/DocumentReference?identifier=http://my-lab-system|123 HTTP/1.1
Content-Type: application/json-patch+json
```

```json
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
        "path":"/extension[url:”http://esante.gouv.fr/cisis/fhir/StructureDefinition/PDSm_isArchived”]/valueBoolean", 
        "value":"true"
    }
]
```