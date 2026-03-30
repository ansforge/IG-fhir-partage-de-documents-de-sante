# fr-patient-123 - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **fr-patient-123**

## Example Patient: fr-patient-123

Profil: [FR Core Patient INS Profile](https://hl7.fr/ig/fhir/core/2.1.0/StructureDefinition-fr-core-patient-ins.html)

Martin Claire (official) Male, Date de Naissance :1980-01-15 ( NIR: 180017505600103 (use: official, ))

-------

| | |
| :--- | :--- |
| [Patient Birth Place](http://hl7.org/fhir/extensions/5.2.0/StructureDefinition-patient-birthPlace.html) | Paris |
| FR Core Patient Ident Reliability Extension: | * identityStatus: [FR Core CodeSystem v2-0445: VALI](https://hl7.fr/ig/fhir/core/2.1.0/CodeSystem-fr-core-cs-v2-0445.html#fr-core-cs-v2-0445-VALI) (Identité validée)
 |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "fr-patient-123",
  "meta" : {
    "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient-ins"]
  },
  "extension" : [{
    "extension" : [{
      "url" : "identityStatus",
      "valueCoding" : {
        "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0445",
        "code" : "VALI",
        "display" : "Identité validée"
      }
    }],
    "url" : "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-identity-reliability"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/patient-birthPlace",
    "valueAddress" : {
      "extension" : [{
        "url" : "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-address-insee-code",
        "valueCoding" : {
          "system" : "https://mos.esante.gouv.fr/NOS/TRE_R13-CommuneOM/FHIR/TRE-R13-CommuneOM",
          "code" : "75056"
        }
      }],
      "city" : "Paris"
    }
  }],
  "identifier" : [{
    "use" : "official",
    "type" : {
      "coding" : [{
        "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
        "code" : "INS-NIR",
        "display" : "NIR"
      }]
    },
    "system" : "urn:oid:1.2.250.1.213.1.4.8",
    "value" : "180017505600103"
  }],
  "name" : [{
    "extension" : [{
      "url" : "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient-birth-list-given-name",
      "valueString" : "Martin"
    }],
    "use" : "official",
    "family" : "Claire",
    "given" : ["Martin"]
  }],
  "gender" : "male",
  "birthDate" : "1980-01-15"
}

```
