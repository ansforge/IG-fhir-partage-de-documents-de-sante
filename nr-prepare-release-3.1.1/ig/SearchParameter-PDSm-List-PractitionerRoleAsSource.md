# PDSm-List-PractitionerRoleAsSource - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PDSm-List-PractitionerRoleAsSource**

## SearchParameter: PDSm-List-PractitionerRoleAsSource 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/pdsm/SearchParameter/PDSm-List-PractitionerRoleAsSource | *Version*:3.1.1 |
| Active as of 2021-07-30 | *Computable Name*:PDSmListPractitionerRoleAsSource |

 
Paramètre de recherche chaîné créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément source:PractitionerRole.practitioner:Practitioner.given et source:PractitionerRole.practitioner:Practitioner.family 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "PDSm-List-PractitionerRoleAsSource",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/SearchParameter/PDSm-List-PractitionerRoleAsSource",
  "version" : "3.1.1",
  "name" : "PDSmListPractitionerRoleAsSource",
  "derivedFrom" : "http://hl7.org/fhir/SearchParameter/List-source",
  "status" : "active",
  "date" : "2021-07-30",
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
  "description" : "Paramètre de recherche chaîné créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément source:PractitionerRole.practitioner:Practitioner.given et source:PractitionerRole.practitioner:Practitioner.family",
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
  "code" : "source",
  "base" : ["List"],
  "type" : "reference",
  "expression" : "List.source",
  "xpathUsage" : "normal",
  "target" : ["PractitionerRole"],
  "multipleOr" : true,
  "multipleAnd" : true,
  "modifier" : ["exact", "contains"],
  "chain" : [
    "partOf.practitioner.given",
    "partOf.practitioner.family",
    "partOf.givenEx",
    "partOf.familyEx"
  ]
}

```
