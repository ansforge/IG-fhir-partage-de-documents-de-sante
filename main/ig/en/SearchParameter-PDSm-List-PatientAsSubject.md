# PDSm-List-PatientAsSubject - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

## SearchParameter: PDSm-List-PatientAsSubject 

 
Paramètre de recherche chaîné créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément subject:Patient.identifier 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "PDSm-List-PatientAsSubject",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/SearchParameter/PDSm-List-PatientAsSubject",
  "version" : "3.1.1",
  "name" : "PDSmListPatientAsSubject",
  "derivedFrom" : "http://hl7.org/fhir/SearchParameter/clinical-patient",
  "status" : "active",
  "date" : "2021-07-30",
  "publisher" : "ANS",
  "contact" : [{
    "name" : "ANS",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Paramètre de recherche chaîné créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément subject:Patient.identifier",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "code" : "patient",
  "base" : ["List"],
  "type" : "reference",
  "expression" : "List.subject.where(resolve() is Patient)",
  "multipleOr" : true,
  "multipleAnd" : true,
  "modifier" : ["missing", "type", "identifier"],
  "chain" : ["identifier"]
}

```
