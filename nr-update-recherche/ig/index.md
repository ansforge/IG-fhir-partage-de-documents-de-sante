# Accueil - Partage de Documents de Santé en mobilité (PDSm) v3.1.0

* [**Table of Contents**](toc.md)
* **Accueil**

## Accueil

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/pdsm/ImplementationGuide/ans.fhir.fr.pdsm | *Version*:3.1.0 |
| Active as of 2026-01-14 | *Computable Name*:PDSm |

 **PDSm Implementation Guide**
 This document presents the technical specifications of the “Partage de documents de santé en mobilité” section. This is a part of the service layer specifying the terms of document sharing without constraining them. The specifications related to health documents constitute the components of the business layer of CI-SIS. 

### Introduction

Ce document présente les spécifications techniques du volet "Partage de documents de santé en mobilité". Sa production est basée sur les Spécifications Fonctionnelles des Echanges du volet Partage de Documents de Santé et le profil [MHD](https://profiles.ihe.net/ITI/MHD/index.html) (Mobile access to Health Documents) défini par IHE (Integrating the Healthcare Entreprise).

Il s’agit d’un volet de la couche service spécifiant les modalités de partage de documents sans contraindre ces derniers. Les spécifications liées aux documents de santé constituent les volets de la couche métier du CI-SIS.

A noter que la dénomination du volet « Partage de documents de santé en mobilité » n’est pas restrictive. En effet, les standards sous-jacents aux spécifications techniques, par opposition au volet historique « Partage de documents de santé », permettent le déploiement de cas d'usage en mobilité mais ces spécifications peuvent également être mises en œuvre dans d'autres cas d'usage.

Ce document s'adresse aux personnes intervenant dans la mise en place des interfaces interopérables des systèmes implémentant le partage de documents de santé.

### Ressources FHIR et profils

Le tableau ci-après spécifie les profils utilisés pour les ressources et types de données mentionnés dans ce document.

| | |
| :--- | :--- |
| Titre du profil | Description |
| [PDSm Comprehensive DocumentReference](StructureDefinition-pdsm-comprehensive-document-reference.md) | Profil contenant les métadonnées du document ainsi que le lien vers la ressource Binary contenant le document dérivé de la ressource DocumentReference et du profil IHE MHD v4.0.1 "ComprehensiveDocumentReference" |
| [PDSm Comprehensive Provide Document Bundle](StructureDefinition-pdsm-comprehensive-provide-document-bundle.md) | Profil basé sur la transaction IHE "Provide Document Bundle [ITI-65]" du profil MHD ; le bundle est de type transaction et contient :* une ressource de type « List » représentant le lot de soumission,
* une à plusieurs ressources de type « DocumentReference », représentant les fiches de documents,
* zero à plusieurs ressources « Binary » représentant les documents envoyés dans le flux,
* zero à plusieurs ressources de type « List » représentant les classeurs. Dans le cas d’un dépôt d’un nouveau document, l’élément DocumentReference.content.attachment.url doit pointer vers une ressource Binary, représentant le document, présente dans le bundle. Dans le cas d’une demande de mise à jour d’un document par remplacement, l’élément DocumentReference.relatesTo doit être renseigné afin d’indiquer le lien avec un DocumentReference existant et de préciser la nature de la mise à jour. L’élément DocumentReference.content.attachment.url doit pointer vers une ressource Binary, représentant le document qui remplace l’ancien, présente dans le bundle. Dans le cas d’une mise à jour d’un classeur, comme List.status ou List.entry pour reclasser des documents, une nouvelle version de la ressource List est envoyée.
 |
| [PDSm Find DocumentReferences Comprehensive Response](StructureDefinition-pdsm-find-documentreferences-comprehensive-response.md) | Profil de réponse de la transaction IHE "Find Document References [ITI-67]" basée sur le bundle MHD FindDocumentReferencesComprehensiveResponseMessage |
| [PDSm Find Lists Response](StructureDefinition-pdsm-find-lists-response.md) | Profil de réponse de la transaction IHE "Find Document Lists [ITI-66]" basée sur le bundle MHD FindDocumentListsResponseMessage |
| [PDSm Folder Comprehensive](StructureDefinition-pdsm-folder-comprehensive.md) | Profil du Classeur dérivé de la ressource List et du profil IHE MHD « Comprehensive Folder ». |
| [PDSm Simplified Publish Document Reference](StructureDefinition-pdsm-simplified-publish.md) | Profil utilisé dans le cadre du flux 9 d'ajout simplifié de document. Le flux et le profil sont inspirés d’IHE MHD, transaction ITI-105.Contrairement au profil PDSm_ComprehensiveDocumentReference, le document est directement inclus dans DocumentReference.attachment.data et non dans une ressource « Binary » externe.La publication simplifiée est une simple requête HTTP POST d'une ressource DocumentReference conforme à ce profil. |
| [PDSm SubmissionSet Comprehensive](StructureDefinition-pdsm-submissionset-comprehensive.md) | Profil du lot de soumission dérivé de la ressource List et du profil IHE MHD « ComprehensiveSubmissionSet ». |

### Les flux

Un flux est un échange entre deux systèmes. Des flux ont été identifiés lors d'études métiers et définis, avec partage de ressources FHIR. Pour en savoir davantage, rendez-vous sur la page [construction des flux](construction_des_flux.md).

| | | |
| :--- | :--- | :--- |
| [Les flux 01 et 02](st_ajout.md) | AjoutLotDocument et ResultatAjoutLotDocument | Pour la demande d’ajout ou de remplacement d’un document au gestionnaire de partage de documents ainsi que le résultat de la demande |
| [Les flux 03 et 04](st_maj.md) | MiseAJourMetadonneeFiche et ResultatMAJMetadonneeFiche | Pour la modification de certaines métadonnées du document comme le statut ou le niveau de confidentialité ainsi que le résultat de la demande |
| [Les flux 05a et 06a](st_recherche_lot.md) | RechercheDocument et ResultatRechercheDocument | Pour la recherche de lot de documents à l'aide de critères de recherche ainsi que le résultat de la demande |
| [Les flux 05b et 06b](st_recherche_fiche.md) | RechercheDocument et ResultatRechercheDocument | Pour la recherche de fiches à l'aide de critères de recherche ainsi que le résultat de la demande |
| [Les flux 07 et 08](st_consultation.md) | DemandeConsultationDocument et ResultatDemandeConsultationDocument | Pour demander la consultation d'un ou de plusieurs document ainsi que le résultat de la demande |
| [Les flux 09 et 10](st_ajout_simplifie.md) | AjoutSimplifieDocument et ResultatAjoutSimplifieDocument | Pour publier un document de manière simplifiée ainsi que le résultat de la demande |

#### Alimentation utilisant Comprehensive Metadata

Les trois profils utilisés pour le flux d'alimentation sont :

* 1) la fiche document [PDSm_ComprehensiveDocumentReference](StructureDefinition-pdsm-comprehensive-document-reference.md),
* 2) le classeur [PDSm_FolderComprehensive](StructureDefinition-pdsm-folder-comprehensive.md),
* 3) le lot de soumission [PDSm_SubmissionSetComprehensive](StructureDefinition-pdsm-submissionset-comprehensive.md)

