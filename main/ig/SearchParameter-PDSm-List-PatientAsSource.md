# PDSm-List-PatientAsSource - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PDSm-List-PatientAsSource**

## SearchParameter: PDSm-List-PatientAsSource 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/pdsm/SearchParameter/PDSm-List-PatientAsSource | *Version*:3.1.1 |
| Active as of 2021-07-30 | *Computable Name*:PDSmListPatientAsSource |

 
Paramètre de recherche chaîné créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément source:Patient.given et source:Patient.family 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "PDSm-List-PatientAsSource",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/SearchParameter/PDSm-List-PatientAsSource",
  "version" : "3.1.1",
  "name" : "PDSmListPatientAsSource",
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
  "description" : "Paramètre de recherche chaîné créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément source:Patient.given et source:Patient.family",
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
  "target" : ["Patient"],
  "multipleOr" : true,
  "multipleAnd" : true,
  "modifier" : ["exact", "contains"],
  "chain" : ["given", "family"]
}

```
