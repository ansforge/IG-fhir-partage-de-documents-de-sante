// ==========================================================
// BUNDLE PDSm IT-65 - CR BIO CORRIGÉ (JDV ANS)
// ==========================================================

Instance: Bundle-CRBio-Replace-ANS
InstanceOf: Bundle
Usage: #example

* meta.profile = "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-provide-document-bundle"
* type = #transaction

// ==========================================================
// PATIENT (INS-NIR simulé)
// ==========================================================

* entry[+].fullUrl = "urn:uuid:11111111-1111-4111-8111-111111111111"
* entry[=].resource.resourceType = "Patient"
* entry[=].resource.id = "patient-1"

* entry[=].resource.identifier.system = "urn:oid:1.2.250.1.213.1.4.8"
* entry[=].resource.identifier.value = "189079912345678"

* entry[=].resource.name.family = "DUPONT"
* entry[=].resource.name.given[0] = "JEAN"

* entry[=].resource.gender = #male
* entry[=].resource.birthDate = "1989-07-09"

* entry[=].request.method = #POST
* entry[=].request.url = "Patient"

// ==========================================================
// BINARY OLD
// ==========================================================

* entry[+].fullUrl = "urn:uuid:22222222-2222-4222-8222-222222222222"
* entry[=].resource.resourceType = "Binary"
* entry[=].resource.contentType = #application/pdf
* entry[=].resource.data = "SGVsbG8="
* entry[=].request.method = #POST
* entry[=].request.url = "Binary"

// ==========================================================
// BINARY NEW
// ==========================================================

* entry[+].fullUrl = "urn:uuid:33333333-3333-4333-8333-333333333333"
* entry[=].resource.resourceType = "Binary"
* entry[=].resource.contentType = #application/pdf
* entry[=].resource.data = "SGVsbG8="
* entry[=].request.method = #POST
* entry[=].request.url = "Binary"

// ==========================================================
// DOCUMENT OLD
// ==========================================================

* entry[+].fullUrl = "urn:uuid:44444444-4444-4444-8444-444444444444"
* entry[=].resource.resourceType = "DocumentReference"
* entry[=].resource.id = "doc-old"

* entry[=].resource.meta.profile = "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-documentreference"

* entry[=].resource.status = #current

* entry[=].resource.type.coding.system = "https://mos.esante.gouv.fr/NOS/TRE_A04-TypeDocument"
* entry[=].resource.type.coding.code = #11502

* entry[=].resource.category[0].coding.system = "https://mos.esante.gouv.fr/NOS/TRE_A05-CategorieDocument"
* entry[=].resource.category[0].coding.code = #CR

* entry[=].resource.content[0].format.system = "http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode"
* entry[=].resource.content[0].format.code = #urn:ihe:iti:xds-sd:pdf:2008

* entry[=].resource.content[0].attachment.contentType = #application/pdf
* entry[=].resource.content[0].attachment.url = "urn:uuid:22222222-2222-4222-8222-222222222222"

* entry[=].resource.subject.reference = "urn:uuid:11111111-1111-4111-8111-111111111111"

* entry[=].request.method = #POST
* entry[=].request.url = "DocumentReference"

// ==========================================================
// DOCUMENT NEW (REMPLACEMENT)
// ==========================================================

* entry[+].fullUrl = "urn:uuid:55555555-5555-4555-8555-555555555555"
* entry[=].resource.resourceType = "DocumentReference"
* entry[=].resource.id = "doc-new"

* entry[=].resource.meta.profile = "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-documentreference"

* entry[=].resource.status = #current
* entry[=].resource.type.coding.system = "https://mos.esante.gouv.fr/NOS/TRE_A04-TypeDocument"
* entry[=].resource.type.coding.code = #11502

* entry[=].resource.category[0].coding.system = "https://mos.esante.gouv.fr/NOS/TRE_A05-CategorieDocument"
* entry[=].resource.category[0].coding.code = #CR

* entry[=].resource.content[0].format.system = "http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode"
* entry[=].resource.content[0].format.code = #urn:ihe:iti:xds-sd:pdf:2008

* entry[=].resource.content[0].attachment.contentType = #application/pdf
* entry[=].resource.content[0].attachment.url = "urn:uuid:33333333-3333-4333-8333-333333333333"

* entry[=].resource.subject.reference = "urn:uuid:11111111-1111-4111-8111-111111111111"

//  mécanisme PDSm officiel
* entry[=].resource.relatesTo[0].code = #replaces
* entry[=].resource.relatesTo[0].target.reference = "urn:uuid:44444444-4444-4444-8444-444444444444"

* entry[=].request.method = #POST
* entry[=].request.url = "DocumentReference"

// ==========================================================
// SUBMISSIONSET
// ==========================================================

* entry[+].fullUrl = "urn:uuid:66666666-6666-4666-8666-666666666666"
* entry[=].resource.resourceType = "List"

* entry[=].resource.meta.profile = "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-submissionset"

* entry[=].resource.status = #current
* entry[=].resource.mode = #working

* entry[=].resource.code.coding.system = "http://ihe.net/fhir/CodeSystem/MHDlistTypes"
* entry[=].resource.code.coding.code = #submissionset

* entry[=].resource.subject.reference = "urn:uuid:11111111-1111-4111-8111-111111111111"

//  uniquement le nouveau doc
* entry[=].resource.entry[0].item.reference = "urn:uuid:55555555-5555-4555-8555-555555555555"

* entry[=].request.method = #POST
* entry[=].request.url = "List"