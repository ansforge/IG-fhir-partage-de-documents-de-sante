// ==========================================================
// BUNDLE PDSm ITI-65 : exemple de remplacement de document
// ==========================================================

Instance: bundle-exemple-comprehensiveprovidedocument-replace
InstanceOf: Bundle
Title: "Exemple de bundle ComprehensiveProvideDocument pour PDSm dans le contexte d'un remplacement de document"
Description: "Exemple illustratif du remplacement de Document conforme au profil PDSm_ComprehensiveDocumentReference et à ITI-65 :

* un document existant (DocumentReference/doc-old) est remplacé
* l'ancien est marqué superseded via un PATCH (géré par le Document Source)
* un nouveau document est publié avec relatesTo.code = #replaces
* le patient (Patient/fr-patient-123) est déjà enregistré sur le serveur avec une identité INS qualifiée — il n'est pas inclus dans le bundle
"
Usage: #example

* meta.profile = "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-provide-document-bundle"
* type = #transaction

// ==========================================================
// BINARY NOUVEAU DOCUMENT
// ==========================================================

* entry[+].fullUrl = "urn:uuid:33333333-3333-4333-8333-333333333333"
* entry[=].resource.resourceType = "Binary"
* entry[=].resource.contentType = #application/pdf
* entry[=].resource.data = "SGVsbG8="
* entry[=].request.method = #POST
* entry[=].request.url = "Binary"

// ==========================================================
// New DocumentReference (REMPLACEMENT)
// ==========================================================

* entry[+].fullUrl = "urn:uuid:55555555-5555-4555-8555-555555555555"
* entry[=].resource.resourceType = "DocumentReference"
* entry[=].resource.id = "doc-new"

* entry[=].resource.meta.profile = "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"

// Ressources contenues obligatoires : auteur (PractitionerRole) et authentificateur (Organization)
* entry[=].resource.contained[0].resourceType = "PractitionerRole"
* entry[=].resource.contained[0].id = "auteur"
* entry[=].resource.contained[0].identifier.system = "https://rpps.esante.gouv.fr"
* entry[=].resource.contained[0].identifier.value = "1011848351"

* entry[=].resource.contained[1].resourceType = "Organization"
* entry[=].resource.contained[1].id = "authentificateur"
* entry[=].resource.contained[1].identifier.system = "urn:oid:1.2.250.1.71.4.2.2"
* entry[=].resource.contained[1].identifier.value = "2264403106"
* entry[=].resource.contained[1].name = "HOPITAL INTERCOMMUNAL DE LA PRESQU'ILE G"

* entry[=].resource.masterIdentifier.system = "urn:ietf:rfc:3986"
* entry[=].resource.masterIdentifier.value = "urn:uuid:55555555-5555-4555-8555-555555555555"

* entry[=].resource.status = #current

* entry[=].resource.type.coding.system = "http://loinc.org"
* entry[=].resource.type.coding.code = #34133-9
* entry[=].resource.type.coding.display = "Synthèse d'épisode de soins"

* entry[=].resource.category[0].coding.system = "https://mos.esante.gouv.fr/NOS/TRE_A03-ClasseDocument/FHIR/TRE-A03-ClasseDocument"
* entry[=].resource.category[0].coding.code = #10
* entry[=].resource.category[0].coding.display = "Compte rendu"

// Référence vers le patient déjà enregistré sur le serveur avec son INS
* entry[=].resource.subject.reference = "Patient/fr-patient-123"

* entry[=].resource.date = "2025-06-01T12:00:00+01:00"

* entry[=].resource.author[0].reference = "#auteur"

* entry[=].resource.authenticator.reference = "#authentificateur"

* entry[=].resource.description = "Compte rendu de consultation - version de remplacement"

* entry[=].resource.securityLabel[0].coding.system = "https://mos.esante.gouv.fr/NOS/TRE_A07-StatusVisibiliteDocument/FHIR/TRE-A07-StatusVisibiliteDocument"
* entry[=].resource.securityLabel[0].coding.code = #N
* entry[=].resource.securityLabel[0].coding.display = "Normal"

* entry[=].resource.content[0].attachment.contentType = #application/pdf
* entry[=].resource.content[0].attachment.language = #fr-FR
* entry[=].resource.content[0].attachment.url = "urn:uuid:33333333-3333-4333-8333-333333333333"
* entry[=].resource.content[0].attachment.size = 5
* entry[=].resource.content[0].attachment.hash = "qvTGHdzF6KLavt4PO0gs2a6pQ00="
* entry[=].resource.content[0].attachment.title = "CR Consultation - Version remplaçante"
* entry[=].resource.content[0].attachment.creation = "2025-06-01T10:00:00+01:00"

