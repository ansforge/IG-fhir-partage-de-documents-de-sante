# PDSm-isArchived - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PDSm-isArchived**

## SearchParameter: PDSm-isArchived 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/pdsm/SearchParameter/PDSm-isArchived | *Version*:3.1.1 |
| Active as of 2021-07-30 | *Computable Name*:PDSmIsArchived |

 
Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère derecherche l'élément isArchived qui permet distinguer les lots de soumission et les fiches archivés des actives. 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "PDSm-isArchived",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/SearchParameter/PDSm-isArchived",
  "version" : "3.1.1",
  "name" : "PDSmIsArchived",
  "status" : "active",
  "date" : "2021-07-30",
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
  "description" : "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère derecherche l'élément isArchived qui permet distinguer les lots de soumission et les fiches archivés des actives.",
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
  "code" : "isArchived",
  "base" : ["DocumentReference", "List"],
  "type" : "token",
  "expression" : "extension.where(url='https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-is-archived').value"
}

```
