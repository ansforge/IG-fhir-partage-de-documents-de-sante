# PDSm Find Lists Response - Partage de Documents de Santé en mobilité (PDSm) v3.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PDSm Find Lists Response**

## Resource Profile: PDSm Find Lists Response 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-find-lists-response | *Version*:3.1.0 |
| Active as of 2026-01-14 | *Computable Name*:PDSm_FindListsResponse |

 
Profil de réponse de la transaction IHE "Find Document Lists [ITI-66]" basée sur le bundle MHD FindDocumentListsResponseMessage 

**Utilisations:**

* Ce Profil nest utilisé par aucun profil dans ce guide dimplémentation

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.pdsm|current/StructureDefinition/pdsm-find-lists-response)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-pdsm-find-lists-response.csv), [Excel](StructureDefinition-pdsm-find-lists-response.xlsx), [Schematron](StructureDefinition-pdsm-find-lists-response.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "pdsm-find-lists-response",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-find-lists-response",
  "version" : "3.1.0",
  "name" : "PDSm_FindListsResponse",
  "title" : "PDSm Find Lists Response",
  "status" : "active",
  "date" : "2026-01-14T15:43:32+00:00",
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
  "description" : "Profil de réponse de la transaction IHE \"Find Document Lists [ITI-66]\" basée sur le bundle MHD FindDocumentListsResponseMessage",
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
  "baseDefinition" : "https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.FindDocumentListsResponseMessage",
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
        "id" : "Bundle.entry:Folder",
        "path" : "Bundle.entry",
        "sliceName" : "Folder"
      },
      {
        "id" : "Bundle.entry:Folder.resource",
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
