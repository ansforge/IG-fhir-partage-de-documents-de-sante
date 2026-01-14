# Exemple de publication simplifiée PDSm - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Exemple de publication simplifiée PDSm**

## Example DocumentReference: Exemple de publication simplifiée PDSm

version : 1

Profil: [PDSm Simplified Publish Document Reference](StructureDefinition-pdsm-simplified-publish.md)

**masterIdentifier**: [Uniform Resource Identifier (URI)](http://terminology.hl7.org/6.5.0/NamingSystem-uri.html)/urn:uuid:abcd-efgh-ijkl-mnop

**status**: Current

**type**: Note d’évolution

**category**: Compte rendu

**subject**: [Martin Claire Male, Date de Naissance :1980-01-15](Patient-fr-patient-123.md)

**date**: 2025-04-30 09:30:00+0100

**author**: [PractitionerRole/practitionerrole-example](PractitionerRole/practitionerrole-example)

**authenticator**: [PractitionerRole/practitionerrole-example](PractitionerRole/practitionerrole-example)

**description**: Note d'évolution suite à une consultation de suivi.

> **content**

### Attachments

| | | | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| - | **ContentType** | **Language** | **Data** | **Size** | **Hash** | **Title** | **Creation** |
| * | application/pdf | French (Region=France) | `SGVsbG8gV29ybGQ=` | 250000 | `2jmj7l5rSw0yVb/vlWAYkK/YBwk=` | Note de suivi du 30 avril 2025 | 2025-04-29 17:00:00+0100 |

**format**:[TRE_A11_IheFormatCode: urn:ihe:iti:xds-sd:pdf:2008](https://interop.esante.gouv.fr/terminologies/1.4.0/CodeSystem-TRE-A11-IheFormatCode.html#TRE-A11-IheFormatCode-urn.58ihe.58iti.58xds-sd.58pdf.582008)(Document à corps non structuré en Pdf/A-1)

### Contexts

| | | |
| :--- | :--- | :--- |
| - | **FacilityType** | **PracticeSetting** |
| * | Centre de santé | Etablissement de santé |



## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "PDSmSimplifiedExample",
  "meta" : {
    "versionId" : "1",
    "profile" : [
      "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-simplified-publish"
    ]
  },
  "masterIdentifier" : {
    "system" : "urn:ietf:rfc:3986",
    "value" : "urn:uuid:abcd-efgh-ijkl-mnop"
  },
  "status" : "current",
  "type" : {
    "coding" : [
      {
        "system" : "http://loinc.org",
        "code" : "15507-7",
        "display" : "Note d’évolution"
      }
    ]
  },
  "category" : [
    {
      "coding" : [
        {
          "system" : "https://mos.esante.gouv.fr/NOS/TRE_A03-ClasseDocument/FHIR/TRE-A03-ClasseDocument",
          "code" : "10",
          "display" : "Compte rendu"
        }
      ]
    }
  ],
  "subject" : {
    "reference" : "Patient/fr-patient-123"
  },
  "date" : "2025-04-30T09:30:00+01:00",
  "author" : [
    {
      "reference" : "PractitionerRole/practitionerrole-example"
    }
  ],
  "authenticator" : {
    "reference" : "PractitionerRole/practitionerrole-example"
  },
  "description" : "Note d'évolution suite à une consultation de suivi.",
  "content" : [
    {
      "attachment" : {
        "contentType" : "application/pdf",
        "language" : "fr-FR",
        "data" : "SGVsbG8gV29ybGQ=",
        "size" : 250000,
        "hash" : "2jmj7l5rSw0yVb/vlWAYkK/YBwk=",
        "title" : "Note de suivi du 30 avril 2025",
        "creation" : "2025-04-29T17:00:00+01:00"
      },
      "format" : {
        "system" : "https://mos.esante.gouv.fr/NOS/TRE_A11-IheFormatCode/FHIR/TRE-A11-IheFormatCode",
        "code" : "urn:ihe:iti:xds-sd:pdf:2008",
        "display" : "Document à corps non structuré en Pdf/A-1"
      }
    }
  ],
  "context" : {
    "facilityType" : {
      "coding" : [
        {
          "system" : "https://mos.esante.gouv.fr/NOS/TRE_R02-SecteurActivite/FHIR/TRE-R02-SecteurActivite",
          "code" : "SA05",
          "display" : "Centre de santé"
        }
      ]
    },
    "practiceSetting" : {
      "coding" : [
        {
          "system" : "https://mos.esante.gouv.fr/NOS/TRE_A01-CadreExercice/FHIR/TRE-A01-CadreExercice",
          "code" : "ETABLISSEMENT",
          "display" : "Etablissement de santé"
        }
      ]
    }
  }
}

```
