# PDSm Folder Comprehensive - Partage de Documents de Santé en mobilité (PDSm) v3.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PDSm Folder Comprehensive**

## Resource Profile: PDSm Folder Comprehensive 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-folder-comprehensive | *Version*:3.1.0 |
| Active as of 2026-01-14 | *Computable Name*:PDSm_FolderComprehensive |

 
Profil du Classeur dérivé de la ressource List et du profil IHE MHD « Comprehensive Folder ». 

**Utilisations:**

* Utiliser ce Profil: [PDSm Comprehensive Provide Document Bundle](StructureDefinition-pdsm-comprehensive-provide-document-bundle.md) and [PDSm Find Lists Response](StructureDefinition-pdsm-find-lists-response.md)
* Référer à ce Profil: [PDSm SubmissionSet Comprehensive](StructureDefinition-pdsm-submissionset-comprehensive.md)
* Exemples pour ce Profil: [List/ExampleFolder](List-ExampleFolder.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.pdsm|current/StructureDefinition/pdsm-folder-comprehensive)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-pdsm-folder-comprehensive.csv), [Excel](StructureDefinition-pdsm-folder-comprehensive.xlsx), [Schematron](StructureDefinition-pdsm-folder-comprehensive.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "pdsm-folder-comprehensive",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-folder-comprehensive",
  "version" : "3.1.0",
  "name" : "PDSm_FolderComprehensive",
  "title" : "PDSm Folder Comprehensive",
  "status" : "active",
  "date" : "2026-01-14T15:52:46+00:00",
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
  "description" : "Profil du Classeur dérivé de la ressource List et du profil IHE MHD « Comprehensive Folder ».",
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
      "identity" : "specmetier-to-PDSmFolderComprehensive",
      "name" : "Spécification métier vers le profil PDSm_FolderComprehensive"
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
      "identity" : "Folder-Mapping",
      "uri" : "XDS",
      "name" : "XDS and MHD Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "List",
  "baseDefinition" : "https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.Folder",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "List",
        "path" : "List",
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmFolderComprehensive",
            "map" : "Classeur"
          }
        ]
      },
      {
        "id" : "List.extension:designationType",
        "path" : "List.extension",
        "sliceName" : "designationType",
        "short" : "Représente les codes spécifiant le type d’activité de l’événement clinique ayant abouti au regroupement de la fiche d’un document dans ce classeur. Le jeu de valeurs est à définir par le système cible.",
        "max" : "1",
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmFolderComprehensive",
            "map" : "typeActivite : [0..1] Code"
          }
        ]
      },
      {
        "id" : "List.identifier:uniqueId",
        "path" : "List.identifier",
        "sliceName" : "uniqueId",
        "short" : "Identifiant unique du classeur attribué par le système initiateur.",
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmFolderComprehensive",
            "map" : "idUnique : [0..*] Identifiant"
          }
        ]
      },
      {
        "id" : "List.identifier:entryUUID",
        "path" : "List.identifier",
        "sliceName" : "entryUUID",
        "short" : "Identifiant attribué par le système cible.",
        "mustSupport" : true
      },
      {
        "id" : "List.status",
        "path" : "List.status",
        "short" : "Représente la pertinence de la version d’un classeur.",
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmFolderComprehensive",
            "map" : "statut : [1..1] Code"
          }
        ]
      },
      {
        "id" : "List.mode",
        "path" : "List.mode",
        "short" : "Mode de traitement qui s’applique au classeur."
      },
      {
        "id" : "List.title",
        "path" : "List.title",
        "short" : "Représente le titre du classeur.",
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmFolderComprehensive",
            "map" : "titreClasseur : [0..1] Texte"
          }
        ]
      },
      {
        "id" : "List.code",
        "path" : "List.code",
        "short" : "Désigne le cas d’utilisation de la ressource List. Il s’agit ici du classeur."
      },
      {
        "id" : "List.subject",
        "path" : "List.subject",
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
            "identity" : "specmetier-to-PDSmFolderComprehensive",
            "map" : "idPatient : [0..1] Identifiant"
          }
        ]
      },
      {
        "id" : "List.date",
        "path" : "List.date",
        "short" : "Représente la date de création du classeur. Cet élément est aussi mis en correspondance avec la date de mise à jour du classeur dans MHD.",
        "min" : 1,
        "mustSupport" : true,
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmFolderComprehensive",
            "map" : "derniereMiseAJour : [0..1] DateHeure"
          }
        ]
      },
      {
        "id" : "List.note",
        "path" : "List.note",
        "short" : "Représente les commentaires d’un classeur."
      },
      {
        "id" : "List.entry",
        "path" : "List.entry",
        "short" : "Liste des fiches composant le classeur.",
        "min" : 1
      },
      {
        "id" : "List.entry.item",
        "path" : "List.entry.item",
        "short" : "Représente la référence à la fiche d'un document faisant partie du classeur.",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"
            ]
          }
        ],
        "mapping" : [
          {
            "identity" : "specmetier-to-PDSmFolderComprehensive",
            "map" : "listeFiches : [0..*] Identifiant"
          }
        ]
      }
    ]
  }
}

```
