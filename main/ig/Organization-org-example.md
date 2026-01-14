# org-example - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **org-example**

## Example Organization: org-example

version : 1; Dernière mise à jour : 2025-04-28 19:35:45+0200; Langue : fr; 

Information Source: [https://annuaire.sante.fr](https://annuaire.sante.fr)

Profils: [FR Core Organization Profile](https://hl7.fr/ig/fhir/core/2.1.0/StructureDefinition-fr-core-organization.html), [AS Donnée Publique Organization Profile](https://interop.esante.gouv.fr/ig/fhir/annuaire/1.1.0/StructureDefinition-as-dp-organization.html)

**identifier**: Identification nationale de structure définie par l’ANS dans le CI_SIS/2264403106 (utilisation : official, ), Identification de l'organisation au SIREN/264403106 (utilisation : official, )

**active**: true

**type**: Entité légale, Secteur non défini

**name**: HOPITAL INTERCOMMUNAL DE LA PRESQU'ILE G



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "org-example",
  "meta" : {
    "extension" : [
      {
        "extension" : [
          {
            "url" : "systeme-information",
            "valueCode" : "CG"
          }
        ],
        "url" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-data-trace"
      }
    ],
    "versionId" : "1",
    "lastUpdated" : "2025-04-28T19:35:45.507+02:00",
    "source" : "https://annuaire.sante.fr",
    "profile" : [
      "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization",
      "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-dp-organization"
    ]
  },
  "language" : "fr",
  "identifier" : [
    {
      "use" : "official",
      "type" : {
        "coding" : [
          {
            "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
            "code" : "IDNST"
          }
        ]
      },
      "system" : "urn:oid:1.2.250.1.71.4.2.2",
      "value" : "2264403106"
    },
    {
      "use" : "official",
      "type" : {
        "coding" : [
          {
            "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
            "code" : "SIREN"
          }
        ]
      },
      "system" : "https://sirene.fr",
      "value" : "264403106"
    }
  ],
  "active" : true,
  "type" : [
    {
      "extension" : [
        {
          "url" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-organization-types",
          "valueCode" : "organizationType"
        }
      ],
      "coding" : [
        {
          "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-3307",
          "code" : "LEGAL-ENTITY"
        }
      ]
    },
    {
      "extension" : [
        {
          "url" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-organization-types",
          "valueCode" : "secteurActiviteRASS"
        }
      ],
      "coding" : [
        {
          "system" : "https://mos.esante.gouv.fr/NOS/TRE_R02-SecteurActivite/FHIR/TRE-R02-SecteurActivite",
          "code" : "SA43"
        }
      ]
    }
  ],
  "name" : "HOPITAL INTERCOMMUNAL DE LA PRESQU'ILE G"
}

```
