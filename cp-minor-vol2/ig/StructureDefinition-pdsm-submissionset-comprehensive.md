# PDSm SubmissionSet Comprehensive - Partage de Documents de Santé en mobilité (PDSm) v3.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PDSm SubmissionSet Comprehensive**

## Resource Profile: PDSm SubmissionSet Comprehensive 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-submissionset-comprehensive | *Version*:3.1.0 |
| Active as of 2026-01-13 | *Computable Name*:PDSm_SubmissionSetComprehensive |

 
Profil du lot de soumission dérivé de la ressource List et du profil IHE MHD « ComprehensiveSubmissionSet ». 

**Utilisations:**

* Utiliser ce Profil: [PDSm Comprehensive Provide Document Bundle](StructureDefinition-pdsm-comprehensive-provide-document-bundle.md) and [PDSm Find Lists Response](StructureDefinition-pdsm-find-lists-response.md)
* Exemples pour ce Profil: [List/ExampleSubmissionSet](List-ExampleSubmissionSet.md)
* CapabilityStatements utilisant ce Profil: [CI-SIS Partage-De-Documents-De-Sante - ConsommateurDeDocuments](CapabilityStatement-PDSm-ConsommateurDeDocuments.md) and [CI-SIS Partage-De-Documents-De-Sante - GestionnaireDePartageDeDocuments](CapabilityStatement-PDSm-GestionnaireDePartageDeDocuments.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.pdsm|current/StructureDefinition/pdsm-submissionset-comprehensive)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-pdsm-submissionset-comprehensive.csv), [Excel](StructureDefinition-pdsm-submissionset-comprehensive.xlsx), [Schematron](StructureDefinition-pdsm-submissionset-comprehensive.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "pdsm-submissionset-comprehensive",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-submissionset-comprehensive",
  "version" : "3.1.0",
  "name" : "PDSm_SubmissionSetComprehensive",
  "title" : "PDSm SubmissionSet Comprehensive",
  "status" : "active",
  "date" : "2026-01-13T16:04:44+00:00",
  "publisher" : "ANS",
  "contact" : [
    {
      "name" : "ANS",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://esante.gouv.fr"
        }
      ]
    }
  ],
  "description" : "Profil du lot de soumission dérivé de la ressource List et du profil IHE MHD « ComprehensiveSubmissionSet ».",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "FR",
          "display" : "FRANCE"
        }
      ]
    }
  ],
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "specmetier-to-PDSmSubmissionSetComprehensive",
      "name" : "Spécification métier vers le profil PDSm_SubmissionSetComprehensive"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "SubmissionSet-Mapping",
      "uri" : "XDS",
      "name" : "XDS and MHD Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "List",
  "baseDefinition" : "https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.SubmissionSet",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "List",
        "path" : "List",
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmSubmissionSetComprehensive",
            "map" : "LotDeSoumission"
          }
        ]
      },
      {
        "id" : "List.contained",
        "path" : "List.contained",
        "short" : "Ressource contenue. Dans le cadre de ce profil, il est obligatoire qu'il y ait au moins une ressource contenue : source ou source.extension[authorOrg]",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "List.extension:designationType",
        "path" : "List.extension",
        "sliceName" : "designationType",
        "short" : "Représente le type d’activité associé à l’événement clinique ayant abouti à la constitution du lot de soumission.",
        "constraint" : [
          {
            "key" : "constr-bind-designationtype",
            "severity" : "error",
            "human" : "Les valeurs possibles doivent provenir d’une des terminologies de référence suivantes : \n- TRE_A00-ProducteurDocNonPS, OID : 1.2.250.1.213.1.1.4.6 \n- TRE_R209-TypeActivite, OID : 1.2.250.1.213.2.2 \n- TRE_R02-SecteurActivite, OID : 1.2.250.1.71.4.2.4 Les valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J59-ContentTypeCode-DMP). \nEn l’absence de spécifications complémentaires, le jeu de valeurs JDV_J03-XdsContentTypeCode-CISIS peut être utilisé.",
            "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-submissionset-comprehensive"
          }
        ],
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmSubmissionSetComprehensive",
            "map" : "typeActivite : [1..1] Code"
          }
        ]
      },
      {
        "id" : "List.extension:designationType.value[x]",
        "path" : "List.extension.value[x]",
        "binding" : {
          "strength" : "preferred",
          "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J03-XdsContentTypeCode-CISIS/FHIR/JDV-J03-XdsContentTypeCode-CISIS"
        }
      },
      {
        "id" : "List.extension:sourceId",
        "path" : "List.extension",
        "sliceName" : "sourceId",
        "short" : "Représente l’identifiant unique global du système émetteur du lot de soumission.",
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmSubmissionSetComprehensive",
            "map" : "idSource : [0..1] Identifiant"
          }
        ]
      },
      {
        "id" : "List.extension:isArchived",
        "path" : "List.extension",
        "sliceName" : "isArchived",
        "short" : "Extension définie par ce volet pour distinguer les lots de soumission archivés des actives.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-is-archived"
            ]
          }
        ],
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmSubmissionSetComprehensive",
            "map" : "statut : [1..1] Code"
          }
        ]
      },
      {
        "id" : "List.extension:PDSmintendedRecipient",
        "path" : "List.extension",
        "sliceName" : "PDSmintendedRecipient",
        "short" : "Représente le destinataire du lot de soumission. Il peut s'agir d'un AsPractitioner associé à un AsPractitionerRole ou bien d'une AsOrganization.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-intended-recipient"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "List.extension:PDSmintendedRecipient.value[x]",
        "path" : "List.extension.value[x]",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitioner",
              "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitionerrole",
              "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-organization"
            ],
            "aggregation" : ["contained"]
          }
        ]
      },
      {
        "id" : "List.identifier:uniqueId",
        "path" : "List.identifier",
        "sliceName" : "uniqueId",
        "short" : "IdUnique : Identifiant unique global affecté à ce lot de soumission par son créateur. Cet attribut est utilisé à des fins de références externes alors que idLotSoumission est destiné à des fins de gestion interne.",
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmSubmissionSetComprehensive",
            "map" : "idUnique : [0..1] Identifiant"
          }
        ]
      },
      {
        "id" : "List.identifier:entryUUID",
        "path" : "List.identifier",
        "sliceName" : "entryUUID",
        "short" : "idLotSoumission : Identifiant unique du lot de soumission. Cet attribut est destiné à des fins de gestion interne alors que idUnique est utilisé à des fins de références externes.",
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmSubmissionSetComprehensive",
            "map" : "idLotSoumission : [0..*] Identifiant"
          }
        ]
      },
      {
        "id" : "List.status",
        "path" : "List.status",
        "short" : "Représente le statut du lot de soumission.",
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmSubmissionSetComprehensive",
            "map" : "statut : [1..1] Code"
          }
        ]
      },
      {
        "id" : "List.mode",
        "path" : "List.mode",
        "short" : "Mode de traitement qui s’applique au lot de soumission",
        "mustSupport" : true
      },
      {
        "id" : "List.title",
        "path" : "List.title",
        "short" : "Représente le titre du lot de soumission.",
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmSubmissionSetComprehensive",
            "map" : "titre : [0..1] Texte"
          }
        ]
      },
      {
        "id" : "List.code",
        "path" : "List.code",
        "short" : "Désigne le cas d’utilisation de la ressource List. Il s’agit ici du lot de soumission.",
        "mustSupport" : true
      },
      {
        "id" : "List.subject",
        "path" : "List.subject",
        "short" : "Référence vers la ressource Patient titulaire du dossier.",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient"
            ]
          }
        ],
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmSubmissionSetComprehensive",
            "map" : "idPatient : [0..1] Identifiant"
          }
        ]
      },
      {
        "id" : "List.date",
        "path" : "List.date",
        "short" : "Représente la date et heure de soumission.",
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmSubmissionSetComprehensive",
            "map" : "dateSoumission : [1..1] DateHeure"
          }
        ]
      },
      {
        "id" : "List.source",
        "path" : "List.source",
        "short" : "Représente l'auteur du lot de soumission. Si l'auteur est une organisation, utiliser l'extension authorOrg. Si l’auteur est une personne physique ou un dispositif, utiliser l’attribut source.reference .",
        "min" : 1,
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitionerrole",
              "http://hl7.org/fhir/StructureDefinition/Device",
              "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient"
            ],
            "aggregation" : ["contained"]
          }
        ]
      },
      {
        "id" : "List.source.extension:authorOrg",
        "path" : "List.source.extension",
        "sliceName" : "authorOrg",
        "short" : "Auteur organisationnel du document",
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmSubmissionSetComprehensive",
            "map" : "auteur : [1..1] Identifiant"
          }
        ]
      },
      {
        "id" : "List.source.extension:authorOrg.value[x]",
        "path" : "List.source.extension.value[x]",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-organization"
            ],
            "aggregation" : ["contained"]
          }
        ]
      },
      {
        "id" : "List.note",
        "path" : "List.note",
        "short" : "Représente les commentaires associés au lot de soumission.",
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmSubmissionSetComprehensive",
            "map" : "commentaire : [0..1] Texte"
          }
        ]
      },
      {
        "id" : "List.entry.item",
        "path" : "List.entry.item",
        "short" : "Représente la référence à la fiche d’un document faisant partie du classeur.",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference",
              "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-folder-comprehensive"
            ]
          }
        ],
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmSubmissionSetComprehensive",
            "map" : "Fiche : [0..*]"
          },
          {
            "identity" : "specmetier-to-PDSmSubmissionSetComprehensive",
            "map" : "Classeur : [0..*]"
          }
        ]
      }
    ]
  }
}

```
