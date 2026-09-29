# PDSm-DocumentReference-period-end - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

## SearchParameter: PDSm-DocumentReference-period-end 

 
Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément context.period.end correspondant à lobjet dateFinActe 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "PDSm-DocumentReference-period-end",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/SearchParameter/PDSm-DocumentReference-period-end",
  "version" : "3.1.1",
  "name" : "PDSmDocumentReferencePeriodEnd",
  "status" : "active",
  "date" : "2021-10-21T14:09:31.7181197+00:00",
  "publisher" : "ANS",
  "contact" : [{
    "name" : "ANS",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément context.period.end correspondant à lobjet dateFinActe",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "code" : "period-end",
  "base" : ["DocumentReference"],
  "type" : "date",
  "expression" : "DocumentReference.context.period.end",
  "multipleOr" : true,
  "multipleAnd" : true
}

```