Ces trois profils doivent être encapsulés dans le [Bundle Comprehensive Provide Document](StructureDefinition-pdsm-comprehensive-provide-document-bundle.md).


#### Alimentation utilisant la publication simplifiée

La publication simplifiée utilise le profil [DocumentReference Simplified Publish](StructureDefinition-pdsm-simplified-publish.md).

#### Recherche par lot ou par fiche

Il existe deux profils Bundle permettent d'encapsuler les résultats de recherche.

* 1) Le bundle permettant de renvoyer les résultats d'une recherche de fiche [PDSm_FindDocumentReferencesComprehensiveResponse](StructureDefinition-pdsm-find-documentreferences-comprehensive-response.md),
* 2) Le bundle permettant de renvoyer les résultats d'une recherche de lot de soumission [PDSm_FindListsResponse](StructureDefinition-pdsm-find-lists-response.md)

### Dépendances

Plusieurs spécifications sont utilisées dans le cadre de ce volet :

* Ce volet met en place l’option du profil MHD « Comprehensive Metadata » qui permet aux acteurs d’échanger des métadonnées complètes répondant aux exigences définies dans le profil XDS.
* Le profil FHIR « FrPatient » publié par HL7 France (Interop'Santé) est utilisé dans ce volet. Les présentes spécifications se basent sur les profils du package hl7.fhir.fr.core.
* Dans le cadre de l’annuaire santé, l’ANS met à disposition un service national de publication des données des professionnels et des structures au format FHIR; les profils de l’annuaire santé, à savoir « AsPractitionerRoleProfile », « AsPractitionerProfile » et « AsOrganizationProfile » sont utilisés.
* Des ressources standards (Device, Binary) pourront également être utilisées pour compléter les profils définis.

Une [mise en équivalence](equivalences.md) entre les acteurs et les flux identifiés dans les SFE-PDS et ceux présentés dans le profil MHD est disponible.














## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "ans.fhir.fr.pdsm",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/ImplementationGuide/ans.fhir.fr.pdsm",
  "version" : "3.1.0",
  "name" : "PDSm",
  "title" : "Partage de Documents de Santé en mobilité (PDSm)",
  "status" : "active",
  "date" : "2026-01-14T15:22:36+00:00",
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
  "packageId" : "ans.fhir.fr.pdsm",
  "license" : "CC0-1.0",
  "fhirVersion" : ["4.0.1"],
  "dependsOn" : [
    {
      "id" : "hl7tx",
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
          "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
        }
      ],
      "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
      "packageId" : "hl7.terminology.r4",
      "version" : "7.0.1"
    },
    {
      "id" : "hl7ext",
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
          "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
        }
      ],
      "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
      "packageId" : "hl7.fhir.uv.extensions.r4",
      "version" : "5.2.0"
    },
    {
      "id" : "ihe_iti_mhd",
      "uri" : "https://profiles.ihe.net/ITI/MHD/ImplementationGuide/ihe.iti.mhd",
      "packageId" : "ihe.iti.mhd",
      "version" : "4.2.0"
    },
    {
      "id" : "ans_fhir_fr_annuaire",
      "uri" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/ImplementationGuide/ans.fhir.fr.annuaire",
      "packageId" : "ans.fhir.fr.annuaire",
      "version" : "1.1.0"
    },
    {
      "id" : "hl7_fhir_fr_core",
      "uri" : "https://hl7.fr/ig/fhir/core/ImplementationGuide/hl7.fhir.fr.core",
      "packageId" : "hl7.fhir.fr.core",
      "version" : "2.1.0"
    },
    {
      "id" : "ans_fr_terminologies",
      "uri" : "https://interop.esante.gouv.fr/terminologies/ImplementationGuide/ans.fr.terminologies",
      "packageId" : "ans.fr.terminologies",
      "version" : "1.4.0"
    }
  ],
  "definition" : {
    "extension" : [
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "copyrightyear"
          },
          {
            "url" : "value",
            "valueString" : "2020+"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "releaselabel"
          },
          {
            "url" : "value",
            "valueString" : "trial-use"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "shownav"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "autoload-resources"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-liquid"
          },
          {
            "url" : "value",
            "valueString" : "template/liquid"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-liquid"
          },
          {
            "url" : "value",
            "valueString" : "input/liquid"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-qa"
          },
          {
            "url" : "value",
            "valueString" : "temp/qa"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-temp"
          },
          {
            "url" : "value",
            "valueString" : "temp/pages"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-output"
          },
          {
            "url" : "value",
            "valueString" : "output"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-suppressed-warnings"
          },
          {
            "url" : "value",
            "valueString" : "input/ignoreWarnings.txt"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-history"
          },
          {
            "url" : "value",
            "valueString" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/history.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "template-html"
          },
          {
            "url" : "value",
            "valueString" : "template-page.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "template-md"
          },
          {
            "url" : "value",
            "valueString" : "template-page-md.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-contact"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-context"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-copyright"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-jurisdiction"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-license"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-publisher"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-version"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-wg"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "active-tables"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "fmm-definition"
          },
          {
            "url" : "value",
            "valueString" : "http://hl7.org/fhir/versions.html#maturity"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "propagate-status"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "excludelogbinaryformat"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "tabbed-snapshots"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
        "valueCode" : "hl7.fhir.uv.tools.r4#0.9.0"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "copyrightyear"
          },
          {
            "url" : "value",
            "valueString" : "2020+"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "releaselabel"
          },
          {
            "url" : "value",
            "valueString" : "trial-use"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "shownav"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "autoload-resources"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-liquid"
          },
          {
            "url" : "value",
            "valueString" : "template/liquid"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-liquid"
          },
          {
            "url" : "value",
            "valueString" : "input/liquid"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-qa"
          },
          {
            "url" : "value",
            "valueString" : "temp/qa"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-temp"
          },
          {
            "url" : "value",
            "valueString" : "temp/pages"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-output"
          },
          {
            "url" : "value",
            "valueString" : "output"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-suppressed-warnings"
          },
          {
            "url" : "value",
            "valueString" : "input/ignoreWarnings.txt"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-history"
          },
          {
            "url" : "value",
            "valueString" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/history.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "template-html"
          },
          {
            "url" : "value",
            "valueString" : "template-page.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "template-md"
          },
          {
            "url" : "value",
            "valueString" : "template-page-md.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-contact"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-context"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-copyright"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-jurisdiction"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-license"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-publisher"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-version"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-wg"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "active-tables"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "fmm-definition"
          },
          {
            "url" : "value",
            "valueString" : "http://hl7.org/fhir/versions.html#maturity"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "propagate-status"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "excludelogbinaryformat"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "tabbed-snapshots"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      }
    ],
    "resource" : [
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CapabilityStatement"
          }
        ],
        "reference" : {
          "reference" : "CapabilityStatement/PDSm-ConsommateurDeDocuments"
        },
        "name" : "CI-SIS Partage-De-Documents-De-Sante - ConsommateurDeDocuments",
        "description" : "Il s’agit d’un système d’information ou d’un composant de système d’information qui recherche des documents selon certains critères, et qui peut consulter les documents qui l’intéressent.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CapabilityStatement"
          }
        ],
        "reference" : {
          "reference" : "CapabilityStatement/PDSm-GestionnaireDePartageDeDocuments"
        },
        "name" : "CI-SIS Partage-De-Documents-De-Sante - GestionnaireDePartageDeDocuments",
        "description" : "Il s’agit d’un système d’information ou d’un composant d'un système d’information qui stocke, classe et archive les documents d’un dossier patient.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CapabilityStatement"
          }
        ],
        "reference" : {
          "reference" : "CapabilityStatement/PDSm-ProducteurDeDocuments"
        },
        "name" : "CI-SIS Partage-De-Documents-De-Sante - ProducteurDeDocuments",
        "description" : "Il s’agit d’un système d’information ou d’un composant de système d’information qui envoie au gestionnaire de partage de documents une  demande d’ajout de nouveaux documents et/ou des nouvelles versions de documents. Ce système fournit également les modifications des  métadonnées du document.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Bundle"
          }
        ],
        "reference" : {
          "reference" : "Bundle/a9c10f8a-882d-4000-a280-7150e0aeb478"
        },
        "name" : "Exemple de bundle de type transaction-response du flux 2",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "List"
          }
        ],
        "reference" : {
          "reference" : "List/ExampleFolder"
        },
        "name" : "Exemple de Classeur PDSm",
        "description" : "Exemple d’une instance conforme au profil PDSm_FolderComprehensive regroupant des fiches de documents.",
        "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-folder-comprehensive"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "DocumentReference"
          }
        ],
        "reference" : {
          "reference" : "DocumentReference/exemple-pdsm-documentreference"
        },
        "name" : "Exemple de DocumentReference pour PDSm",
        "description" : "Exemple illustratif d’un DocumentReference conforme au profil PDSm_ComprehensiveDocumentReference.",
        "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "List"
          }
        ],
        "reference" : {
          "reference" : "List/ExampleSubmissionSet"
        },
        "name" : "Exemple de lot de soumission PDSm",
        "description" : "Exemple conforme au profil PDSm_SubmissionSetComprehensive.",
        "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-submissionset-comprehensive"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "DocumentReference"
          }
        ],
        "reference" : {
          "reference" : "DocumentReference/PDSmSimplifiedExample"
        },
        "name" : "Exemple de publication simplifiée PDSm",
        "description" : "Note d'évolution suite à une consultation de suivi.",
        "exampleCanonical" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-simplified-publish"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Binary"
          }
        ],
        "reference" : {
          "reference" : "Binary/6789"
        },
        "name" : "Exemple de ressource Binary - Fichier PDF",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Patient"
          }
        ],
        "reference" : {
          "reference" : "Patient/fr-patient-123"
        },
        "name" : "fr-patient-123",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Organization"
          }
        ],
        "reference" : {
          "reference" : "Organization/org-example"
        },
        "name" : "org-example",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/pdsm-comprehensive-document-reference"
        },
        "name" : "PDSm Comprehensive DocumentReference",
        "description" : "Profil contenant les métadonnées du document ainsi que le lien vers la ressource Binary contenant le document dérivé de la ressource DocumentReference et du profil IHE MHD v4.0.1 \"ComprehensiveDocumentReference\"",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/pdsm-comprehensive-provide-document-bundle"
        },
        "name" : "PDSm Comprehensive Provide Document Bundle",
        "description" : "Profil basé sur la transaction IHE \"Provide Document Bundle [ITI-65]\" du profil MHD ; le bundle est de type transaction et contient : \n- une ressource de type « List » représentant le lot de soumission,\n- une à plusieurs ressources de type « DocumentReference », représentant les fiches de documents,\n- zero à plusieurs ressources « Binary » représentant les documents envoyés dans le flux,\n- zero à plusieurs ressources de type « List » représentant les classeurs.\nDans le cas d’un dépôt d’un nouveau document, l’élément DocumentReference.content.attachment.url doit pointer vers une ressource Binary, représentant le document, présente dans le bundle.\nDans le cas d’une demande de mise à jour d’un document par remplacement, l’élément DocumentReference.relatesTo doit être renseigné afin d’indiquer le lien avec un DocumentReference existant et de préciser la nature de la mise à jour. L’élément DocumentReference.content.attachment.url doit pointer vers une ressource Binary, représentant le document qui remplace l’ancien, présente dans le bundle.\nDans le cas d’une mise à jour d’un classeur, comme List.status ou List.entry pour reclasser des documents, une nouvelle version de la ressource List est envoyée.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/pdsm-find-documentreferences-comprehensive-response"
        },
        "name" : "PDSm Find DocumentReferences Comprehensive Response",
        "description" : "Profil de réponse de la transaction IHE \"Find Document References [ITI-67]\" basée sur le bundle MHD FindDocumentReferencesComprehensiveResponseMessage",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/pdsm-find-lists-response"
        },
        "name" : "PDSm Find Lists Response",
        "description" : "Profil de réponse de la transaction IHE \"Find Document Lists [ITI-66]\" basée sur le bundle MHD FindDocumentListsResponseMessage",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/pdsm-folder-comprehensive"
        },
        "name" : "PDSm Folder Comprehensive",
        "description" : "Profil du Classeur dérivé de la ressource List et du profil IHE MHD « Comprehensive Folder ».",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/pdsm-simplified-publish"
        },
        "name" : "PDSm Simplified Publish Document Reference",
        "description" : "Profil utilisé dans le cadre du flux 9 d'ajout simplifié de document. Le flux et le profil sont inspirés d’IHE MHD, transaction ITI-105.\n\nContrairement au profil PDSm_ComprehensiveDocumentReference, le document est directement inclus dans DocumentReference.attachment.data et non dans une ressource « Binary » externe.\n\nLa publication simplifiée est une simple requête HTTP POST d'une ressource DocumentReference conforme à ce profil.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/pdsm-submissionset-comprehensive"
        },
        "name" : "PDSm SubmissionSet Comprehensive",
        "description" : "Profil du lot de soumission dérivé de la ressource List et du profil IHE MHD « ComprehensiveSubmissionSet ».",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "SearchParameter"
          }
        ],
        "reference" : {
          "reference" : "SearchParameter/PDSm-DocumentReference-period-end"
        },
        "name" : "PDSm-DocumentReference-period-end",
        "description" : "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément context.period.end correspondant à lobjet dateFinActe",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "SearchParameter"
          }
        ],
        "reference" : {
          "reference" : "SearchParameter/PDSm-DocumentReference-period-start"
        },
        "name" : "PDSm-DocumentReference-period-start",
        "description" : "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément context.period.start correspondant à lobjet dateDebutActe",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "SearchParameter"
          }
        ],
        "reference" : {
          "reference" : "SearchParameter/PDSm-isArchived"
        },
        "name" : "PDSm-isArchived",
        "description" : "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère derecherche l'élément isArchived qui permet distinguer les lots de soumission et les fiches archivés des actives.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "SearchParameter"
          }
        ],
        "reference" : {
          "reference" : "SearchParameter/PDSm-List-authorOrg"
        },
        "name" : "PDSm-List-authorOrg",
        "description" : "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément sourceId",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "SearchParameter"
          }
        ],
        "reference" : {
          "reference" : "SearchParameter/PDSm-List-PatientAsSource"
        },
        "name" : "PDSm-List-PatientAsSource",
        "description" : "Paramètre de recherche chaîné créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément source:Patient.given et source:Patient.family",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "SearchParameter"
          }
        ],
        "reference" : {
          "reference" : "SearchParameter/PDSm-List-PatientAsSubject"
        },
        "name" : "PDSm-List-PatientAsSubject",
        "description" : "Paramètre de recherche chaîné créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément subject:Patient.identifier",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "SearchParameter"
          }
        ],
        "reference" : {
          "reference" : "SearchParameter/PDSm-List-PractitionerRoleAsSource"
        },
        "name" : "PDSm-List-PractitionerRoleAsSource",
        "description" : "Paramètre de recherche chaîné créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément source:PractitionerRole.practitioner:Practitioner.given et source:PractitionerRole.practitioner:Practitioner.family",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/pdsm-ext-intended-recipient"
        },
        "name" : "PDSm_intendedRecipient",
        "description" : "Représente le destinataire du lot de soumission",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/pdsm-ext-is-archived"
        },
        "name" : "PDSm_isArchived",
        "description" : "Extension définie par le volet ANS \"Volet Partage de documents de santé en mobilité\" sur les ressources List et DocumentReference pour distinguer les lots de soumission et les fiches archivés des actives.",
        "exampleBoolean" : false
      }
    ],
    "page" : {
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "toc.html"
        }
      ],
      "nameUrl" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "index.html"
            }
          ],
          "nameUrl" : "index.html",
          "title" : "Accueil",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "specifications_fonctionnelles.html"
            }
          ],
          "nameUrl" : "specifications_fonctionnelles.html",
          "title" : "Spécifications fonctionnelles - vue d'ensemble",
          "generation" : "markdown",
          "page" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "sf_ajout.html"
                }
              ],
              "nameUrl" : "sf_ajout.html",
              "title" : "Ajout d'un lot de documents",
              "generation" : "markdown"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "sf_maj.html"
                }
              ],
              "nameUrl" : "sf_maj.html",
              "title" : "Mise à jour de documents",
              "generation" : "markdown"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "sf_recherche.html"
                }
              ],
              "nameUrl" : "sf_recherche.html",
              "title" : "Recherche de documents",
              "generation" : "markdown"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "sf_consultation.html"
                }
              ],
              "nameUrl" : "sf_consultation.html",
              "title" : "Consultation de documents",
              "generation" : "markdown"
            }
          ]
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "construction_des_flux.html"
            }
          ],
          "nameUrl" : "construction_des_flux.html",
          "title" : "Spécifications techniques - vue d'ensemble",
          "generation" : "markdown",
          "page" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "st_ajout.html"
                }
              ],
              "nameUrl" : "st_ajout.html",
              "title" : "Ajout d'un lot de documents (ITI-65)",
              "generation" : "markdown"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "st_maj.html"
                }
              ],
              "nameUrl" : "st_maj.html",
              "title" : "Mise à jour de documents",
              "generation" : "markdown"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "st_recherche_lot.html"
                }
              ],
              "nameUrl" : "st_recherche_lot.html",
              "title" : "Recherche de lot de soumission (ITI-66)",
              "generation" : "markdown"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "st_recherche_fiche.html"
                }
              ],
              "nameUrl" : "st_recherche_fiche.html",
              "title" : "Recherche de fiche (ITI-67)",
              "generation" : "markdown"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "st_consultation.html"
                }
              ],
              "nameUrl" : "st_consultation.html",
              "title" : "Consultation de documents (ITI-68)",
              "generation" : "markdown"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "st_ajout_simplifie.html"
                }
              ],
              "nameUrl" : "st_ajout_simplifie.html",
              "title" : "Ajout simplifié d'un document (ITI-105)",
              "generation" : "markdown"
            }
          ]
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "autres_ressources.html"
            }
          ],
          "nameUrl" : "autres_ressources.html",
          "title" : "Autres Ressources",
          "generation" : "markdown",
          "page" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "securite.html"
                }
              ],
              "nameUrl" : "securite.html",
              "title" : "Sécurité",
              "generation" : "markdown"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "equivalences.html"
                }
              ],
              "nameUrl" : "equivalences.html",
              "title" : "Equivalences",
              "generation" : "markdown"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
                  "valueUrl" : "downloads.html"
                }
              ],
              "nameUrl" : "downloads.html",
              "title" : "Téléchargements et usages",
              "generation" : "markdown"
            }
          ]
        }
      ]
    },
    "parameter" : [
      {
        "code" : "path-resource",
        "value" : "input/capabilities"
      },
      {
        "code" : "path-resource",
        "value" : "input/examples"
      },
      {
        "code" : "path-resource",
        "value" : "input/extensions"
      },
      {
        "code" : "path-resource",
        "value" : "input/models"
      },
      {
        "code" : "path-resource",
        "value" : "input/operations"
      },
      {
        "code" : "path-resource",
        "value" : "input/profiles"
      },
      {
        "code" : "path-resource",
        "value" : "input/resources"
      },
      {
        "code" : "path-resource",
        "value" : "input/vocabulary"
      },
      {
        "code" : "path-resource",
        "value" : "input/maps"
      },
      {
        "code" : "path-resource",
        "value" : "input/testing"
      },
      {
        "code" : "path-resource",
        "value" : "input/history"
      },
      {
        "code" : "path-resource",
        "value" : "fsh-generated/resources"
      },
      {
        "code" : "path-pages",
        "value" : "template/config"
      },
      {
        "code" : "path-pages",
        "value" : "input/images"
      },
      {
        "code" : "path-tx-cache",
        "value" : "input-cache/txcache"
      }
    ]
  }
}

```
