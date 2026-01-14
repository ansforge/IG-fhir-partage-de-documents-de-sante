# PDSm_isArchived - Partage de Documents de Santé en mobilité (PDSm) v3.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PDSm_isArchived**

## Extension: PDSm_isArchived 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-is-archived | *Version*:3.1.0 |
| Active as of 2026-01-14 | *Computable Name*:PDSm_IsArchived |

Extension définie par le volet ANS "Volet Partage de documents de santé en mobilité" sur les ressources List et DocumentReference pour distinguer les lots de soumission et les fiches archivés des actives.

**Context of Use**

**Usage info**

**Utilisations:**

* Utiliser ce Extension: [PDSm Comprehensive DocumentReference](StructureDefinition-pdsm-comprehensive-document-reference.md) and [PDSm SubmissionSet Comprehensive](StructureDefinition-pdsm-submissionset-comprehensive.md)
* Exemples pour ce Extension: [List/ExampleSubmissionSet](List-ExampleSubmissionSet.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.pdsm|current/StructureDefinition/pdsm-ext-is-archived)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-pdsm-ext-is-archived.csv), [Excel](StructureDefinition-pdsm-ext-is-archived.xlsx), [Schematron](StructureDefinition-pdsm-ext-is-archived.sch) 

#### Contraintes



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "pdsm-ext-is-archived",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-is-archived",
  "version" : "3.1.0",
  "name" : "PDSm_IsArchived",
  "title" : "PDSm_isArchived",
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
  "description" : "Extension définie par le volet ANS \"Volet Partage de documents de santé en mobilité\" sur les ressources List et DocumentReference pour distinguer les lots de soumission et les fiches archivés des actives.",
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
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "DocumentReference"
    },
    {
      "type" : "element",
      "expression" : "List"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension",
        "short" : "PDSm_isArchived",
        "definition" : "Extension définie par le volet ANS \"Volet Partage de documents de santé en mobilité\" sur les ressources List et DocumentReference pour distinguer les lots de soumission et les fiches archivés des actives."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-is-archived"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "boolean"
          }
        ]
      }
    ]
  }
}

```
