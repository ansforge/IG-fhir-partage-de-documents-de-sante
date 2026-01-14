# PDSm Comprehensive DocumentReference - Partage de Documents de Santé en mobilité (PDSm) v3.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PDSm Comprehensive DocumentReference**

## Resource Profile: PDSm Comprehensive DocumentReference 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference | *Version*:3.1.0 |
| Active as of 2026-01-14 | *Computable Name*:PDSm_ComprehensiveDocumentReference |

 
Profil contenant les métadonnées du document ainsi que le lien vers la ressource Binary contenant le document dérivé de la ressource DocumentReference et du profil IHE MHD v4.0.1 "ComprehensiveDocumentReference" 

**Utilisations:**

* Utiliser ce Profil: [PDSm Comprehensive Provide Document Bundle](StructureDefinition-pdsm-comprehensive-provide-document-bundle.md) and [PDSm Find DocumentReferences Comprehensive Response](StructureDefinition-pdsm-find-documentreferences-comprehensive-response.md)
* Référer à ce Profil: [PDSm Folder Comprehensive](StructureDefinition-pdsm-folder-comprehensive.md) and [PDSm SubmissionSet Comprehensive](StructureDefinition-pdsm-submissionset-comprehensive.md)
* Exemples pour ce Profil: [DocumentReference/exemple-pdsm-documentreference](DocumentReference-exemple-pdsm-documentreference.md)
* CapabilityStatements utilisant ce Profil: [CI-SIS Partage-De-Documents-De-Sante - ConsommateurDeDocuments](CapabilityStatement-PDSm-ConsommateurDeDocuments.md), [CI-SIS Partage-De-Documents-De-Sante - GestionnaireDePartageDeDocuments](CapabilityStatement-PDSm-GestionnaireDePartageDeDocuments.md) and [CI-SIS Partage-De-Documents-De-Sante - ProducteurDeDocuments](CapabilityStatement-PDSm-ProducteurDeDocuments.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.pdsm|current/StructureDefinition/pdsm-comprehensive-document-reference)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-pdsm-comprehensive-document-reference.csv), [Excel](StructureDefinition-pdsm-comprehensive-document-reference.xlsx), [Schematron](StructureDefinition-pdsm-comprehensive-document-reference.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "pdsm-comprehensive-document-reference",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference",
  "version" : "3.1.0",
  "name" : "PDSm_ComprehensiveDocumentReference",
  "title" : "PDSm Comprehensive DocumentReference",
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
  "description" : "Profil contenant les métadonnées du document ainsi que le lien vers la ressource Binary contenant le document dérivé de la ressource DocumentReference et du profil IHE MHD v4.0.1 \"ComprehensiveDocumentReference\"",
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
      "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
      "name" : "Spécification métier vers le profil PDSm_ComprehensiveDocumentReference"
    },
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
    },
    {
      "identity" : "DocumentEntry-Mapping",
      "uri" : "XDS",
      "name" : "XDS and MHD Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "DocumentReference",
  "baseDefinition" : "https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.DocumentReference",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "DocumentReference",
        "path" : "DocumentReference",
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "Fiche"
          }
        ]
      },
      {
        "id" : "DocumentReference.meta.versionId",
        "path" : "DocumentReference.meta.versionId",
        "short" : "Numéro de version de la fiche d’un document attribué par le système cible. La valeur de la métadonnée version est égale à 1 pour la première version de la fiche. Cet élément est requis lorsque le flux envoyé correspond à une mise à jour des données d’une fiche.",
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "version : [0..1] Numerique"
          }
        ]
      },
      {
        "id" : "DocumentReference.contained",
        "path" : "DocumentReference.contained",
        "short" : "Ressource contenue. Dans le cadre de ce profil, il est obligatoire qu'il y ait au moins une ressource contenue : la•les ressource•s référencée•s dans les attributs author et authenticator",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "DocumentReference.extension",
        "path" : "DocumentReference.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "DocumentReference.extension:isArchived",
        "path" : "DocumentReference.extension",
        "sliceName" : "isArchived",
        "short" : "Extension définie pour distinguer les fiches archivées des actives.",
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
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "statut : [1..1] Code"
          }
        ]
      },
      {
        "id" : "DocumentReference.masterIdentifier",
        "path" : "DocumentReference.masterIdentifier",
        "short" : "Représente l’identifiant unique global affecté au document par son créateur. Il est utilisable comme référence externe dans d’autres documents.",
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "idUnique : [0..1] Identifiant"
          }
        ]
      },
      {
        "id" : "DocumentReference.identifier",
        "path" : "DocumentReference.identifier",
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "idFiche : [0..*] Identifiant"
          }
        ]
      },
      {
        "id" : "DocumentReference.status",
        "path" : "DocumentReference.status",
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "statut : [1..1] Code"
          }
        ]
      },
      {
        "id" : "DocumentReference.type",
        "path" : "DocumentReference.type",
        "short" : "Représente le type du document.",
        "constraint" : [
          {
            "key" : "constr-bind-type",
            "severity" : "error",
            "human" : "Les valeurs possibles pour cet élément doivent provenir d’une des terminologies de référence suivantes :\n\r\n TRE_A05-TypeDocComplementaireCISIS, OID : 1.2.250.1.213.1.1.4.12\n\r\n LOINC, OID : 2.16.840.1.113883.6.1\n\r\n TRE_A12-NomenclatureASTM, OID : ASTM\n\r\nLes valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J66-TypeCode-DMP).\r\nEn l’absence de spécifications complémentaires, le jeu de valeurs JDV_J07-XdsTypeCode-CISIS peut être utilisé.",
            "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"
          }
        ],
        "binding" : {
          "strength" : "preferred",
          "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J07-XdsTypeCode-CISIS/FHIR/JDV-J07-XdsTypeCode-CISIS"
        },
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "typeDocument : [0..1] Code"
          }
        ]
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
            "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"
          }
        ],
        "binding" : {
          "strength" : "preferred",
          "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J06-XdsClassCode-CISIS/FHIR/JDV-J06-XdsClassCode-CISIS"
        },
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "classeDocument : [0..1] Code"
          }
        ]
      },
      {
        "id" : "DocumentReference.subject",
        "path" : "DocumentReference.subject",
        "short" : "Référence vers le patient concerné par le document. Cette même ressource est référencée depuis context.sourcePatientInfo.",
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
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "idPatient : [0..1] Identifiant"
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
              "http://hl7.org/fhir/StructureDefinition/Device",
              "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient"
            ],
            "aggregation" : ["contained"]
          }
        ],
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "auteur : [1..*] Identifiant"
          }
        ]
      },
      {
        "id" : "DocumentReference.authenticator",
        "path" : "DocumentReference.authenticator",
        "short" : "Cet attribut représente l’acteur validant le document et prenant la responsabilité du contenu médical de celui-ci. Il peut s’agir de l’auteur du document si celui-ci est une personne et s’il endosse la responsabilité du contenu médical de ses documents. Si l’auteur est un dispositif, cet attribut doit représenter la personne responsable de l’action effectuée par le dispositif. Pour les documents d’expression personnelle du patient, cet attribut fait référence au patient.",
        "min" : 1,
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitionerrole",
              "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-organization"
            ],
            "aggregation" : ["contained"]
          }
        ],
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "authentificateur : [1..1] Identifiant"
          }
        ]
      },
      {
        "id" : "DocumentReference.relatesTo",
        "path" : "DocumentReference.relatesTo",
        "short" : "Relation avec d'autres fiches",
        "definition" : "Cardinalité contrainte à [1..1] lorsque le flux envoyé correspond au remplacement d’un document.",
        "constraint" : [
          {
            "key" : "constr-cdr-rempl",
            "severity" : "error",
            "human" : "Elément requis lorsque le flux envoyé correspond au remplacement d'un document",
            "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"
          },
          {
            "key" : "constr-bind-relatesTo",
            "severity" : "error",
            "human" : "Cardinalité contrainte à [1..1] lorsque le flux envoyé correspond au remplacement d’un document.",
            "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"
          }
        ]
      },
      {
        "id" : "DocumentReference.relatesTo.code",
        "path" : "DocumentReference.relatesTo.code",
        "short" : "Représente le type d'association entre deux fiches.",
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "association : [0..*] Code"
          }
        ]
      },
      {
        "id" : "DocumentReference.relatesTo.target",
        "path" : "DocumentReference.relatesTo.target",
        "short" : "Représente l'identifiant d'une association entre deux fiches.",
        "constraint" : [
          {
            "key" : "constr-bind-relatesToTarget",
            "severity" : "error",
            "human" : "Référence contrainte au profil PDSm_ComprehensiveDocumentReference",
            "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"
          }
        ],
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "idFicheAssociation : [0..*] Identifiant"
          }
        ]
      },
      {
        "id" : "DocumentReference.description",
        "path" : "DocumentReference.description",
        "short" : "Commentaire associé au document.",
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "commentaire : [0..1] Texte"
          }
        ]
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
            "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"
          }
        ],
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "niveauConfidentialite : [0..*] code"
          }
        ]
      },
      {
        "id" : "DocumentReference.content",
        "path" : "DocumentReference.content",
        "short" : "Document référencé.",
        "mustSupport" : true
      },
      {
        "id" : "DocumentReference.content.attachment.language",
        "path" : "DocumentReference.content.attachment.language",
        "short" : "Pour tous les documents produits par les systèmes initiateurs français, le code est \"fr-FR'.",
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "langueDocument : [1..*] Code"
          }
        ]
      },
      {
        "id" : "DocumentReference.content.attachment.url",
        "path" : "DocumentReference.content.attachment.url",
        "short" : "Représente la référence vers une ressource Binary où se trouvent les données du document référencé",
        "constraint" : [
          {
            "key" : "constr-bind-attachmenturl",
            "severity" : "error",
            "human" : "Dans le cas de l’ajout de document, l’url fait référence à la ressource Binary (« Binary/[id] »).\nDans le cas de la recherche, il s’agit de l’URL permettant d’accéder au document",
            "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"
          }
        ],
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "Document : [0..1]"
          }
        ]
      },
      {
        "id" : "DocumentReference.content.attachment.size",
        "path" : "DocumentReference.content.attachment.size",
        "short" : "Représente la taille du document.",
        "min" : 1
      },
      {
        "id" : "DocumentReference.content.attachment.hash",
        "path" : "DocumentReference.content.attachment.hash",
        "short" : "Représente le résultat de hachage du document (SHA 1).",
        "min" : 1
      },
      {
        "id" : "DocumentReference.content.attachment.title",
        "path" : "DocumentReference.content.attachment.title",
        "min" : 1,
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "titreDocument : [0..1] Texte"
          }
        ]
      },
      {
        "id" : "DocumentReference.content.attachment.creation",
        "path" : "DocumentReference.content.attachment.creation",
        "short" : "Représente la date et l’heure de création du document",
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "dateCreationDocument : [1..1] DateHeure"
          }
        ]
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
            "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"
          }
        ],
        "binding" : {
          "strength" : "preferred",
          "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J10-XdsFormatCode-CISIS/FHIR/JDV-J10-XdsFormatCode-CISIS"
        },
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "formatDocument : [0..1] Code"
          }
        ]
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
        "constraint" : [
          {
            "key" : "constr-bind-context-event",
            "severity" : "error",
            "human" : "Nomenclatures utilisées : 1) CCAM pour les actes médicaux (OID=\"1.2.250.1.213.2.5\"); 2) CIM-10 pour les diagnostics de pathologie (OID=\"2.16.840.1.113883.6.3\"), 3) TRE_A00-ProducteurDocNonPS pour les documents d'expression personnelle du patient, 4) autre",
            "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"
          }
        ],
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "actePathologie : [0..1] Code"
          }
        ]
      },
      {
        "id" : "DocumentReference.context.period",
        "path" : "DocumentReference.context.period",
        "min" : 1
      },
      {
        "id" : "DocumentReference.context.period.start",
        "path" : "DocumentReference.context.period.start",
        "min" : 1,
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "dateDebutActe : [0..1] DateHeure"
          }
        ]
      },
      {
        "id" : "DocumentReference.context.period.end",
        "path" : "DocumentReference.context.period.end",
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "dateFinActe : [0..1] DateHeure"
          }
        ]
      },
      {
        "id" : "DocumentReference.context.facilityType",
        "path" : "DocumentReference.context.facilityType",
        "short" : "Secteur d'activité lié à la prise en charge de la personne, en lien avec le document produit.",
        "constraint" : [
          {
            "key" : "constr-bind-ProducteurDoc",
            "severity" : "error",
            "human" : "Les valeurs possibles pour cet élément doivent provenir d’une des terminologies de référence suivantes :\n-\tTRE_A00-ProducteurDocNonPS, OID : 1.2.250.1.213.1.1.4.6 (lorsque l’auteur du document est un patient ou un équipement sous sa responsabilité)\n-\tTRE_R02-SecteurActivite, OID : 1.2.250.1.71.4.2.4 (lorsque l’auteur du document est un professionnel ou un équipement sous sa responsabilité)\nLes valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J61-HealthcareFacilityTypeCode-DMP).\nEn l’absence de spécifications complémentaires, le jeu de valeurs JDV_J02-XdsHealthcareFacilityTypeCode-CISIS peut être utilisé.",
            "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"
          }
        ],
        "binding" : {
          "strength" : "preferred",
          "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J02-XdsHealthcareFacilityTypeCode-CISIS/FHIR/JDV-J02-XdsHealthcareFacilityTypeCode-CISIS"
        },
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "secteurActivite : [0..1] Code"
          }
        ]
      },
      {
        "id" : "DocumentReference.context.practiceSetting",
        "path" : "DocumentReference.context.practiceSetting",
        "short" : "Cadre d’exercice de l’acte qui a engendré la création du document.",
        "constraint" : [
          {
            "key" : "constr-bind-ProducteurDoc",
            "severity" : "error",
            "human" : "Les valeurs possibles pour cet élément doivent provenir d’une des terminologies de référence suivantes :\n-\tTRE_A00-ProducteurDocNonPS, OID : 1.2.250.1.213.1.1.4.6 (lorsque l’auteur du document est un patient ou un équipement sous sa responsabilité)\n-\tTRE_R02-SecteurActivite, OID : 1.2.250.1.71.4.2.4 (lorsque l’auteur du document est un professionnel ou un équipement sous sa responsabilité)\nLes valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J61-HealthcareFacilityTypeCode-DMP).\nEn l’absence de spécifications complémentaires, le jeu de valeurs JDV_J02-XdsHealthcareFacilityTypeCode-CISIS peut être utilisé.",
            "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"
          }
        ],
        "binding" : {
          "strength" : "preferred",
          "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J04-XdsPracticeSettingCode-CISIS/FHIR/JDV-J04-XdsPracticeSettingCode-CISIS"
        },
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmComprehensiveDocumentReference",
            "map" : "cadreExercice : [0..1] Code"
          }
        ]
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
            ],
            "aggregation" : ["contained"]
          }
        ]
      },
      {
        "id" : "DocumentReference.context.related",
        "path" : "DocumentReference.context.related",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "type"
            }
          ],
          "description" : "Slice based on the type.coding.system pattern",
          "rules" : "open"
        },
        "mustSupport" : true
      },
      {
        "id" : "DocumentReference.context.related:referenceIdList",
        "path" : "DocumentReference.context.related",
        "sliceName" : "referenceIdList",
        "short" : "Données d’un « identifiant de référence » (referenceIdList)",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "DocumentReference.context.related:referenceIdList.identifier",
        "path" : "DocumentReference.context.related.identifier",
        "mustSupport" : true
      },
      {
        "id" : "DocumentReference.context.related:referenceIdList.identifier.type.coding.system",
        "path" : "DocumentReference.context.related.identifier.type.coding.system",
        "patternUri" : "urn:ietf:rfc:3986"
      },
      {
        "id" : "DocumentReference.context.related:referenceIdList.identifier.type.coding.code",
        "path" : "DocumentReference.context.related.identifier.type.coding.code",
        "short" : "[CXi.5] Identifier Type Code : urn:ihe:iti:xds:2016:studyInstanceUID | urn:ihe:iti:xds:2013:order | urn:ihe:iti:xds:2013:accession",
        "mustSupport" : true
      },
      {
        "id" : "DocumentReference.context.related:referenceIdList.identifier.system",
        "path" : "DocumentReference.context.related.identifier.system",
        "short" : "[CXi.4.2] Assigning Authority (ce champs n'est pas présent systématiquement, il ne l'est dans le cas de studyInstanceUID notamment).",
        "mustSupport" : true
      },
      {
        "id" : "DocumentReference.context.related:referenceIdList.identifier.value",
        "path" : "DocumentReference.context.related.identifier.value",
        "short" : "[CXi.1] Accession number",
        "min" : 1,
        "mustSupport" : true
      }
    ]
  }
}

```
