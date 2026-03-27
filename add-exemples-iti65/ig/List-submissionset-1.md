# List-submissionset1 - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **List-submissionset1**

## Example List: List-submissionset1

Profil: `https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-submissionset`

| | | |
| :--- | :--- | :--- |
| Mode : Working List | Statut : Current | Code : SubmissionSet as a FHIR List |
| Sujet :[Dee Schmidt Other, Date de Naissance :1923-07-25 ( http://#example.org/patients#mrn-1234)](Patient-patient-1.md) | | |

* **Éléments**: [DocumentReference/doc1](DocumentReference/doc1)



## Resource Content

```json
{
  "resourceType" : "List",
  "id" : "submissionset-1",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-submissionset"]
  },
  "status" : "current",
  "mode" : "working",
  "code" : {
    "coding" : [{
      "system" : "https://profiles.ihe.net/ITI/MHD/CodeSystem/MHDlistTypes",
      "code" : "submissionset"
    }]
  },
  "subject" : {
    "reference" : "Patient/patient-1"
  },
  "entry" : [{
    "item" : {
      "reference" : "DocumentReference/doc1"
    }
  }]
}

```
