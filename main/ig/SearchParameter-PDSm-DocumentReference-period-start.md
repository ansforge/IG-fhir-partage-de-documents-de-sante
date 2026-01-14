# PDSm-DocumentReference-period-start - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PDSm-DocumentReference-period-start**

## SearchParameter: PDSm-DocumentReference-period-start 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/pdsm/SearchParameter/PDSm-DocumentReference-period-start | *Version*:3.1.1 |
| Active as of 2021-10-21 | *Computable Name*:PDSmDocumentReferencePeriodStart |

 
Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément context.period.start correspondant à lobjet dateDebutActe 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "PDSm-DocumentReference-period-start",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/SearchParameter/PDSm-DocumentReference-period-start",
  "version" : "3.1.1",
  "name" : "PDSmDocumentReferencePeriodStart",
  "status" : "active",
  "date" : "2021-10-21T14:10:19.3001986+00:00",
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
  "description" : "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément context.period.start correspondant à lobjet dateDebutActe",
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
  "code" : "period-start",
  "base" : ["DocumentReference"],
  "type" : "date",
  "expression" : "DocumentReference.context.period.start",
  "multipleOr" : true,
  "multipleAnd" : true
}

```
