# PDSm Simplified Publish Document Reference - Partage de Documents de Santé en mobilité (PDSm) v3.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PDSm Simplified Publish Document Reference**

## Resource Profile: PDSm Simplified Publish Document Reference 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-simplified-publish | *Version*:3.1.0 |
| Active as of 2026-01-13 | *Computable Name*:PDSm_SimplifiedPublish |

 
Profil utilisé dans le cadre du flux 9 d'ajout simplifié de document. Le flux et le profil sont inspirés d’IHE MHD, transaction ITI-105. 
Contrairement au profil PDSm_ComprehensiveDocumentReference, le document est directement inclus dans DocumentReference.attachment.data et non dans une ressource « Binary » externe. 
La publication simplifiée est une simple requête HTTP POST d'une ressource DocumentReference conforme à ce profil. 

**Utilisations:**

* Exemples pour ce Profil: [DocumentReference/PDSmSimplifiedExample](DocumentReference-PDSmSimplifiedExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.pdsm|current/StructureDefinition/pdsm-simplified-publish)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-pdsm-simplified-publish.csv), [Excel](StructureDefinition-pdsm-simplified-publish.xlsx), [Schematron](StructureDefinition-pdsm-simplified-publish.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "pdsm-simplified-publish",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-simplified-publish",
  "version" : "3.1.0",
  "name" : "PDSm_SimplifiedPublish",
  "title" : "PDSm Simplified Publish Document Reference",
  "status" : "active",
  "date" : "2026-01-13T15:41:05+00:00",
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
  "description" : "Profil utilisé dans le cadre du flux 9 d'ajout simplifié de document. Le flux et le profil sont inspirés d’IHE MHD, transaction ITI-105.\n\nContrairement au profil PDSm_ComprehensiveDocumentReference, le document est directement inclus dans DocumentReference.attachment.data et non dans une ressource « Binary » externe.\n\nLa publication simplifiée est une simple requête HTTP POST d'une ressource DocumentReference conforme à ce profil.",
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
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "fhircomposition",
      "uri" : "http://hl7.org/fhir/composition",
      "name" : "FHIR Composition"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "cda",
      "uri" : "http://hl7.org/v3/cda",
      "name" : "CDA (R2)"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    },
    {
      "identity" : "xds",
      "uri" : "http://ihe.net/xds",
      "name" : "XDS metadata equivalent"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "DocumentReference",
  "baseDefinition" : "https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.SimplifiedPublish.DocumentReference",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "DocumentReference",
        "path" : "DocumentReference"
      },
      {
        "id" : "DocumentReference.meta.versionId",
        "path" : "DocumentReference.meta.versionId",
        "short" : "Numéro de version de la fiche d’un document attribué par le système cible. La valeur de la métadonnée version est égale à 1 pour la première version de la fiche. Cet élément est requis lorsque le flux envoyé correspond à une mise à jour des données d’une fiche.",
        "mustSupport" : true
      },
      {
        "id" : "DocumentReference.masterIdentifier",
        "path" : "DocumentReference.masterIdentifier",
        "short" : "Représente l’identifiant unique global affecté au document par son créateur. Il est utilisable comme référence externe dans d’autres documents.",
        "mustSupport" : true
      },
      {
        "id" : "DocumentReference.identifier",
        "path" : "DocumentReference.identifier",
        "mustSupport" : true
      },
      {
        "id" : "DocumentReference.status",
        "path" : "DocumentReference.status",
        "mustSupport" : true
      },
      {
        "id" : "DocumentReference.type",
        "path" : "DocumentReference.type",
        "definition" : "Représente le type du document.",
        "constraint" : [
          {
            "key" : "constr-bind-type",
            "severity" : "error",
            "human" : "Les valeurs possibles pour cet élément doivent provenir d’une des terminologies de référence suivantes :\n\r\n TRE_A05-TypeDocComplementaireCISIS, OID : 1.2.250.1.213.1.1.4.12\n\r\n LOINC, OID : 2.16.840.1.113883.6.1\n\r\n TRE_A12-NomenclatureASTM, OID : ASTM\n\r\nLes valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J66-TypeCode-DMP).\r\nEn l’absence de spécifications complémentaires, le jeu de valeurs JDV_J07-XdsTypeCode-CISIS peut être utilisé.",
            "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-simplified-publish"
          }
        ],
        "binding" : {
          "strength" : "preferred",
          "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J07-XdsTypeCode-CISIS/FHIR/JDV-J07-XdsTypeCode-CISIS"
        }
      },
      {
        "id" : "DocumentReference.category",
        "path" : "DocumentReference.category",
        "short" : "Représente la classe du document (compte rendu, imagerie médicale, traitement, certificat,...).",
        "constraint" : [
          {
            "key" : "constr-bind-category",
            "severity" : "error",
            "human" : "Les valeurs possibles pour cet élément doivent provenir d’une des terminologies de référence suivantes :\n-\tTRE_A03-ClasseDocument-CISIS, OID : 1.2.250.1.213.1.1.4.1\n-\tTRE_A10-NomenclatureURN, OID : URN\nLes valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J57-ClassCode-DMP).\nEn l’absence de spécifications complémentaires, le jeu de valeurs JDV_J06-XdsClassCode-CISIS peut être utilisé.",
            "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-simplified-publish"
          }
        ],
        "binding" : {
          "strength" : "preferred",
          "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J06-XdsClassCode-CISIS/FHIR/JDV-J06-XdsClassCode-CISIS"
        }
      },
      {
        "id" : "DocumentReference.subject",
        "path" : "DocumentReference.subject",
        "short" : "Patient concerné par ce document. La ressource référencée peut être présente sous l’élément DocumentReference.contained ou via le champ identifier.",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient"
            ]
          }
        ]
      },
      {
        "id" : "DocumentReference.date",
        "path" : "DocumentReference.date",
        "short" : "Représente la date de création de la ressource DocumentReference dans FHIR"
      },
      {
        "id" : "DocumentReference.author",
        "path" : "DocumentReference.author",
        "short" : "Personnes physiques ou morales et/ou les dispositifs auteurs d'un document.",
        "min" : 1,
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitionerrole",
              "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitioner",
              "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-organization",
              "http://hl7.org/fhir/StructureDefinition/Device",
              "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient",
              "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-related-person"
            ]
          }
        ]
      },
      {
        "id" : "DocumentReference.authenticator",
        "path" : "DocumentReference.authenticator",
        "short" : "Cet attribut représente l’acteur validant le document et prenant la responsabilité du contenu médical de celui-ci. Il peut s’agir de l’auteur du document si celui-ci est une personne et s’il endosse la responsabilité du contenu médical de ses documents. Si l’auteur est un dispositif, cet attribut doit représenter la personne responsable de l’action effectuée par le dispositif.",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitionerrole",
              "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-organization"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "DocumentReference.description",
        "path" : "DocumentReference.description",
        "short" : "Commentaire associé au document.",
        "mustSupport" : true
      },
      {
        "id" : "DocumentReference.securityLabel",
        "path" : "DocumentReference.securityLabel",
        "short" : "Contient les informations définissant le niveau de confidentialité d'un document.",
        "constraint" : [
          {
            "key" : "constr-bind-securityLabel",
            "severity" : "error",
            "human" : "Les codes pour cet élément doivent provenir du ValueSet spécifié par le standard. Lorsqu’aucun code ne correspond au concept recherché, un code provenant de la terminologie de référence TRE_A07-StatusVisibiliteDocument, OID : 1.2.250.1.213.1.1.4.13 peut être utilisé.",
            "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-simplified-publish"
          }
        ]
      },
      {
        "id" : "DocumentReference.content",
        "path" : "DocumentReference.content",
        "short" : "Document contenu.",
        "mustSupport" : true
      },
      {
        "id" : "DocumentReference.content.attachment.language",
        "path" : "DocumentReference.content.attachment.language",
        "short" : "Pour tous les documents produits par les systèmes initiateurs français, le code est \"fr-FR'."
      },
      {
        "id" : "DocumentReference.content.attachment.data",
        "path" : "DocumentReference.content.attachment.data",
        "short" : "Le document est contenu dans l'élément .data au format base64."
      },
      {
        "id" : "DocumentReference.content.attachment.size",
        "path" : "DocumentReference.content.attachment.size",
        "short" : "Représente la taille du document."
      },
      {
        "id" : "DocumentReference.content.attachment.hash",
        "path" : "DocumentReference.content.attachment.hash",
        "short" : "Représente le résultat de hachage du document (SHA 1)."
      },
      {
        "id" : "DocumentReference.content.attachment.title",
        "path" : "DocumentReference.content.attachment.title",
        "min" : 1
      },
      {
        "id" : "DocumentReference.content.attachment.creation",
        "path" : "DocumentReference.content.attachment.creation",
        "short" : "Représente la date et l’heure de création du document."
      },
      {
        "id" : "DocumentReference.content.format",
        "path" : "DocumentReference.content.format",
        "short" : "Format technique détaillé du document.",
        "constraint" : [
          {
            "key" : "constr-bind-format",
            "severity" : "error",
            "human" : "Les valeurs possibles pour cet élément doivent provenir d’une des terminologies de référence suivantes :\n- TRE_A06-FormatCodeComplementaire, OID : 1.2.250.1.213.1.1.4.2.282\n- TRE_A11-IheFormatCode, OID : 1.3.6.1.4.1.19376.1.2.3\n- TRE_A09-DICOMuidRegistry, OID : 1.2.840.10008.2.6.1\n- TRE_A10-NomenclatureURN, OID : URN\nLes valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J60-FormatCode-DMP).\nEn l’absence de spécifications complémentaires, le jeu de valeurs JDV_J10-XdsFormatCode-CISIS peut être utilisé.",
            "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-simplified-publish"
          }
        ],
        "binding" : {
          "strength" : "preferred",
          "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J10-XdsFormatCode-CISIS/FHIR/JDV-J10-XdsFormatCode-CISIS"
        }
      },
      {
        "id" : "DocumentReference.context",
        "path" : "DocumentReference.context",
        "mustSupport" : true
      },
      {
        "id" : "DocumentReference.context.event",
        "path" : "DocumentReference.context.event",
        "short" : "Représente les actes et les pathologies en rapport avec le document.",
        "max" : "1",
        "constraint" : [
          {
            "key" : "constr-bind-context-event",
            "severity" : "error",
            "human" : "Nomenclatures utilisées : 1) CCAM pour les actes médicaux (OID=\"1.2.250.1.213.2.5\"); 2) CIM-10 pour les diagnostics de pathologie (OID=\"2.16.840.1.113883.6.3\"), 3) TRE_A00-ProducteurDocNonPS pour les documents d'expression personnelle du patient, 4) autre",
            "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-simplified-publish"
          }
        ]
      },
      {
        "id" : "DocumentReference.context.facilityType",
        "path" : "DocumentReference.context.facilityType",
        "short" : "Secteur d'activité lié à la prise en charge de la personne, en lien avec le document produit.",
        "constraint" : [
          {
            "key" : "constr-bind-ProducteurDoc-simplified",
            "severity" : "error",
            "human" : "L’utilisation de cette nomenclature est recommandée mais non obligatoire (prefered) :\n-\tTRE_R02-SecteurActivite, OID : 1.2.250.1.71.4.2.4 (lorsque l’auteur du document est un professionnel ou un équipement sous sa responsabilité)\nLes valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J61-HealthcareFacilityTypeCode-DMP).\nEn l’absence de spécifications complémentaires, le jeu de valeurs JDV_J02-XdsHealthcareFacilityTypeCode-CISIS peut être utilisé.",
            "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-simplified-publish"
          }
        ],
        "binding" : {
          "strength" : "preferred",
          "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J02-XdsHealthcareFacilityTypeCode-CISIS/FHIR/JDV-J02-XdsHealthcareFacilityTypeCode-CISIS"
        }
      },
      {
        "id" : "DocumentReference.context.practiceSetting",
        "path" : "DocumentReference.context.practiceSetting",
        "short" : "Cadre d’exercice de l’acte qui a engendré la création du document.",
        "constraint" : [
          {
            "key" : "constr-bind-ProducteurDoc-simplified",
            "severity" : "error",
            "human" : "L’utilisation de cette nomenclature est recommandée mais non obligatoire (prefered) :\n-\tTRE_R02-SecteurActivite, OID : 1.2.250.1.71.4.2.4 (lorsque l’auteur du document est un professionnel ou un équipement sous sa responsabilité)\nLes valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J61-HealthcareFacilityTypeCode-DMP).\nEn l’absence de spécifications complémentaires, le jeu de valeurs JDV_J02-XdsHealthcareFacilityTypeCode-CISIS peut être utilisé.",
            "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-simplified-publish"
          }
        ],
        "binding" : {
          "strength" : "preferred",
          "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J04-XdsPracticeSettingCode-CISIS/FHIR/JDV-J04-XdsPracticeSettingCode-CISIS"
        }
      },
      {
        "id" : "DocumentReference.context.sourcePatientInfo",
        "path" : "DocumentReference.context.sourcePatientInfo",
        "short" : "Référence vers la ressource Patient titulaire du dossier.",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient"
            ]
          }
        ]
      }
    ]
  }
}

```
