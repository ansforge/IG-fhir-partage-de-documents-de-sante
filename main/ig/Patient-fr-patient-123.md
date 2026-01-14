# fr-patient-123 - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **fr-patient-123**

## Example Patient: fr-patient-123

Profil: [FR Core Patient Profile](https://hl7.fr/ig/fhir/core/2.1.0/StructureDefinition-fr-core-patient.html)

Martin Claire Male, Date de Naissance :1980-01-15

-------



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "fr-patient-123",
  "meta" : {
    "profile" : [
      "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient"
    ]
  },
  "name" : [
    {
      "family" : "Claire",
      "given" : ["Martin"]
    }
  ],
  "gender" : "male",
  "birthDate" : "1980-01-15"
}

```
