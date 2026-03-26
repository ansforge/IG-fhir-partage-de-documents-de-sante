# EUtoPDSmDocumentReferenceMap - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **EUtoPDSmDocumentReferenceMap**

## StructureMap: EUtoPDSmDocumentReferenceMap (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/fhir/StructureMap/EUtoPDSmDocumentReference | *Version*:3.1.1 |
| Draft as of 2026-03-26 | *Computable Name*:EUtoPDSmDocumentReference |

 
Mapping EU EehrxfMhdDocumentReference vers PDSm DocumentReference 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "EUtoPDSmDocumentReferenceMap",
  "url" : "http://example.org/fhir/StructureMap/EUtoPDSmDocumentReference",
  "version" : "3.1.1",
  "name" : "EUtoPDSmDocumentReference",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-03-26T16:51:56+00:00",
  "publisher" : "ANS",
  "contact" : [{
    "name" : "ANS",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Mapping EU EehrxfMhdDocumentReference vers PDSm DocumentReference",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "group" : [{
    "name" : "EUtoPDSm",
    "typeMode" : "none",
    "input" : [{
      "name" : "src",
      "type" : "DocumentReference",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "DocumentReference",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "mapId",
      "source" : [{
        "context" : "src",
        "element" : "id"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "id"
      }]
    },
    {
      "name" : "mapStatus",
      "source" : [{
        "context" : "src",
        "element" : "status"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "status"
      }]
    }]
  }]
}

```
