# PDSm-example-comprehensiveProvideDocumentBundleReplace - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PDSm-example-comprehensiveProvideDocumentBundleReplace**

## Example Bundle: PDSm-example-comprehensiveProvideDocumentBundleReplace



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "PDSm-example-comprehensiveProvideDocumentBundleReplace",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-provide-document-bundle"]
  },
  "type" : "transaction",
  "timestamp" : "2026-03-19T10:00:00+01:00",
  "entry" : [{
    "fullUrl" : "urn:uuid:patient-1",
    "resource" : {
      "resourceType" : "Patient",
      "id" : "patient-1",
      "meta" : {
        "profile" : ["https://interop.esante.gouv.fr/StructureDefinition/fr-core-patient"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Patient_patient-1\"> </a><p class=\"res-header-id\"><b>Narratif généré : Patient patient-1</b></p><a name=\"patient-1\"> </a><a name=\"hcpatient-1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profil: <code>https://interop.esante.gouv.fr/StructureDefinition/fr-core-patient</code></p></div><p style=\"border: 1px #661aff solid; background-color: #e6e6ff; padding: 10px;\">JEAN DUPONT (official) Male, Date de Naissance :1989-07-09 ( urn:oid:1.2.250.1.213.1.4.8#189079912345678)</p><hr/></div>"
      },
      "identifier" : [{
        "system" : "urn:oid:1.2.250.1.213.1.4.8",
        "value" : "189079912345678"
      }],
      "name" : [{
        "use" : "official",
        "family" : "DUPONT",
        "given" : ["JEAN"]
      }],
      "gender" : "male",
      "birthDate" : "1989-07-09"
    },
    "request" : {
      "method" : "POST",
      "url" : "Patient"
    }
  },
  {
    "fullUrl" : "urn:uuid:practitioner-1",
    "resource" : {
      "resourceType" : "Practitioner",
      "id" : "practitioner-1",
      "meta" : {
        "profile" : ["https://interop.esante.gouv.fr/StructureDefinition/fr-core-practitioner"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Practitioner_practitioner-1\"> </a><p class=\"res-header-id\"><b>Narratif généré : Praticien practitioner-1</b></p><a name=\"practitioner-1\"> </a><a name=\"hcpractitioner-1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profil: <code>https://interop.esante.gouv.fr/StructureDefinition/fr-core-practitioner</code></p></div><p><b>identifier</b>: <code>urn:oid:1.2.250.1.71.4.2.1</code>/10000000001</p><p><b>name</b>: ALICE MARTIN </p></div>"
      },
      "identifier" : [{
        "system" : "urn:oid:1.2.250.1.71.4.2.1",
        "value" : "10000000001"
      }],
      "name" : [{
        "family" : "MARTIN",
        "given" : ["ALICE"]
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "Practitioner"
    }
  },
  {
    "fullUrl" : "urn:uuid:organization-1",
    "resource" : {
      "resourceType" : "Organization",
      "id" : "organization-1",
      "meta" : {
        "profile" : ["https://interop.esante.gouv.fr/StructureDefinition/fr-core-organization"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Organization_organization-1\"> </a><p class=\"res-header-id\"><b>Narratif généré : Organisation organization-1</b></p><a name=\"organization-1\"> </a><a name=\"hcorganization-1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profil: <code>https://interop.esante.gouv.fr/StructureDefinition/fr-core-organization</code></p></div><p><b>identifier</b>: <code>urn:oid:1.2.250.1.71.4.2.2</code>/750100015</p><p><b>name</b>: CENTRE HOSPITALIER DEMO</p></div>"
      },
      "identifier" : [{
        "system" : "urn:oid:1.2.250.1.71.4.2.2",
        "value" : "750100015"
      }],
      "name" : "CENTRE HOSPITALIER DEMO"
    },
    "request" : {
      "method" : "POST",
      "url" : "Organization"
    }
  },
  {
    "fullUrl" : "urn:uuid:binary-1",
    "resource" : {
      "resourceType" : "Binary",
      "id" : "binary-1",
      "contentType" : "application/pdf",
      "data" : "SGVsbG8gV29ybGQ="
    },
    "request" : {
      "method" : "POST",
      "url" : "Binary"
    }
  },
  {
    "fullUrl" : "urn:uuid:docref-1",
    "resource" : {
      "resourceType" : "DocumentReference",
      "id" : "docref-1",
      "meta" : {
        "profile" : ["https://interop.esante.gouv.fr/StructureDefinition/PDSm-DocumentReference"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"DocumentReference_docref-1\"> </a><p class=\"res-header-id\"><b>Narratif généré : RéférenceDocument docref-1</b></p><a name=\"docref-1\"> </a><a name=\"hcdocref-1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profil: <code>https://interop.esante.gouv.fr/StructureDefinition/PDSm-DocumentReference</code></p></div><p><b>identifier</b>: <a href=\"http://terminology.hl7.org/6.0.2/NamingSystem-uri.html\" title=\"As defined by RFC 3986 (http://www.ietf.org/rfc/rfc3986.txt)(with many schemes defined in many RFCs). For OIDs and UUIDs, use the URN form (urn:oid:(note: lowercase) and urn:uuid:). See http://www.ietf.org/rfc/rfc3001.txt and http://www.ietf.org/rfc/rfc4122.txt \r\n\r\nThis oid is used as an identifier II.root to indicate the the extension is an absolute URI (technically, an IRI). Typically, this is used for OIDs and GUIDs. Note that when this OID is used with OIDs and GUIDs, the II.extension should start with urn:oid or urn:uuid: \r\n\r\nNote that this OID is created to aid with interconversion between CDA and FHIR - FHIR uses urn:ietf:rfc:3986 as equivalent to this OID. URIs as identifiers appear more commonly in FHIR.\r\n\r\nThis OID may also be used in CD.codeSystem.\">Uniform Resource Identifier (URI)</a>/urn:uuid:docref-1</p><p><b>status</b>: Current</p><p><b>type</b>: <span title=\"Codes :{urn:oid:1.2.250.1.213.1.1.4.12 11502-CR-BIO}\">Compte rendu de biologie</span></p><p><b>category</b>: <span title=\"Codes :{urn:oid:1.2.250.1.213.1.1.4.12 CR}\">CR</span></p><p><b>subject</b>: <a href=\"Bundle-PDSm-example-comprehensiveProvideDocumentBundleReplace.html#urn-uuid-patient-1\">JEAN DUPONT (official) Male, Date de Naissance :1989-07-09 ( urn:oid:1.2.250.1.213.1.4.8#189079912345678)</a></p><p><b>date</b>: 2026-03-19 10:00:00+0100</p><p><b>author</b>: <a href=\"Bundle-PDSm-example-comprehensiveProvideDocumentBundleReplace.html#urn-uuid-practitioner-1\">Practitioner ALICE MARTIN </a></p><p><b>custodian</b>: <a href=\"Bundle-PDSm-example-comprehensiveProvideDocumentBundleReplace.html#urn-uuid-organization-1\">Organization CENTRE HOSPITALIER DEMO</a></p><p><b>securityLabel</b>: <span title=\"Codes :{http://terminology.hl7.org/CodeSystem/v3-Confidentiality N}\">normal</span></p><blockquote><p><b>content</b></p><h3>Attachments</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>ContentType</b></td><td><b>Language</b></td><td><b>Url</b></td><td><b>Title</b></td><td><b>Creation</b></td></tr><tr><td style=\"display: none\">*</td><td>application/pdf</td><td>Français (France)</td><td><a href=\"Bundle-PDSm-example-comprehensiveProvideDocumentBundleReplace.html#urn-uuid-binary-1\">Binary: application/pdf (16 bytes base64)</a></td><td>Compte rendu biologique</td><td>2026-03-19 09:45:00+0100</td></tr></table><p><b>format</b>: inconnu: application/pdf (application/pdf)</p></blockquote><h3>Contexts</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>FacilityType</b></td><td><b>PracticeSetting</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes :{urn:oid:1.2.250.1.213.1.1.4.14 LABO}\">Laboratoire</span></td><td><span title=\"Codes :{urn:oid:1.2.250.1.213.1.1.4.13 01}\">Biologie médicale</span></td></tr></table></div>"
      },
      "identifier" : [{
        "system" : "urn:ietf:rfc:3986",
        "value" : "urn:uuid:docref-1"
      }],
      "status" : "current",
      "type" : {
        "coding" : [{
          "system" : "urn:oid:1.2.250.1.213.1.1.4.12",
          "code" : "11502-CR-BIO",
          "display" : "Compte rendu de biologie"
        }]
      },
      "category" : [{
        "coding" : [{
          "system" : "urn:oid:1.2.250.1.213.1.1.4.12",
          "code" : "CR"
        }]
      }],
      "subject" : {
        "reference" : "urn:uuid:patient-1"
      },
      "date" : "2026-03-19T10:00:00+01:00",
      "author" : [{
        "reference" : "urn:uuid:practitioner-1"
      }],
      "custodian" : {
        "reference" : "urn:uuid:organization-1"
      },
      "securityLabel" : [{
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v3-Confidentiality",
          "code" : "N"
        }]
      }],
      "content" : [{
        "attachment" : {
          "contentType" : "application/pdf",
          "language" : "fr-FR",
          "url" : "urn:uuid:binary-1",
          "title" : "Compte rendu biologique",
          "creation" : "2026-03-19T09:45:00+01:00"
        },
        "format" : {
          "system" : "urn:ietf:rfc:6838",
          "code" : "application/pdf"
        }
      }],
      "context" : {
        "facilityType" : {
          "coding" : [{
            "system" : "urn:oid:1.2.250.1.213.1.1.4.14",
            "code" : "LABO",
            "display" : "Laboratoire"
          }]
        },
        "practiceSetting" : {
          "coding" : [{
            "system" : "urn:oid:1.2.250.1.213.1.1.4.13",
            "code" : "01",
            "display" : "Biologie médicale"
          }]
        }
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "DocumentReference"
    }
  },
  {
    "fullUrl" : "urn:uuid:submission-1",
    "resource" : {
      "resourceType" : "List",
      "id" : "submission-1",
      "meta" : {
        "profile" : ["https://interop.esante.gouv.fr/StructureDefinition/PDSm-SubmissionSet"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"List_submission-1\"> </a><p class=\"res-header-id\"><b>Narratif généré : Liste submission-1</b></p><a name=\"submission-1\"> </a><a name=\"hcsubmission-1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profil: <code>https://interop.esante.gouv.fr/StructureDefinition/PDSm-SubmissionSet</code></p></div><table class=\"clstu\"><tr><td>Date : 2026-03-19 10:00:00+0100 </td><td>Mode : Working List </td><td>Statut : Current </td><td>Code : submissionset </td></tr><tr><td>Sujet : <a href=\"Bundle-PDSm-example-comprehensiveProvideDocumentBundleReplace.html#urn-uuid-patient-1\">JEAN DUPONT (official) Male, Date de Naissance :1989-07-09 ( urn:oid:1.2.250.1.213.1.4.8#189079912345678)</a></td></tr></table><table class=\"grid\"><tr style=\"backgound-color: #eeeeee\"><td><b>Éléments</b></td></tr><tr><td><a href=\"Bundle-PDSm-example-comprehensiveProvideDocumentBundleReplace.html#urn-uuid-docref-1\">DocumentReference : identifier = UUID:docref-1; status = current; type = Compte rendu de biologie; category = CR; date = 2026-03-19 10:00:00+0100; securityLabel = normal</a></td></tr></table></div>"
      },
      "identifier" : [{
        "system" : "urn:ietf:rfc:3986",
        "value" : "urn:uuid:submission-1"
      }],
      "status" : "current",
      "mode" : "working",
      "code" : {
        "coding" : [{
          "system" : "http://ihe.net/fhir/CodeSystem/MHDlistTypes",
          "code" : "submissionset"
        }]
      },
      "subject" : {
        "reference" : "urn:uuid:patient-1"
      },
      "date" : "2026-03-19T10:00:00+01:00",
      "entry" : [{
        "item" : {
          "reference" : "urn:uuid:docref-1"
        }
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "List"
    }
  }]
}

```
