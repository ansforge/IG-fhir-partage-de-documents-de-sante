# Exemple de bundle ComprehensiveProvideDocument pour PDSm dans le contexte d'un remplacement de document - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Exemple de bundle ComprehensiveProvideDocument pour PDSm dans le contexte d'un remplacement de document**

## Example Bundle: Exemple de bundle ComprehensiveProvideDocument pour PDSm dans le contexte d'un remplacement de document



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "bundle-exemple-comprehensiveprovidedocument-replace",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-provide-document-bundle"]
  },
  "type" : "transaction",
  "entry" : [{
    "fullUrl" : "urn:uuid:33333333-3333-4333-8333-333333333333",
    "resource" : {
      "resourceType" : "Binary",
      "contentType" : "application/pdf",
      "data" : "SGVsbG8="
    },
    "request" : {
      "method" : "POST",
      "url" : "Binary"
    }
  },
  {
    "fullUrl" : "urn:uuid:55555555-5555-4555-8555-555555555555",
    "resource" : {
      "resourceType" : "DocumentReference",
      "id" : "doc-new",
      "meta" : {
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"DocumentReference_doc-new\"> </a><p class=\"res-header-id\"><b>Narratif généré : RéférenceDocument doc-new</b></p><a name=\"doc-new\"> </a><a name=\"hcdoc-new\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profil: <a href=\"StructureDefinition-pdsm-comprehensive-document-reference.html\">PDSm Comprehensive DocumentReference</a></p></div><p><b>masterIdentifier</b>: <a href=\"http://terminology.hl7.org/6.0.2/NamingSystem-uri.html\" title=\"As defined by RFC 3986 (http://www.ietf.org/rfc/rfc3986.txt)(with many schemes defined in many RFCs). For OIDs and UUIDs, use the URN form (urn:oid:(note: lowercase) and urn:uuid:). See http://www.ietf.org/rfc/rfc3001.txt and http://www.ietf.org/rfc/rfc4122.txt \r\n\r\nThis oid is used as an identifier II.root to indicate the the extension is an absolute URI (technically, an IRI). Typically, this is used for OIDs and GUIDs. Note that when this OID is used with OIDs and GUIDs, the II.extension should start with urn:oid or urn:uuid: \r\n\r\nNote that this OID is created to aid with interconversion between CDA and FHIR - FHIR uses urn:ietf:rfc:3986 as equivalent to this OID. URIs as identifiers appear more commonly in FHIR.\r\n\r\nThis OID may also be used in CD.codeSystem.\">Uniform Resource Identifier (URI)</a>/urn:uuid:55555555-5555-4555-8555-555555555555</p><p><b>status</b>: Current</p><p><b>type</b>: <span title=\"Codes :{http://loinc.org 34133-9}\">Synthèse d'épisode de soins</span></p><p><b>category</b>: <span title=\"Codes :{https://mos.esante.gouv.fr/NOS/TRE_A03-ClasseDocument/FHIR/TRE-A03-ClasseDocument 10}\">Compte rendu</span></p><p><b>subject</b>: <a href=\"Patient-fr-patient-123.html\">Martin Claire (official) Male, Date de Naissance :1980-01-15 ( NIR: 180017505600103 (use: official, ))</a></p><p><b>date</b>: 2025-06-01 12:00:00+0100</p><p><b>author</b>: <a href=\"#hcdoc-new/auteur\">PractitionerRole : identifier = https://rpps.esante.gouv.fr#1011848351</a></p><p><b>authenticator</b>: <a href=\"#hcdoc-new/authentificateur\">Organization HOPITAL INTERCOMMUNAL DE LA PRESQU'ILE G</a></p><h3>RelatesTos</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Code</b></td><td><b>Target</b></td></tr><tr><td style=\"display: none\">*</td><td>Replaces</td><td><a href=\"DocumentReference/doc-old\">DocumentReference/doc-old</a></td></tr></table><p><b>description</b>: Compte rendu de consultation - version de remplacement</p><p><b>securityLabel</b>: <span title=\"Codes :{https://mos.esante.gouv.fr/NOS/TRE_A07-StatusVisibiliteDocument/FHIR/TRE-A07-StatusVisibiliteDocument N}\">Normal</span></p><blockquote><p><b>content</b></p><h3>Attachments</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>ContentType</b></td><td><b>Language</b></td><td><b>Url</b></td><td><b>Size</b></td><td><b>Hash</b></td><td><b>Title</b></td><td><b>Creation</b></td></tr><tr><td style=\"display: none\">*</td><td>application/pdf</td><td>Français (France)</td><td><a href=\"Bundle-bundle-exemple-comprehensiveprovidedocument-replace.html#urn-uuid-33333333-3333-4333-8333-333333333333\">Binary: application/pdf (8 bytes base64)</a></td><td>5</td><td><code>qvTGHdzF6KLavt4PO0gs2a6pQ00=</code></td><td>CR Consultation - Version remplaçante</td><td>2025-06-01 10:00:00+0100</td></tr></table><p><b>format</b>: <a href=\"https://interop.esante.gouv.fr/terminologies/1.7.0/CodeSystem-TRE-A11-IheFormatCode.html#TRE-A11-IheFormatCode-urn.58ihe.58iti.58xds-sd.58pdf.582008\">TRE_A11_IheFormatCode: urn:ihe:iti:xds-sd:pdf:2008</a> (xds-sd:pdf)</p></blockquote><h3>Contexts</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Period</b></td><td><b>FacilityType</b></td><td><b>PracticeSetting</b></td><td><b>SourcePatientInfo</b></td></tr><tr><td style=\"display: none\">*</td><td>2025-06-01 08:00:00+0100 --&gt; 2025-06-01 10:00:00+0100</td><td><span title=\"Codes :{https://mos.esante.gouv.fr/NOS/TRE_R02-SecteurActivite/FHIR/TRE-R02-SecteurActivite SA01}\">Etablissement public de santé</span></td><td><span title=\"Codes :{https://mos.esante.gouv.fr/NOS/TRE_A01-CadreExercice/FHIR/TRE-A01-CadreExercice ETABLISSEMENT}\">Etablissement de santé</span></td><td><a href=\"Patient-fr-patient-123.html\">Martin Claire (official) Male, Date de Naissance :1980-01-15 ( NIR: 180017505600103 (use: official, ))</a></td></tr></table><hr/><blockquote><p class=\"res-header-id\"><b>Narratif généré : PractitionerRole #auteur</b></p><a name=\"doc-new/auteur\"> </a><a name=\"hcdoc-new/auteur\"> </a><p><b>identifier</b>: <code>https://rpps.esante.gouv.fr</code>/1011848351</p></blockquote><hr/><blockquote><p class=\"res-header-id\"><b>Narratif généré : Organisation #authentificateur</b></p><a name=\"doc-new/authentificateur\"> </a><a name=\"hcdoc-new/authentificateur\"> </a><p><b>identifier</b>: <code>urn:oid:1.2.250.1.71.4.2.2</code>/2264403106</p><p><b>name</b>: HOPITAL INTERCOMMUNAL DE LA PRESQU'ILE G</p></blockquote></div>"
      },
      "contained" : [{
        "resourceType" : "PractitionerRole",
        "id" : "auteur",
        "identifier" : [{
          "system" : "https://rpps.esante.gouv.fr",
          "value" : "1011848351"
        }]
      },
      {
        "resourceType" : "Organization",
        "id" : "authentificateur",
        "identifier" : [{
          "system" : "urn:oid:1.2.250.1.71.4.2.2",
          "value" : "2264403106"
        }],
        "name" : "HOPITAL INTERCOMMUNAL DE LA PRESQU'ILE G"
      }],
      "masterIdentifier" : {
        "system" : "urn:ietf:rfc:3986",
        "value" : "urn:uuid:55555555-5555-4555-8555-555555555555"
      },
      "status" : "current",
      "type" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "34133-9",
          "display" : "Synthèse d'épisode de soins"
        }]
      },
      "category" : [{
        "coding" : [{
          "system" : "https://mos.esante.gouv.fr/NOS/TRE_A03-ClasseDocument/FHIR/TRE-A03-ClasseDocument",
          "code" : "10",
          "display" : "Compte rendu"
        }]
      }],
      "subject" : {
        "reference" : "Patient/fr-patient-123"
      },
      "date" : "2025-06-01T12:00:00+01:00",
      "author" : [{
        "reference" : "#auteur"
      }],
      "authenticator" : {
        "reference" : "#authentificateur"
      },
      "relatesTo" : [{
        "code" : "replaces",
        "target" : {
          "reference" : "DocumentReference/doc-old"
        }
      }],
      "description" : "Compte rendu de consultation - version de remplacement",
      "securityLabel" : [{
        "coding" : [{
          "system" : "https://mos.esante.gouv.fr/NOS/TRE_A07-StatusVisibiliteDocument/FHIR/TRE-A07-StatusVisibiliteDocument",
          "code" : "N",
          "display" : "Normal"
        }]
      }],
      "content" : [{
        "attachment" : {
          "contentType" : "application/pdf",
          "language" : "fr-FR",
          "url" : "urn:uuid:33333333-3333-4333-8333-333333333333",
          "size" : 5,
          "hash" : "qvTGHdzF6KLavt4PO0gs2a6pQ00=",
          "title" : "CR Consultation - Version remplaçante",
          "creation" : "2025-06-01T10:00:00+01:00"
        },
        "format" : {
          "system" : "https://mos.esante.gouv.fr/NOS/TRE_A11-IheFormatCode/FHIR/TRE-A11-IheFormatCode",
          "code" : "urn:ihe:iti:xds-sd:pdf:2008"
        }
      }],
      "context" : {
        "period" : {
          "start" : "2025-06-01T08:00:00+01:00",
          "end" : "2025-06-01T10:00:00+01:00"
        },
        "facilityType" : {
          "coding" : [{
            "system" : "https://mos.esante.gouv.fr/NOS/TRE_R02-SecteurActivite/FHIR/TRE-R02-SecteurActivite",
            "code" : "SA01",
            "display" : "Etablissement public de santé"
          }]
        },
        "practiceSetting" : {
          "coding" : [{
            "system" : "https://mos.esante.gouv.fr/NOS/TRE_A01-CadreExercice/FHIR/TRE-A01-CadreExercice",
            "code" : "ETABLISSEMENT",
            "display" : "Etablissement de santé"
          }]
        },
        "sourcePatientInfo" : {
          "reference" : "Patient/fr-patient-123"
        }
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "DocumentReference"
    }
  },
  {
    "fullUrl" : "urn:uuid:77777777-7777-4777-8777-777777777777",
    "resource" : {
      "resourceType" : "Parameters",
      "meta" : {
        "profile" : ["https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Patch.Parameters"]
      },
      "parameter" : [{
        "name" : "operation",
        "part" : [{
          "name" : "path",
          "valueString" : "DocumentReference.status"
        },
        {
          "name" : "type",
          "valueCode" : "replace"
        },
        {
          "name" : "value",
          "valueCode" : "superseded"
        }]
      }]
    },
    "request" : {
      "method" : "PATCH",
      "url" : "DocumentReference/doc-old"
    }
  },
  {
    "fullUrl" : "urn:uuid:66666666-6666-4666-8666-666666666666",
    "resource" : {
      "resourceType" : "List",
      "meta" : {
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-submissionset-comprehensive"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"List_null\"> </a><p class=\"res-header-id\"><b>Narratif généré : Liste </b></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profil: <a href=\"StructureDefinition-pdsm-submissionset-comprehensive.html\">PDSm SubmissionSet Comprehensive</a></p></div><table class=\"clstu\"><tr><td>Date : 2025-06-01 12:00:00+0100 </td><td>Mode : Working List </td><td>Statut : Current </td><td>Code : SubmissionSet as a FHIR List </td></tr><tr><td>Sujet : <a href=\"Patient-fr-patient-123.html\">Martin Claire (official) Male, Date de Naissance :1980-01-15 ( NIR: 180017505600103 (use: official, ))</a>Source </td></tr></table><table class=\"grid\"><tr style=\"backgound-color: #eeeeee\"><td><b>Éléments</b></td></tr><tr><td><a href=\"Bundle-bundle-exemple-comprehensiveprovidedocument-replace.html#urn-uuid-55555555-5555-4555-8555-555555555555\">DocumentReference : masterIdentifier = UUID:55555555-5555-4555-8555-555555555555; status = current; type = Synthèse d'épisode de soins; category = Compte rendu; date = 2025-06-01 12:00:00+0100; description = Compte rendu de consultation - version de remplacement; securityLabel = Normal</a></td></tr></table><hr/><p><b>Ressource contenue</b></p><hr/><a name=\"null/source-auteur\"> </a><p class=\"res-header-id\"><b>PractitionerRole #source-auteur</b></p><a name=\"hcnull/source-auteur\"> </a><p><b>identifier</b>: <code>https://rpps.esante.gouv.fr</code>/1011848351</p></div>"
      },
      "contained" : [{
        "resourceType" : "PractitionerRole",
        "id" : "source-auteur",
        "identifier" : [{
          "system" : "https://rpps.esante.gouv.fr",
          "value" : "1011848351"
        }]
      }],
      "extension" : [{
        "url" : "https://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-designationType",
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "https://mos.esante.gouv.fr/NOS/TRE_R02-SecteurActivite/FHIR/TRE-R02-SecteurActivite",
            "code" : "SA01",
            "display" : "Etablissement public de santé"
          }]
        }
      },
      {
        "url" : "https://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-sourceId",
        "valueIdentifier" : {
          "system" : "urn:oid:1.2.250.1.213.1.1.1",
          "value" : "SRC-01"
        }
      }],
      "status" : "current",
      "mode" : "working",
      "code" : {
        "coding" : [{
          "system" : "https://profiles.ihe.net/ITI/MHD/CodeSystem/MHDlistTypes",
          "code" : "submissionset"
        }]
      },
      "subject" : {
        "reference" : "Patient/fr-patient-123"
      },
      "date" : "2025-06-01T12:00:00+01:00",
      "source" : {
        "reference" : "#source-auteur"
      },
      "entry" : [{
        "item" : {
          "reference" : "urn:uuid:55555555-5555-4555-8555-555555555555"
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
