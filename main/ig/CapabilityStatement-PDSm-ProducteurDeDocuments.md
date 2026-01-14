# CI-SIS Partage-De-Documents-De-Sante - ProducteurDeDocuments - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CI-SIS Partage-De-Documents-De-Sante - ProducteurDeDocuments**

## CapabilityStatement: CI-SIS Partage-De-Documents-De-Sante - ProducteurDeDocuments 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/pdsm/CapabilityStatement/PDSm-ProducteurDeDocuments | *Version*:3.1.1 |
| Active as of 2021-07-30 | *Computable Name*:PDSmProducteurDeDocuments |

 
Il s’agit d’un système d’information ou d’un composant de système d’information qui envoie au gestionnaire de partage de documents une demande d’ajout de nouveaux documents et/ou des nouvelles versions de documents. Ce système fournit également les modifications des métadonnées du document. 

 [Raw OpenAPI-Swagger Definition file](PDSm-ProducteurDeDocuments.openapi.json) | [Download](PDSm-ProducteurDeDocuments.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "PDSm-ProducteurDeDocuments",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/CapabilityStatement/PDSm-ProducteurDeDocuments",
  "version" : "3.1.1",
  "name" : "PDSmProducteurDeDocuments",
  "title" : "CI-SIS Partage-De-Documents-De-Sante - ProducteurDeDocuments",
  "status" : "active",
  "experimental" : false,
  "date" : "2021-07-30T14:32:30+02:00",
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
  "description" : "Il s’agit d’un système d’information ou d’un composant de système d’information qui envoie au gestionnaire de partage de documents une  demande d’ajout de nouveaux documents et/ou des nouvelles versions de documents. Ce système fournit également les modifications des  métadonnées du document.",
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
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["xml", "json"],
  "implementationGuide" : [
    "https://interop.esante.gouv.fr/ig/fhir/pdsm/ImplementationGuide/ans.fhir.fr.pdsm"
  ],
  "rest" : [
    {
      "mode" : "client",
      "documentation" : "Ajout d’un lot de documents et Demande de mise à jour des métadonnées de la fiche",
      "security" : {
        "cors" : false,
        "description" : "L’ANS propose des référentiels dédiés à la politique de sécurité (la PGSSI-S ) et des mécanismes de sécurisation sont définis dans les volets de la couche Transport du Cadre d’Interopérabilité des systèmes d’information de santé (CI-SIS)"
      },
      "resource" : [
        {
          "type" : "DocumentReference",
          "profile" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference",
          "interaction" : [
            {
              "code" : "patch"
            }
          ],
          "conditionalUpdate" : true
        }
      ],
      "interaction" : [
        {
          "code" : "transaction",
          "documentation" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-provide-document-bundle"
        }
      ]
    }
  ]
}

```