* entry[=].resource.content[0].format.system = "https://mos.esante.gouv.fr/NOS/TRE_A11-IheFormatCode/FHIR/TRE-A11-IheFormatCode"
* entry[=].resource.content[0].format.code = #urn:ihe:iti:xds-sd:pdf:2008

* entry[=].resource.context.period.start = "2025-06-01T08:00:00+01:00"
* entry[=].resource.context.period.end = "2025-06-01T10:00:00+01:00"

* entry[=].resource.context.facilityType.coding.system = "https://mos.esante.gouv.fr/NOS/TRE_R02-SecteurActivite/FHIR/TRE-R02-SecteurActivite"
* entry[=].resource.context.facilityType.coding.code = #SA01
* entry[=].resource.context.facilityType.coding.display = "Etablissement public de santé"

* entry[=].resource.context.practiceSetting.coding.system = "https://mos.esante.gouv.fr/NOS/TRE_A01-CadreExercice/FHIR/TRE-A01-CadreExercice"
* entry[=].resource.context.practiceSetting.coding.code = #ETABLISSEMENT
* entry[=].resource.context.practiceSetting.coding.display = "Etablissement de santé"

// Référence vers le patient déjà enregistré sur le serveur avec son INS
* entry[=].resource.context.sourcePatientInfo.reference = "Patient/fr-patient-123"

// REMPLACEMENT : référence vers le documentreference existant sur le serveur
* entry[=].resource.relatesTo[0].code = #replaces
* entry[=].resource.relatesTo[0].target.reference = "DocumentReference/doc-old"

* entry[=].request.method = #POST
* entry[=].request.url = "DocumentReference"


// ==========================================================
// PATCH MHD - status = superseded sur l'ancien DocumentReference
// ==========================================================

* entry[+].fullUrl = "urn:uuid:77777777-7777-4777-8777-777777777777"

* entry[=].resource.resourceType = "Parameters"

* entry[=].resource.meta.profile = "https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Patch.Parameters"

// opération
* entry[=].resource.parameter[0].name = "operation"

// path
* entry[=].resource.parameter[0].part[0].name = "path"
* entry[=].resource.parameter[0].part[0].valueString = "DocumentReference.status"

// type = replace
* entry[=].resource.parameter[0].part[1].name = "type"
* entry[=].resource.parameter[0].part[1].valueCode = #replace

// value = superseded
* entry[=].resource.parameter[0].part[2].name = "value"
* entry[=].resource.parameter[0].part[2].valueCode = #superseded

// requête PATCH sur l'ancien documentreference (déjà présent sur le serveur)
* entry[=].request.method = #PATCH
* entry[=].request.url = "DocumentReference/doc-old"


// ==========================================================
// SUBMISSIONSET
// ==========================================================

* entry[+].fullUrl = "urn:uuid:66666666-6666-4666-8666-666666666666"
* entry[=].resource.resourceType = "List"

* entry[=].resource.meta.profile = "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-submissionset-comprehensive"

// Ressource contenue obligatoire : auteur du lot de soumission
* entry[=].resource.contained[0].resourceType = "PractitionerRole"
* entry[=].resource.contained[0].id = "source-auteur"
* entry[=].resource.contained[0].identifier.system = "https://rpps.esante.gouv.fr"
* entry[=].resource.contained[0].identifier.value = "1011848351"

// Extensions obligatoires
* entry[=].resource.extension[0].url = "https://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-designationType"
* entry[=].resource.extension[0].valueCodeableConcept.coding.system = "https://mos.esante.gouv.fr/NOS/TRE_R02-SecteurActivite/FHIR/TRE-R02-SecteurActivite"
* entry[=].resource.extension[0].valueCodeableConcept.coding.code = #SA01
* entry[=].resource.extension[0].valueCodeableConcept.coding.display = "Etablissement public de santé"

* entry[=].resource.extension[1].url = "https://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-sourceId"
* entry[=].resource.extension[1].valueIdentifier.system = "urn:oid:1.2.250.1.213.1.1.1"
* entry[=].resource.extension[1].valueIdentifier.value = "SRC-01"

* entry[=].resource.status = #current
* entry[=].resource.mode = #working

* entry[=].resource.date = "2025-06-01T12:00:00+01:00"

* entry[=].resource.code.coding.system = "https://profiles.ihe.net/ITI/MHD/CodeSystem/MHDlistTypes"
* entry[=].resource.code.coding.code = #submissionset

// Référence vers le patient déjà enregistré sur le serveur avec son INS
* entry[=].resource.subject.reference = "Patient/fr-patient-123"

// Auteur du lot de soumission (contained)
* entry[=].resource.source.reference = "#source-auteur"

* entry[=].resource.entry[0].item.reference = "urn:uuid:55555555-5555-4555-8555-555555555555"

* entry[=].request.method = #POST
* entry[=].request.url = "List"
