# PDSm Comprehensive Provide Document Bundle - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PDSm Comprehensive Provide Document Bundle**

## Resource Profile: PDSm Comprehensive Provide Document Bundle 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-provide-document-bundle | *Version*:3.1.1 |
| Active as of 2026-01-15 | *Computable Name*:PDSm_ComprehensiveProvideDocumentBundle |

 
Profil basé sur la transaction IHE "Provide Document Bundle [ITI-65]" du profil MHD ; le bundle est de type transaction et contient : 
* une ressource de type « List » représentant le lot de soumission,
* une à plusieurs ressources de type « DocumentReference », représentant les fiches de documents,
* zero à plusieurs ressources « Binary » représentant les documents envoyés dans le flux,
* zero à plusieurs ressources de type « List » représentant les classeurs. Dans le cas d’un dépôt d’un nouveau document, l’élément DocumentReference.content.attachment.url doit pointer vers une ressource Binary, représentant le document, présente dans le bundle. Dans le cas d’une demande de mise à jour d’un document par remplacement, l’élément DocumentReference.relatesTo doit être renseigné afin d’indiquer le lien avec un DocumentReference existant et de préciser la nature de la mise à jour. L’élément DocumentReference.content.attachment.url doit pointer vers une ressource Binary, représentant le document qui remplace l’ancien, présente dans le bundle. Dans le cas d’une mise à jour d’un classeur, comme List.status ou List.entry pour reclasser des documents, une nouvelle version de la ressource List est envoyée.
 

**Utilisations:**

* Ce Profil nest utilisé par aucun profil dans ce guide dimplémentation

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.pdsm|current/StructureDefinition/pdsm-comprehensive-provide-document-bundle)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-pdsm-comprehensive-provide-document-bundle.csv), [Excel](StructureDefinition-pdsm-comprehensive-provide-document-bundle.xlsx), [Schematron](StructureDefinition-pdsm-comprehensive-provide-document-bundle.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "pdsm-comprehensive-provide-document-bundle",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-provide-document-bundle",
  "version" : "3.1.1",
  "name" : "PDSm_ComprehensiveProvideDocumentBundle",
  "title" : "PDSm Comprehensive Provide Document Bundle",
  "status" : "active",
  "date" : "2026-01-15T07:36:28+00:00",
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
  "description" : "Profil basé sur la transaction IHE \"Provide Document Bundle [ITI-65]\" du profil MHD ; le bundle est de type transaction et contient : \n- une ressource de type « List » représentant le lot de soumission,\n- une à plusieurs ressources de type « DocumentReference », représentant les fiches de documents,\n- zero à plusieurs ressources « Binary » représentant les documents envoyés dans le flux,\n- zero à plusieurs ressources de type « List » représentant les classeurs.\nDans le cas d’un dépôt d’un nouveau document, l’élément DocumentReference.content.attachment.url doit pointer vers une ressource Binary, représentant le document, présente dans le bundle.\nDans le cas d’une demande de mise à jour d’un document par remplacement, l’élément DocumentReference.relatesTo doit être renseigné afin d’indiquer le lien avec un DocumentReference existant et de préciser la nature de la mise à jour. L’élément DocumentReference.content.attachment.url doit pointer vers une ressource Binary, représentant le document qui remplace l’ancien, présente dans le bundle.\nDans le cas d’une mise à jour d’un classeur, comme List.status ou List.entry pour reclasser des documents, une nouvelle version de la ressource List est envoyée.",
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
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
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
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Bundle",
  "baseDefinition" : "https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.ProvideBundle",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Bundle",
        "path" : "Bundle"
      },
      {
        "id" : "Bundle.entry:SubmissionSet",
        "path" : "Bundle.entry",
        "sliceName" : "SubmissionSet"
      },
      {
        "id" : "Bundle.entry:SubmissionSet.resource",
        "path" : "Bundle.entry.resource",
        "type" : [
          {
            "code" : "List",
            "profile" : [
              "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-submissionset-comprehensive"
            ]
          }
        ]
      },
      {
        "id" : "Bundle.entry:DocumentRefs",
        "path" : "Bundle.entry",
        "sliceName" : "DocumentRefs"
      },
      {
        "id" : "Bundle.entry:DocumentRefs.resource",
        "path" : "Bundle.entry.resource",
        "type" : [
          {
            "code" : "DocumentReference",
            "profile" : [
              "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"
            ]
          }
        ]
      },
      {
        "id" : "Bundle.entry:Folders",
        "path" : "Bundle.entry",
        "sliceName" : "Folders"
      },
      {
        "id" : "Bundle.entry:Folders.resource",
        "path" : "Bundle.entry.resource",
        "type" : [
          {
            "code" : "List",
            "profile" : [
              "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-folder-comprehensive"
            ]
          }
        ]
      }
    ]
  }
}

```
