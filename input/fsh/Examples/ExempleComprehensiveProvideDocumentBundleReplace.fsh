// ==========================================================
// BUNDLE PDSm ITI-65 : exemple de remplacement de document
// ==========================================================

// --- PractitionerRole minimal (contained dans DocumentReference et SubmissionSet) ---
// Le profil as-practitionerrole requiert fr-core-practitioner-role dans meta.profile

Instance: pr-auteur-replace
InstanceOf: PractitionerRole
Usage: #inline
* meta.profile[0] = "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitionerrole"
* meta.profile[+] = "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner-role"
* identifier.system = "https://rpps.esante.gouv.fr"
* identifier.value = "1011848351"
* active = true


// --- Organization (contained dans DocumentReference) ---
// Le profil as-organization requiert fr-core-organization dans meta.profile
// L'identifiant doit avoir le type IDNST pour correspondre au slice as-organization

Instance: org-auth-replace
InstanceOf: Organization
Usage: #inline
* meta.profile[0] = "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-organization"
* meta.profile[+] = "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization"
* identifier.type.coding.system = "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203"
* identifier.type.coding.code = #IDNST
* identifier.system = "urn:oid:1.2.250.1.71.4.2.2"
* identifier.value = "2264403106"
* name = "HOPITAL INTERCOMMUNAL DE LA PRESQU'ILE G"


// --- Patient local (contained obligatoire dans DocumentReference — aggregation = contained selon MHD) ---

Instance: patient-local-replace
InstanceOf: FRCorePatientProfile
Usage: #inline
* identifier[0].system = "urn:oid:1.2.250.1.213.1.4.8"
* identifier[0].value = "180017505600103"
* name[0].use = #official
* name[0].family = "Claire"
* name[0].given = "Martin"
* gender = #male
* birthDate = "1980-01-15"


// --- Binary : nouveau document à déposer ---

Instance: binary-doc-new-replace
InstanceOf: Binary
Usage: #inline
* contentType = #application/pdf
* data = "SGVsbG8="


// --- DocumentReference : nouveau document (remplacement) ---
// MHD v4.0.1 impose aggregation=contained pour author, authenticator et context.sourcePatientInfo

Instance: docref-doc-new-replace
InstanceOf: PDSm_ComprehensiveDocumentReference
Usage: #inline

* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:55555555-5555-4555-8555-555555555555"

* contained[0] = pr-auteur-replace
* contained[1] = org-auth-replace
* contained[2] = patient-local-replace

* status = #current

* type = http://loinc.org#34133-9

* category = https://mos.esante.gouv.fr/NOS/TRE_A03-ClasseDocument/FHIR/TRE-A03-ClasseDocument#10 "Compte rendu"

* subject = Reference(fr-patient-123)

* date = "2025-06-01T12:00:00+01:00"

* author = Reference(pr-auteur-replace)

* authenticator = Reference(org-auth-replace)

* description = "Compte rendu de consultation - version de remplacement"

* securityLabel = https://mos.esante.gouv.fr/NOS/TRE_A07-StatusVisibiliteDocument/FHIR/TRE-A07-StatusVisibiliteDocument#N "Normal"

* content[0].attachment.contentType = #application/pdf
* content[0].attachment.language = #fr-FR
* content[0].attachment.url = "urn:uuid:33333333-3333-4333-8333-333333333333"
* content[0].attachment.size = 5
* content[0].attachment.hash = "qvTGHdzF6KLavt4PO0gs2a6pQ00="
* content[0].attachment.title = "CR Consultation - Version remplaçante"
* content[0].attachment.creation = "2025-06-01T10:00:00+01:00"

* content[0].format = https://mos.esante.gouv.fr/NOS/TRE_A11-IheFormatCode/FHIR/TRE-A11-IheFormatCode#urn:ihe:iti:xds-sd:pdf:2008

* context.period.start = "2025-06-01T08:00:00+01:00"
* context.period.end = "2025-06-01T10:00:00+01:00"

* context.facilityType = https://mos.esante.gouv.fr/NOS/TRE_R02-SecteurActivite/FHIR/TRE-R02-SecteurActivite#SA01 "Etablissement public de santé"

* context.practiceSetting = https://mos.esante.gouv.fr/NOS/TRE_A01-CadreExercice/FHIR/TRE-A01-CadreExercice#ETABLISSEMENT "Etablissement de santé"

// Snapshot local du patient (aggregation = contained, obligatoire dans MHD)
* context.sourcePatientInfo = Reference(patient-local-replace)

// REMPLACEMENT : référence vers le DocumentReference existant sur le serveur
* relatesTo[0].code = #replaces
* relatesTo[0].target.reference = "DocumentReference/doc-old"


// --- Parameters : PATCH pour marquer l'ancien DocumentReference comme superseded ---

Instance: patch-params-replace
InstanceOf: Parameters
Usage: #inline
* meta.profile = "https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Patch.Parameters"
* parameter[0].name = "operation"
* parameter[0].part[0].name = "path"
* parameter[0].part[0].valueString = "DocumentReference.status"
* parameter[0].part[1].name = "type"
* parameter[0].part[1].valueCode = #replace
* parameter[0].part[2].name = "value"
* parameter[0].part[2].valueCode = #superseded


// --- SubmissionSet : lot de soumission ---

Instance: submissionset-doc-replace
InstanceOf: PDSm_SubmissionSetComprehensive
Usage: #inline

* contained[0] = pr-auteur-replace

