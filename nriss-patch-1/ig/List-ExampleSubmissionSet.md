# Exemple de lot de soumission PDSm - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Exemple de lot de soumission PDSm**

## Example List: Exemple de lot de soumission PDSm

Profil: [PDSm SubmissionSet Comprehensive](StructureDefinition-pdsm-submissionset-comprehensive.md)

## Dossier de suivi post-opératoire

| | | | |
| :--- | :--- | :--- | :--- |
| Date : 2025-04-30 14:00:00+0100 | Mode : Working List | Statut : Current | Code : Submission Set |
| Sujet :[Martin Claire Male, Date de Naissance :1980-01-15](Patient-fr-patient-123.md)Source | | | |

note

> 

Suivi post-chirurgical – documents cliniques regroupés.


* **Éléments**: [DocumentReference : masterIdentifier = UUID:12345678-abcd-1234-abcd-1234567890ab; status = current; type = Résumé de sortie d’hospitalisation; category = Compte-rendu; date = 2025-04-29 12:00:00+0100; description = Compte rendu d’hospitalisation suite à une chirurgie.; securityLabel = Normal](DocumentReference-exemple-pdsm-documentreference.md)

-------

**Ressources contenues**

-------

version : 1; Dernière mise à jour : 2025-04-28 18:19:34+0200; Langue : fr; 

