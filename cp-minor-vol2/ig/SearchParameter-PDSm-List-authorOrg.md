# PDSm-List-authorOrg - Partage de Documents de Santé en mobilité (PDSm) v3.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PDSm-List-authorOrg**

## SearchParameter: PDSm-List-authorOrg 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/pdsm/SearchParameter/PDSm-List-authorOrg | *Version*:3.1.0 |
| Active as of 2026-01-13 | *Computable Name*:PDSmAuthorOrg |

 
Recherche sur l'auteur d'une organisation 

 
Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'auteur quand celui-ci correspond à une organisation 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "PDSm-List-authorOrg",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/SearchParameter/PDSm-List-authorOrg",
  "version" : "3.1.0",
  "name" : "PDSmAuthorOrg",
  "status" : "active",
  "date" : "2026-01-13T18:51:31+00:00",
  "publisher" : "ANS",
  "contact" : [
    {
      "name" : "ANS",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://esante.gouv.fr"
        }
      ]
    }
  ],
  "description" : "Recherche sur l'auteur d'une organisation",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "FR",
          "display" : "FRANCE"
        }
      ]
    }
  ],
  "purpose" : "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'auteur quand celui-ci correspond à une organisation",
  "code" : "authorOrg",
  "base" : ["List"],
  "type" : "reference",
  "expression" : "List.extension.where(url='https://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-authorOrg').value"
}

```