* extension[designationType].valueCodeableConcept = https://mos.esante.gouv.fr/NOS/TRE_R02-SecteurActivite/FHIR/TRE-R02-SecteurActivite#SA01 "Etablissement public de santé"

* extension[ihe-sourceId].valueIdentifier.system = "urn:oid:1.2.250.1.213.1.1.1"
* extension[ihe-sourceId].valueIdentifier.value = "SRC-01"

* status = #current
* mode = #working

* date = "2025-06-01T12:00:00+01:00"

* code = https://profiles.ihe.net/ITI/MHD/CodeSystem/MHDlistTypes#submissionset

* subject = Reference(fr-patient-123)

* source = Reference(pr-auteur-replace)

// Référence par fullUrl urn:uuid pour cohérence avec l'entrée du bundle
* entry[0].item.reference = "urn:uuid:55555555-5555-4555-8555-555555555555"


// --- DocumentReference existant sur le serveur (cible du remplacement) ---
// Cet exemple représente la fiche qui sera marquée superseded par le PATCH.

Instance: doc-old
InstanceOf: PDSm_ComprehensiveDocumentReference
Title: "Exemple de DocumentReference existant - cible du remplacement"
Description: "Fiche de document existante sur le serveur DMP, remplacée par le bundle d'exemple ITI-65."
Usage: #example

* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:44444444-4444-4444-8444-444444444444"

* contained[0] = practitionerrole-example
* contained[1] = org-example

* status = #superseded

* type = http://loinc.org#34133-9

* category = https://mos.esante.gouv.fr/NOS/TRE_A03-ClasseDocument/FHIR/TRE-A03-ClasseDocument#10 "Compte rendu"

* subject = Reference(fr-patient-123)

* date = "2025-01-01T10:00:00+01:00"

* author = Reference(practitionerrole-example)

* authenticator = Reference(org-example)

* description = "Compte rendu de consultation - version initiale (remplacée)"

* securityLabel = https://mos.esante.gouv.fr/NOS/TRE_A07-StatusVisibiliteDocument/FHIR/TRE-A07-StatusVisibiliteDocument#N "Normal"

* content[0].attachment.contentType = #application/pdf
* content[0].attachment.language = #fr-FR
* content[0].attachment.url = "Binary/6789"
* content[0].attachment.size = 345678
* content[0].attachment.hash = "2jmj7l5rSw0yVb/vlWAYkK/YBwk="
* content[0].attachment.title = "CR Consultation - Version initiale"
* content[0].attachment.creation = "2025-01-01T09:00:00+01:00"

* content[0].format = https://mos.esante.gouv.fr/NOS/TRE_A11-IheFormatCode/FHIR/TRE-A11-IheFormatCode#urn:ihe:iti:xds-sd:pdf:2008

* context.period.start = "2025-01-01T08:00:00+01:00"
* context.period.end = "2025-01-01T10:00:00+01:00"

* context.facilityType = https://mos.esante.gouv.fr/NOS/TRE_R02-SecteurActivite/FHIR/TRE-R02-SecteurActivite#SA01 "Etablissement public de santé"

* context.practiceSetting = https://mos.esante.gouv.fr/NOS/TRE_A01-CadreExercice/FHIR/TRE-A01-CadreExercice#ETABLISSEMENT "Etablissement de santé"

* context.sourcePatientInfo = Reference(fr-patient-123)


// --- Bundle complet ---

Instance: bundle-exemple-comprehensiveprovidedocument-replace
InstanceOf: PDSm_ComprehensiveProvideDocumentBundle
Title: "Exemple de bundle ComprehensiveProvideDocument pour PDSm dans le contexte d'un remplacement de document"
Description: "Exemple illustratif du remplacement de Document conforme au profil PDSm_ComprehensiveDocumentReference et à ITI-65 :

* un document existant (DocumentReference/doc-old) est remplacé
* l'ancien est marqué superseded via un PATCH (géré par le Document Source)
* un nouveau document est publié avec relatesTo.code = #replaces
* le patient (Patient/fr-patient-123) est déjà enregistré sur le serveur avec une identité INS qualifiée — il n'est pas inclus dans le bundle
"
Usage: #example

* type = #transaction

// Lot de soumission (SubmissionSet)
* entry[SubmissionSet].fullUrl = "urn:uuid:66666666-6666-4666-8666-666666666666"
* entry[SubmissionSet].resource = submissionset-doc-replace
* entry[SubmissionSet].request.method = #POST
* entry[SubmissionSet].request.url = "List"

// Nouvelle fiche de document (DocumentReference de remplacement)
* entry[DocumentRefs].fullUrl = "urn:uuid:55555555-5555-4555-8555-555555555555"
* entry[DocumentRefs].resource = docref-doc-new-replace
* entry[DocumentRefs].request.method = #POST
* entry[DocumentRefs].request.url = "DocumentReference"

// PATCH MHD — mise à jour du statut de l'ancien DocumentReference à superseded
* entry[UpdateDocumentRefs].fullUrl = "urn:uuid:77777777-7777-4777-8777-777777777777"
* entry[UpdateDocumentRefs].resource = patch-params-replace
* entry[UpdateDocumentRefs].request.method = #PATCH
* entry[UpdateDocumentRefs].request.url = "DocumentReference/doc-old"

// Document binaire (nouveau contenu PDF)
* entry[Documents].fullUrl = "urn:uuid:33333333-3333-4333-8333-333333333333"
* entry[Documents].resource = binary-doc-new-replace
* entry[Documents].request.method = #POST
* entry[Documents].request.url = "Binary"
