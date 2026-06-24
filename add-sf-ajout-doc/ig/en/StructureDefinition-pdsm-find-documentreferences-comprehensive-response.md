# PDSm Find DocumentReferences Comprehensive Response - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

## Resource Profile: PDSm Find DocumentReferences Comprehensive Response 

 
Profil de réponse de la transaction IHE "Find Document References [ITI-67]" basée sur le bundle MHD FindDocumentReferencesComprehensiveResponseMessage 

**Usages:**

* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.pdsm|current/StructureDefinition/StructureDefinition-pdsm-find-documentreferences-comprehensive-response.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-pdsm-find-documentreferences-comprehensive-response.csv), [Excel](../StructureDefinition-pdsm-find-documentreferences-comprehensive-response.xlsx), [Schematron](../StructureDefinition-pdsm-find-documentreferences-comprehensive-response.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "pdsm-find-documentreferences-comprehensive-response",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-find-documentreferences-comprehensive-response",
  "version" : "3.1.1",
  "name" : "PDSm_FindDocumentReferencesComprehensiveResponse",
  "title" : "PDSm Find DocumentReferences Comprehensive Response",
  "status" : "active",
  "date" : "2026-06-24T12:42:06+00:00",
  "publisher" : "ANS",
  "contact" : [{
    "name" : "ANS",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Profil de réponse de la transaction IHE \"Find Document References [ITI-67]\" basée sur le bundle MHD FindDocumentReferencesComprehensiveResponseMessage",
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
  "baseDefinition" : "https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.FindDocumentReferencesComprehensiveResponseMessage",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Bundle",
      "path" : "Bundle"
    },
    {
      "id" : "Bundle.entry:DocumentReference",
      "path" : "Bundle.entry",
      "sliceName" : "DocumentReference"
    },
    {
      "id" : "Bundle.entry:DocumentReference.resource",
      "path" : "Bundle.entry.resource",
      "type" : [{
        "code" : "DocumentReference",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"]
      }]
    }]
  }
}

```
