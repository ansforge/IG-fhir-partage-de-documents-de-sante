# PDSm-List-authorOrg - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

## SearchParameter: PDSm-List-authorOrg 

 
Recherche sur l'auteur d'une organisation 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "PDSm-List-authorOrg",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/SearchParameter/PDSm-List-authorOrg",
  "version" : "3.1.1",
  "name" : "PDSmAuthorOrg",
  "status" : "active",
  "date" : "2026-06-24T09:41:20+00:00",
  "publisher" : "ANS",
  "contact" : [{
    "name" : "ANS",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Recherche sur l'auteur d'une organisation",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "purpose" : "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'auteur quand celui-ci correspond à une organisation",
  "code" : "authorOrg",
  "base" : ["List"],
  "type" : "reference",
  "expression" : "List.extension.where(url='https://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-authorOrg').value"
}

```
