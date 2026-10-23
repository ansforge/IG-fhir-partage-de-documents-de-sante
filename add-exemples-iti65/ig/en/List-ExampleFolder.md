# Exemple de Classeur PDSm - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

## Example List: Exemple de Classeur PDSm

Profile: [PDSm Folder Comprehensive](StructureDefinition-pdsm-folder-comprehensive.md)

## Classeur de suivi diabète

| | | | |
| :--- | :--- | :--- | :--- |
| Date: 2025-04-28 10:30:00+0100 | Mode: Working List | Status: Current | Code: Folder |
| Subject:[Martin Claire (official) Male, DoB: 1980-01-15 ( NIR: 180017505600103 (use: official, ))](Patient-fr-patient-123.md) | | | |

note

> 

Classeur regroupant les documents liés à l’intervention chirurgicale d’appendicectomie et au suivi post-opératoire du patient.


* **Items**: [DocumentReference: masterIdentifier = UUID:12345678-abcd-1234-abcd-1234567890ab; status = current; type = Résumé de sortie d’hospitalisation; category = Compte-rendu; date = 2025-04-29 12:00:00+0100; description = Compte rendu d’hospitalisation suite à une chirurgie.; securityLabel = Normal](DocumentReference-exemple-pdsm-documentreference.md)



## Resource Content

```json
{
  "resourceType" : "List",
  "id" : "ExampleFolder",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-folder-comprehensive"]
  },
  "extension" : [{
    "url" : "https://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-designationType",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "80146002",
        "display" : "Appendectomy (procedure)"
      }]
    }
  }],
  "identifier" : [{
    "system" : "urn:ietf:rfc:3986",
    "value" : "urn:uuid:77777777-dddd-eeee-ffff-888888888888"
  },
  {
    "system" : "urn:ietf:rfc:3986",
    "value" : "urn:uuid:55555555-aaaa-bbbb-cccc-666666666666"
  }],
  "status" : "current",
  "mode" : "working",
  "title" : "Classeur de suivi diabète",
  "code" : {
    "coding" : [{
      "system" : "https://profiles.ihe.net/ITI/MHD/CodeSystem/MHDlistTypes",
      "code" : "folder",
      "display" : "Folder"
    }]
  },
  "subject" : {
    "reference" : "Patient/fr-patient-123"
  },
  "date" : "2025-04-28T10:30:00+01:00",
  "note" : [{
    "text" : "Classeur regroupant les documents liés à l’intervention chirurgicale d’appendicectomie et au suivi post-opératoire du patient."
  }],
  "entry" : [{
    "item" : {
      "reference" : "DocumentReference/exemple-pdsm-documentreference"
    }
  }]
}

```
