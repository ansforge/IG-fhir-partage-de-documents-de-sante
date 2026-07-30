# Exemple de publication simplifiée PDSm - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

## Example DocumentReference: Exemple de publication simplifiée PDSm



## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "PDSmSimplifiedExample",
  "meta" : {
    "versionId" : "1",
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-simplified-publish"]
  },
  "contained" : [{
    "resourceType" : "Patient",
    "id" : "sourcePatientInfo-example",
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
            "code" : "75056",
            "display" : "Paris"
          }
        }]
      }
    }],
    "identifier" : [{
      "type" : {
        "coding" : [{
          "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
          "code" : "INS-NIR-TEST"
        }]
      },
      "system" : "urn:oid:1.2.250.1.213.1.4.10",
      "value" : "180126978912536"
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
  }],
  "masterIdentifier" : {
    "system" : "urn:ietf:rfc:3986",
    "value" : "urn:uuid:abcd-efgh-ijkl-mnop"
  },
  "status" : "current",
  "type" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "15507-7",
      "display" : "CR de passage aux urgences"
    }]
  },
  "category" : [{
    "coding" : [{
      "system" : "https://mos.esante.gouv.fr/NOS/TRE_A03-ClasseDocument/FHIR/TRE-A03-ClasseDocument",
      "code" : "10",
      "display" : "Compte rendu"
    }]
  }],
  "subject" : {
    "reference" : "Patient/fr-patient-123"
  },
  "date" : "2025-04-30T09:30:00+01:00",
  "author" : [{
    "reference" : "PractitionerRole/practitionerrole-example"
  }],
  "authenticator" : {
    "reference" : "PractitionerRole/practitionerrole-example"
  },
  "custodian" : {
    "reference" : "Organization/org-example"
  },
  "description" : "Note d'évolution suite à une consultation de suivi.",
  "content" : [{
    "attachment" : {
      "contentType" : "application/pdf",
      "language" : "fr-FR",
      "data" : "SGVsbG8gV29ybGQ=",
      "size" : 11,
      "hash" : "Ck1VqNd45QIvq3AZd8XYQLvEhtA=",
      "title" : "Note de suivi du 30 avril 2025",
      "creation" : "2025-04-29T17:00:00+01:00"
    },
    "format" : {
      "system" : "https://mos.esante.gouv.fr/NOS/TRE_A11-IheFormatCode/FHIR/TRE-A11-IheFormatCode",
      "code" : "urn:ihe:iti:xds-sd:pdf:2008",
      "display" : "Document à corps non structuré en Pdf/A-1"
    }
  }],
  "context" : {
    "facilityType" : {
      "coding" : [{
        "system" : "https://mos.esante.gouv.fr/NOS/TRE_R02-SecteurActivite/FHIR/TRE-R02-SecteurActivite",
        "code" : "SA05",
        "display" : "Centre de santé"
      }]
    },
    "practiceSetting" : {
      "coding" : [{
        "system" : "https://mos.esante.gouv.fr/NOS/TRE_A01-CadreExercice/FHIR/TRE-A01-CadreExercice",
        "code" : "ETABLISSEMENT",
        "display" : "Etablissement de santé"
      }]
    },
    "sourcePatientInfo" : {
      "reference" : "#sourcePatientInfo-example"
    }
  }
}

```