Information Source: [https://annuaire.sante.fr](https://annuaire.sante.fr)

Profils: [FR Core Practitioner Role](https://hl7.fr/ig/fhir/core/2.1.0/StructureDefinition-fr-core-practitioner-role.html), [AS Donnée Publique PractitionerRole Profile](https://interop.esante.gouv.fr/ig/fhir/annuaire/1.1.0/StructureDefinition-as-dp-practitionerrole.html)

**identifier**: `https://rpps.esante.gouv.fr`/1011848351 (utilisation : official, )

**active**: true

**practitioner**: [Practitioner/practitioner-example](Practitioner/practitioner-example)

**organization**: [Organization HOPITAL INTERCOMMUNAL DE LA PRESQU'ILE G](#hcExampleSubmissionSet/org-example)

**code**: Soignant, Libéral,indép,artisan,commerç, Adjoint

-------

version : 1; Dernière mise à jour : 2025-04-28 19:35:45+0200; Langue : fr; 

Information Source: [https://annuaire.sante.fr](https://annuaire.sante.fr)

Profils: [FR Core Organization Profile](https://hl7.fr/ig/fhir/core/2.1.0/StructureDefinition-fr-core-organization.html), [AS Donnée Publique Organization Profile](https://interop.esante.gouv.fr/ig/fhir/annuaire/1.1.0/StructureDefinition-as-dp-organization.html)

**identifier**: Identification nationale de structure définie par l’ANS dans le CI_SIS/2264403106 (utilisation : official, ), Identification de l'organisation au SIREN/264403106 (utilisation : official, )

**active**: true

**type**: Entité légale, Secteur non défini

**name**: HOPITAL INTERCOMMUNAL DE LA PRESQU'ILE G



## Resource Content

```json
{
  "resourceType" : "List",
  "id" : "ExampleSubmissionSet",
  "meta" : {
    "profile" : [
      "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-submissionset-comprehensive"
    ]
  },
  "contained" : [
    {
      "resourceType" : "PractitionerRole",
      "id" : "practitionerrole-example",
      "meta" : {
        "versionId" : "1",
        "lastUpdated" : "2025-04-28T18:19:34.908+02:00",
        "source" : "https://annuaire.sante.fr",
        "profile" : [
          "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner-role",
          "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-dp-practitionerrole"
        ]
      },
      "language" : "fr",
      "identifier" : [
        {
          "use" : "official",
          "system" : "https://rpps.esante.gouv.fr",
          "value" : "1011848351"
        }
      ],
      "active" : true,
      "practitioner" : {
        "reference" : "Practitioner/practitioner-example"
      },
      "organization" : {
        "reference" : "#org-example"
      },
      "code" : [
        {
          "coding" : [
            {
              "system" : "https://mos.esante.gouv.fr/NOS/TRE_R22-GenreActivite/FHIR/TRE-R22-GenreActivite",
              "code" : "GENR01"
            }
          ]
        },
        {
          "coding" : [
            {
              "system" : "https://mos.esante.gouv.fr/NOS/TRE_R23-ModeExercice/FHIR/TRE-R23-ModeExercice",
              "code" : "L"
            }
          ]
        },
        {
          "coding" : [
            {
              "system" : "https://mos.esante.gouv.fr/NOS/TRE_R21-Fonction/FHIR/TRE-R21-Fonction",
              "code" : "FON-05"
            }
          ]
        }
      ]
    },
    {
      "resourceType" : "Organization",
      "id" : "org-example",
      "meta" : {
        "extension" : [
          {
            "extension" : [
              {
                "url" : "systeme-information",
                "valueCode" : "CG"
              }
            ],
            "url" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-data-trace"
          }
        ],
        "versionId" : "1",
        "lastUpdated" : "2025-04-28T19:35:45.507+02:00",
        "source" : "https://annuaire.sante.fr",
        "profile" : [
          "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization",
          "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-dp-organization"
        ]
      },
      "language" : "fr",
      "identifier" : [
        {
          "use" : "official",
          "type" : {
            "coding" : [
              {
                "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
                "code" : "IDNST"
              }
            ]
          },
          "system" : "urn:oid:1.2.250.1.71.4.2.2",
          "value" : "2264403106"
        },
        {
          "use" : "official",
          "type" : {
            "coding" : [
              {
                "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
                "code" : "SIREN"
              }
            ]
          },
          "system" : "https://sirene.fr",
          "value" : "264403106"
        }
      ],
      "active" : true,
      "type" : [
        {
          "extension" : [
            {
              "url" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-organization-types",
              "valueCode" : "organizationType"
            }
          ],
          "coding" : [
            {
              "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-3307",
              "code" : "LEGAL-ENTITY"
            }
          ]
        },
        {
          "extension" : [
            {
              "url" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-organization-types",
              "valueCode" : "secteurActiviteRASS"
            }
          ],
          "coding" : [
            {
              "system" : "https://mos.esante.gouv.fr/NOS/TRE_R02-SecteurActivite/FHIR/TRE-R02-SecteurActivite",
              "code" : "SA43"
            }
          ]
        }
      ],
      "name" : "HOPITAL INTERCOMMUNAL DE LA PRESQU'ILE G"
    }
  ],
  "extension" : [
    {
      "url" : "https://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-designationType",
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "https://mos.esante.gouv.fr/NOS/TRE_R02-SecteurActivite/FHIR/TRE-R02-SecteurActivite",
            "code" : "SA05",
            "display" : "Centre de santé"
          }
        ]
      }
    },
    {
      "url" : "https://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-sourceId",
      "valueIdentifier" : {
        "system" : "urn:oid:1.2.250.1.213.1.1.1",
        "value" : "SRC-01"
      }
    },
    {
      "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-is-archived",
      "valueBoolean" : false
    },
    {
      "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-intended-recipient",
      "valueReference" : {
        "reference" : "#practitionerrole-example"
      }
    }
  ],
  "identifier" : [
    {
      "system" : "urn:ietf:rfc:3986",
      "value" : "urn:uuid:11111111-aaaa-bbbb-cccc-222222222222"
    },
    {
      "system" : "urn:ietf:rfc:3986",
      "value" : "urn:uuid:33333333-dddd-eeee-ffff-444444444444"
    }
  ],
  "status" : "current",
  "mode" : "working",
  "title" : "Dossier de suivi post-opératoire",
  "code" : {
    "coding" : [
      {
        "system" : "https://profiles.ihe.net/ITI/MHD/CodeSystem/MHDlistTypes",
        "code" : "submissionset",
        "display" : "Submission Set"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/fr-patient-123"
  },
  "date" : "2025-04-30T14:00:00+01:00",
  "source" : {
    "extension" : [
      {
        "url" : "https://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-authorOrg",
        "valueReference" : {
          "reference" : "#org-example"
        }
      }
    ],
    "reference" : "#practitionerrole-example"
  },
  "note" : [
    {
      "text" : "Suivi post-chirurgical – documents cliniques regroupés."
    }
  ],
  "entry" : [
    {
      "item" : {
        "reference" : "DocumentReference/exemple-pdsm-documentreference"
      }
    }
  ]
}

```
