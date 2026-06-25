# PDSm Find Lists Response - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

## Resource Profile: PDSm Find Lists Response 

 
Profil de réponse de la transaction IHE "Find Document Lists [ITI-66]" basée sur le bundle MHD FindDocumentListsResponseMessage 

**Usages:**

* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.pdsm|current/StructureDefinition/StructureDefinition-pdsm-find-lists-response.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-pdsm-find-lists-response.csv), [Excel](../StructureDefinition-pdsm-find-lists-response.xlsx), [Schematron](../StructureDefinition-pdsm-find-lists-response.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "pdsm-find-lists-response",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-find-lists-response",
  "version" : "3.1.1",
  "name" : "PDSm_FindListsResponse",
  "title" : "PDSm Find Lists Response",
  "status" : "active",
  "date" : "2026-06-25T15:53:08+00:00",
  "publisher" : "ANS",
  "contact" : [{
    "name" : "ANS",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Profil de réponse de la transaction IHE \"Find Document Lists [ITI-66]\" basée sur le bundle MHD FindDocumentListsResponseMessage",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
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
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Bundle",
  "baseDefinition" : "https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.FindDocumentListsResponseMessage",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
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
      "type" : [{
        "code" : "List",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-submissionset-comprehensive"]
      }]
    },
    {
      "id" : "Bundle.entry:Folder",
      "path" : "Bundle.entry",
      "sliceName" : "Folder"
    },
    {
      "id" : "Bundle.entry:Folder.resource",
      "path" : "Bundle.entry.resource",
      "type" : [{
        "code" : "List",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-folder-comprehensive"]
      }]
    }]
  }
}

```
