# DocumentReference-doc1 - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DocumentReference-doc1**

## Example DocumentReference: DocumentReference-doc1

Profil: `https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-documentreference`

**masterIdentifier**: [Uniform Resource Identifier (URI)](http://terminology.hl7.org/6.0.2/NamingSystem-uri.html)/urn:oid:1.2.250.1.213.1.1.11502 (utilisation : usual, )

**status**: Current

**type**: 11502-CR-BIO

**category**: CR

> **content**

### Attachments

| | | | |
| :--- | :--- | :--- | :--- |
| - | **ContentType** | **Url** | **Size** |
| * | application/pdf | urn:uuid:binary-cr-bio | 12345 |

**format**: [non précisé]: application/pdf (application/pdf)

### Contexts

| | | | |
| :--- | :--- | :--- | :--- |
| - | **FacilityType** | **PracticeSetting** | **SourcePatientInfo** |
| * | LABO | 01 | [Dee Schmidt Other, Date de Naissance :1923-07-25 ( http://#example.org/patients#mrn-1234)](Patient-patient-1.md) |



## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "docref-cr-bio",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-documentreference"]
  },
  "masterIdentifier" : {
    "use" : "usual",
    "system" : "urn:ietf:rfc:3986",
    "value" : "urn:oid:1.2.250.1.213.1.1.11502"
  },
  "status" : "current",
  "type" : {
    "coding" : [{
      "code" : "11502-CR-BIO"
    }]
  },
  "category" : [{
    "coding" : [{
      "code" : "CR"
    }]
  }],
  "content" : [{
    "attachment" : {
      "contentType" : "application/pdf",
      "url" : "urn:uuid:binary-cr-bio",
      "size" : 12345
    },
    "format" : {
      "code" : "application/pdf"
    }
  }],
  "context" : {
    "facilityType" : {
      "coding" : [{
        "code" : "LABO"
      }]
    },
    "practiceSetting" : {
      "coding" : [{
        "code" : "01"
      }]
    },
    "sourcePatientInfo" : {
      "reference" : "Patient/patient-1"
    }
  }
}

```
