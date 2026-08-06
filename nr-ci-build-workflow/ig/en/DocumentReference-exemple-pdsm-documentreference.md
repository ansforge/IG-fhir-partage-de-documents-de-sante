# Exemple de DocumentReference pour PDSm - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

## Example DocumentReference: Exemple de DocumentReference pour PDSm



## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "exemple-pdsm-documentreference",
  "meta" : {
    "versionId" : "1",
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"]
  },
  "contained" : [{
    "resourceType" : "Practitioner",
    "id" : "practitioner-example",
    "meta" : {
      "lastUpdated" : "2025-04-28T18:19:26.335+02:00",
      "source" : "https://annuaire.sante.fr",
      "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner",
      "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-dp-practitioner"]
    },
    "language" : "fr",
    "extension" : [{
      "extension" : [{
        "url" : "type",
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "https://mos.esante.gouv.fr/NOS/TRE_R87-TypeCarte/FHIR/TRE-R87-TypeCarte",
            "code" : "CPS"
          }]
        }
      },
      {
        "url" : "number",
        "valueString" : "3100345668"
      },
      {
        "url" : "period",
        "valuePeriod" : {
          "start" : "2024-02-21",
          "end" : "2027-02-21"
        }
      }],
      "url" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-smartcard"
    }],
    "identifier" : [{
      "use" : "official",
      "type" : {
        "coding" : [{
          "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
          "code" : "IDNPS"
        }]
      },
      "system" : "urn:oid:1.2.250.1.71.4.2.1",
      "value" : "810101201234"
    },
    {
      "use" : "official",
      "type" : {
        "coding" : [{
          "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
          "code" : "RPPS"
        }]
      },
      "system" : "https://rpps.esante.gouv.fr",
      "value" : "10101201234"
    }],
    "active" : true,
    "name" : [{
      "text" : "Leclerc Sophie",
      "family" : "Leclerc",
      "given" : ["Sophie"],
      "prefix" : ["MME"],
      "suffix" : ["DR"]
    }],
    "telecom" : [{
      "extension" : [{
        "url" : "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-contact-point-email-type",
        "valueCoding" : {
          "system" : "https://mos.esante.gouv.fr/NOS/TRE_R256-TypeMessagerie/FHIR/TRE-R256-TypeMessagerie",
          "code" : "MSSANTE",
          "display" : "MSSANTE"
        }
      },
      {
        "extension" : [{
          "url" : "type",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "https://mos.esante.gouv.fr/NOS/TRE_R257-TypeBAL/FHIR/TRE-R257-TypeBAL",
              "code" : "PER"
            }]
          }
        },
        {
          "url" : "digitization",
          "valueBoolean" : false
        }],
        "url" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-mailbox-mss-metadata"
      }],
      "system" : "email",
      "value" : "sophie.leclerc@mssante.fr",
      "use" : "work"
    }],
    "qualification" : [{
      "code" : {
        "coding" : [{
          "system" : "https://mos.esante.gouv.fr/NOS/TRE_R14-TypeDiplome/FHIR/TRE-R14-TypeDiplome",
          "code" : "DE"
        },
        {
          "system" : "https://mos.esante.gouv.fr/NOS/TRE_R48-DiplomeEtatFrancais/FHIR/TRE-R48-DiplomeEtatFrancais",
          "code" : "DE11"
        }]
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "https://mos.esante.gouv.fr/NOS/TRE_R09-CategorieProfessionnelle/FHIR/TRE-R09-CategorieProfessionnelle",
          "code" : "C"
        },
        {
          "system" : "https://mos.esante.gouv.fr/NOS/TRE_G15-ProfessionSante/FHIR/TRE-G15-ProfessionSante",
          "code" : "70"
        }]
      }
    }]
  }],
  "masterIdentifier" : {
    "use" : "usual",
    "system" : "urn:ietf:rfc:3986",
    "value" : "urn:uuid:12345678-abcd-1234-abcd-1234567890ab"
  },
  "status" : "current",
  "type" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "34133-9",
      "display" : "Résumé de sortie d’hospitalisation"
    }]
  },
  "category" : [{
    "coding" : [{
      "system" : "https://mos.esante.gouv.fr/NOS/TRE_A03-ClasseDocument/FHIR/TRE-A03-ClasseDocument",
      "code" : "10",
      "display" : "Compte-rendu"
    }]
  }],
  "subject" : {
    "reference" : "Patient/fr-patient-123"
  },
  "date" : "2025-04-29T12:00:00+01:00",
  "author" : [{
    "reference" : "PractitionerRole/practitionerrole-example"
  }],
  "authenticator" : {
    "reference" : "Organization/org-example"
  },
  "custodian" : {
    "reference" : "Organization/org-example"
  },
  "description" : "Compte rendu d’hospitalisation suite à une chirurgie.",
  "securityLabel" : [{
    "coding" : [{
      "system" : "https://mos.esante.gouv.fr/NOS/TRE_A07-StatusVisibiliteDocument/FHIR/TRE-A07-StatusVisibiliteDocument",
      "code" : "N",
      "display" : "Normal"
    }]
  }],
  "content" : [{
    "attachment" : {
      "contentType" : "application/pdf",
      "language" : "fr-FR",
      "url" : "Binary/6789",
      "size" : 345678,
      "hash" : "2jmj7l5rSw0yVb/vlWAYkK/YBwk=",
      "title" : "CR Hospitalisation",
      "creation" : "2025-04-25T09:30:00+01:00"
    },
    "format" : {
      "system" : "https://mos.esante.gouv.fr/NOS/TRE_A11-IheFormatCode/FHIR/TRE-A11-IheFormatCode",
      "code" : "urn:ihe:lab:xd-lab:2008",
      "display" : "Compte rendu structuré d'examens de biologie médicale"
    }
  }],
  "context" : {
    "period" : {
      "start" : "2025-04-20T08:00:00+01:00",
      "end" : "2025-04-25T08:00:00+01:00"
    },
    "facilityType" : {
      "coding" : [{
        "system" : "https://mos.esante.gouv.fr/NOS/TRE_R02-SecteurActivite/FHIR/TRE-R02-SecteurActivite",
        "code" : "SA01",
        "display" : "Etablissement public de santé"
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
      "reference" : "Patient/fr-patient-123"
    }
  }
}

```
