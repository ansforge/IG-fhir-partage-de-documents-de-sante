# PDSm_intendedRecipient - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

## Extension: 

Représente le destinataire du lot de soumission

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [PDSm SubmissionSet Comprehensive](StructureDefinition-pdsm-submissionset-comprehensive.md)
* Examples for this Extension: [List/ExampleSubmissionSet](List-ExampleSubmissionSet.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.pdsm|current/StructureDefinition/StructureDefinition-pdsm-ext-intended-recipient.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-pdsm-ext-intended-recipient.csv), [Excel](../StructureDefinition-pdsm-ext-intended-recipient.xlsx), [Schematron](../StructureDefinition-pdsm-ext-intended-recipient.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "pdsm-ext-intended-recipient",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-intended-recipient",
  "version" : "3.1.1",
  "name" : "PDSm_intendedRecipient",
  "status" : "active",
  "date" : "2026-06-24T10:01:26+00:00",
  "publisher" : "ANS",
  "contact" : [{
    "name" : "ANS",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Représente le destinataire du lot de soumission",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "List"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Représente le destinataire du lot de soumission",
      "definition" : "Représente le destinataire du lot de soumission"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-intended-recipient"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitioner",
        "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitionerrole",
        "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-organization"]
      }]
    }]
  }
}

```
