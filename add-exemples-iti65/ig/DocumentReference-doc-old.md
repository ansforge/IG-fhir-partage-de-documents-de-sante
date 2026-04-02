# Exemple de DocumentReference existant - cible du remplacement - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Exemple de DocumentReference existant - cible du remplacement**

## Example DocumentReference: Exemple de DocumentReference existant - cible du remplacement

Profil: [PDSm Comprehensive DocumentReference](StructureDefinition-pdsm-comprehensive-document-reference.md)

**masterIdentifier**: [Uniform Resource Identifier (URI)](http://terminology.hl7.org/6.0.2/NamingSystem-uri.html)/urn:uuid:44444444-4444-4444-8444-444444444444

**status**: Superseded

**type**: Summary of episode note

**category**: Compte rendu

**subject**: [Martin Claire (official) Male, Date de Naissance :1980-01-15 ( NIR: 180017505600103 (use: official, ))](Patient-fr-patient-123.md)

**date**: 2025-01-01 10:00:00+0100

**author**: [PractitionerRole Soignant](#hcdoc-old/practitionerrole-example)

**authenticator**: [Organization HOPITAL INTERCOMMUNAL DE LA PRESQU'ILE G](#hcdoc-old/org-example)

**description**: Compte rendu de consultation - version initiale (remplacée)

**securityLabel**: Normal

> **content**

### Attachments

| | | | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| - | **ContentType** | **Language** | **Url** | **Size** | **Hash** | **Title** | **Creation** |
| * | application/pdf | Français (France) | [Binary: application/pdf (16 bytes base64)](Binary-6789.md) | 345678 | `2jmj7l5rSw0yVb/vlWAYkK/YBwk=` | CR Consultation - Version initiale | 2025-01-01 09:00:00+0100 |

**format**: [TRE_A11_IheFormatCode: urn:ihe:iti:xds-sd:pdf:2008](https://interop.esante.gouv.fr/terminologies/1.7.0/CodeSystem-TRE-A11-IheFormatCode.html#TRE-A11-IheFormatCode-urn.58ihe.58iti.58xds-sd.58pdf.582008) (xds-sd:pdf)

### Contexts

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Period** | **FacilityType** | **PracticeSetting** | **SourcePatientInfo** |
| * | 2025-01-01 08:00:00+0100 --> 2025-01-01 10:00:00+0100 | Etablissement public de santé | Etablissement de santé | [Martin Claire (official) Male, Date de Naissance :1980-01-15 ( NIR: 180017505600103 (use: official, ))](Patient-fr-patient-123.md) |

-------

> **Narratif généré : PractitionerRole #practitionerrole-example**  

version : 1; Dernière mise à jour : 2025-04-28 18:19:34+0200; Langue : fr; 

Information Source: [https://annuaire.sante.fr](https://annuaire.sante.fr)

Profils: [FR Core Practitioner Role](https://hl7.fr/ig/fhir/core/2.1.0/StructureDefinition-fr-core-practitioner-role.html), [AS Donnée Publique PractitionerRole Profile](https://interop.esante.gouv.fr/ig/fhir/annuaire/1.1.0/StructureDefinition-as-dp-practitionerrole.html)

**identifier**: `https://rpps.esante.gouv.fr`/1011848351 (utilisation : official, )**active**: true**practitioner**: [Practitioner/practitioner-example](Practitioner/practitioner-example)**organization**: [Organization HOPITAL INTERCOMMUNAL DE LA PRESQU'ILE G](#hcdoc-old/org-example)**code**: Soignant, Libéral,indép,artisan,commerç, Adjoint

-------

> **Narratif généré : Organisation #org-example**  

version : 1; Dernière mise à jour : 2025-04-28 19:35:45+0200; Langue : fr; 

Information Source: [https://annuaire.sante.fr](https://annuaire.sante.fr)

Profils: [FR Core Organization Profile](https://hl7.fr/ig/fhir/core/2.1.0/StructureDefinition-fr-core-organization.html), [AS Donnée Publique Organization Profile](https://interop.esante.gouv.fr/ig/fhir/annuaire/1.1.0/StructureDefinition-as-dp-organization.html)

**identifier**: Identification nationale de structure définie par l’ANS dans le CI_SIS/2264403106 (utilisation : official, ), Identification de l'organisation au SIREN/264403106 (utilisation : official, )**active**: true**type**: Entité légale, Secteur non défini**name**: HOPITAL INTERCOMMUNAL DE LA PRESQU'ILE G



## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "doc-old",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"]
  },
  "contained" : [{
    "resourceType" : "PractitionerRole",
    "id" : "practitionerrole-example",
    "meta" : {
      "versionId" : "1",
      "lastUpdated" : "2025-04-28T18:19:34.908+02:00",
      "source" : "https://annuaire.sante.fr",
      "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner-role",
      "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-dp-practitionerrole"]
    },
    "language" : "fr",
    "identifier" : [{
      "use" : "official",
      "system" : "https://rpps.esante.gouv.fr",
      "value" : "1011848351"
    }],
    "active" : true,
    "practitioner" : {
      "reference" : "Practitioner/practitioner-example"
    },
    "organization" : {
      "reference" : "#org-example"
    },
    "code" : [{
      "coding" : [{
        "system" : "https://mos.esante.gouv.fr/NOS/TRE_R22-GenreActivite/FHIR/TRE-R22-GenreActivite",
        "code" : "GENR01"
      }]
    },
    {
      "coding" : [{
        "system" : "https://mos.esante.gouv.fr/NOS/TRE_R23-ModeExercice/FHIR/TRE-R23-ModeExercice",
        "code" : "L"
      }]
    },
    {
      "coding" : [{
        "system" : "https://mos.esante.gouv.fr/NOS/TRE_R21-Fonction/FHIR/TRE-R21-Fonction",
        "code" : "FON-05"
      }]
    }]
  },
  {
    "resourceType" : "Organization",
    "id" : "org-example",
    "meta" : {
      "extension" : [{
        "extension" : [{
          "url" : "systeme-information",
          "valueCode" : "CG"
        }],
        "url" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-data-trace"
      }],
      "versionId" : "1",
      "lastUpdated" : "2025-04-28T19:35:45.507+02:00",
      "source" : "https://annuaire.sante.fr",
      "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization",
      "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-dp-organization"]
    },
    "language" : "fr",
    "identifier" : [{
      "use" : "official",
      "type" : {
        "coding" : [{
          "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
          "code" : "IDNST"
        }]
      },
      "system" : "urn:oid:1.2.250.1.71.4.2.2",
      "value" : "2264403106"
    },
    {
      "use" : "official",
      "type" : {
        "coding" : [{
          "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
          "code" : "SIREN"
        }]
      },
      "system" : "https://sirene.fr",
      "value" : "264403106"
    }],
    "active" : true,
    "type" : [{
      "extension" : [{
        "url" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-organization-types",
        "valueCode" : "organizationType"
      }],
      "coding" : [{
        "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-3307",
        "code" : "LEGAL-ENTITY"
      }]
    },
    {
      "extension" : [{
        "url" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-organization-types",
        "valueCode" : "secteurActiviteRASS"
      }],
      "coding" : [{
        "system" : "https://mos.esante.gouv.fr/NOS/TRE_R02-SecteurActivite/FHIR/TRE-R02-SecteurActivite",
        "code" : "SA43"
      }]
    }],
    "name" : "HOPITAL INTERCOMMUNAL DE LA PRESQU'ILE G"
  }],
  "masterIdentifier" : {
    "system" : "urn:ietf:rfc:3986",
    "value" : "urn:uuid:44444444-4444-4444-8444-444444444444"
  },
  "status" : "superseded",
  "type" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "34133-9"
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
  "date" : "2025-01-01T10:00:00+01:00",
  "author" : [{
    "reference" : "#practitionerrole-example"
  }],
  "authenticator" : {
    "reference" : "#org-example"
  },
  "description" : "Compte rendu de consultation - version initiale (remplacée)",
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
      "title" : "CR Consultation - Version initiale",
      "creation" : "2025-01-01T09:00:00+01:00"
    },
    "format" : {
      "system" : "https://mos.esante.gouv.fr/NOS/TRE_A11-IheFormatCode/FHIR/TRE-A11-IheFormatCode",
      "code" : "urn:ihe:iti:xds-sd:pdf:2008"
    }
  }],
  "context" : {
    "period" : {
      "start" : "2025-01-01T08:00:00+01:00",
      "end" : "2025-01-01T10:00:00+01:00"
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
