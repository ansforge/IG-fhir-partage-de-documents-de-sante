Instance: Bundle-CRBio-Replace-Strict
InstanceOf: Bundle
Usage: #example

* type = #transaction
* meta.profile = "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-provide-document-bundle"

///////////////////////////////////////////////////////////
// PATIENT (INS qualifiée)
///////////////////////////////////////////////////////////

* entry[0].fullUrl = "urn:uuid:11111111-1111-4111-8111-111111111111"
* entry[0].resource = Patient-INS-Strict
* entry[0].request.method = #POST
* entry[0].request.url = "Patient"

Instance: Patient-INS-Strict
InstanceOf: Patient
Usage: #inline

* meta.profile = "https://interop.esante.gouv.fr/StructureDefinition/fr-core-patient"

* identifier[0].system = "urn:oid:1.2.250.1.213.1.4.8"
* identifier[0].value = "189079912345678"

* identifier[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/identifier-type"
* identifier[0].extension[0].valueCodeableConcept.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[0].extension[0].valueCodeableConcept.coding.code = #INS

* name[0].use = #official
* name[0].family = "DUPONT"
* name[0].given[0] = "JEAN"

* gender = #male
* birthDate = "1989-07-09"

///////////////////////////////////////////////////////////
// PRACTITIONER (RPPS)
///////////////////////////////////////////////////////////

* entry[1].fullUrl = "urn:uuid:22222222-2222-4222-8222-222222222222"
* entry[1].resource = Practitioner-Strict
* entry[1].request.method = #POST
* entry[1].request.url = "Practitioner"

Instance: Practitioner-Strict
InstanceOf: Practitioner
Usage: #inline

* meta.profile = "https://interop.esante.gouv.fr/StructureDefinition/fr-core-practitioner"

* identifier.system = "urn:oid:1.2.250.1.71.4.2.1"
* identifier.value = "10000000001"

* name.family = "MARTIN"
* name.given[0] = "ALICE"

///////////////////////////////////////////////////////////
// ORGANIZATION (FINESS)
///////////////////////////////////////////////////////////

* entry[2].fullUrl = "urn:uuid:33333333-3333-4333-8333-333333333333"
* entry[2].resource = Organization-Strict
* entry[2].request.method = #POST
* entry[2].request.url = "Organization"

Instance: Organization-Strict
InstanceOf: Organization
Usage: #inline

* meta.profile = "https://interop.esante.gouv.fr/StructureDefinition/fr-core-organization"

* identifier.system = "urn:oid:1.2.250.1.71.4.2.2"
* identifier.value = "750100015"

* name = "LABORATOIRE BIO DEMO"

///////////////////////////////////////////////////////////
// BINARY OLD
///////////////////////////////////////////////////////////

* entry[3].fullUrl = "urn:uuid:44444444-4444-4444-8444-444444444444"
* entry[3].resource = Binary-OLD-Strict
* entry[3].request.method = #POST
* entry[3].request.url = "Binary"

Instance: Binary-OLD-Strict
InstanceOf: Binary
Usage: #inline

* contentType = #application/pdf
* data = "SGVsbG8="

///////////////////////////////////////////////////////////
// BINARY NEW
///////////////////////////////////////////////////////////

* entry[4].fullUrl = "urn:uuid:55555555-5555-4555-8555-555555555555"
* entry[4].resource = Binary-NEW-Strict
* entry[4].request.method = #POST
* entry[4].request.url = "Binary"

Instance: Binary-NEW-Strict
InstanceOf: Binary
Usage: #inline

* contentType = #application/pdf
* data = "SGVsbG8="

///////////////////////////////////////////////////////////
// DOCUMENT OLD
///////////////////////////////////////////////////////////

* entry[5].fullUrl = "urn:uuid:66666666-6666-4666-8666-666666666666"
* entry[5].resource = DocRef-OLD-Strict
* entry[5].request.method = #POST
* entry[5].request.url = "DocumentReference"

Instance: DocRef-OLD-Strict
InstanceOf: DocumentReference
Usage: #inline

* meta.profile = "https://interop.esante.gouv.fr/StructureDefinition/PDSm-DocumentReference"

* status = #current

* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:old-doc"

* type.coding.system = "urn:oid:1.2.250.1.213.1.1.4.12"
* type.coding.code = "11502-CR-BIO"

* category[0].coding.system = "urn:oid:1.2.250.1.213.1.1.4.12"
* category[0].coding.code = "CR"

* subject.reference = "urn:uuid:11111111-1111-4111-8111-111111111111"

* date = "2026-03-18T10:00:00+01:00"

* author[0].reference = "urn:uuid:22222222-2222-4222-8222-222222222222"
* custodian.reference = "urn:uuid:33333333-3333-4333-8333-333333333333"

* securityLabel[0].coding.system = "http://terminology.hl7.org/CodeSystem/v3-Confidentiality"
* securityLabel[0].coding.code = #N

* content[0].attachment.contentType = #application/pdf
* content[0].attachment.url = "urn:uuid:44444444-4444-4444-8444-444444444444"

* content[0].format.system = "urn:ietf:rfc:6838"
* content[0].format.code = "application/pdf"

* context.practiceSetting.coding.system = "urn:oid:1.2.250.1.213.1.1.4.13"
* context.practiceSetting.coding.code = "01"

* context.facilityType.coding.system = "urn:oid:1.2.250.1.213.1.1.4.14"
* context.facilityType.coding.code = "LABO"

///////////////////////////////////////////////////////////
// DOCUMENT NEW (corrigé)
///////////////////////////////////////////////////////////

* entry[6].fullUrl = "urn:uuid:77777777-7777-4777-8777-777777777777"
* entry[6].resource = DocRef-NEW-Strict
* entry[6].request.method = #POST
* entry[6].request.url = "DocumentReference"

Instance: DocRef-NEW-Strict
InstanceOf: DocumentReference
Usage: #inline

* meta.profile = "https://interop.esante.gouv.fr/StructureDefinition/PDSm-DocumentReference"

* status = #current

* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:new-doc"

* type.coding.system = "urn:oid:1.2.250.1.213.1.1.4.12"
* type.coding.code = "11502-CR-BIO"

* category[0].coding.system = "urn:oid:1.2.250.1.213.1.1.4.12"
* category[0].coding.code = "CR"

* subject.reference = "urn:uuid:11111111-1111-4111-8111-111111111111"

* date = "2026-03-19T10:00:00+01:00"

* author[0].reference = "urn:uuid:22222222-2222-4222-8222-222222222222"
* custodian.reference = "urn:uuid:33333333-3333-4333-8333-333333333333"

* securityLabel[0].coding.system = "http://terminology.hl7.org/CodeSystem/v3-Confidentiality"
* securityLabel[0].coding.code = #N

* content[0].attachment.contentType = #application/pdf
* content[0].attachment.url = "urn:uuid:55555555-5555-4555-8555-555555555555"

* content[0].format.system = "urn:ietf:rfc:6838"
* content[0].format.code = "application/pdf"

* context.practiceSetting.coding.system = "urn:oid:1.2.250.1.213.1.1.4.13"
* context.practiceSetting.coding.code = "01"

* context.facilityType.coding.system = "urn:oid:1.2.250.1.213.1.1.4.14"
* context.facilityType.coding.code = "LABO"

* relatesTo[0].code = #replaces
* relatesTo[0].target.reference = "urn:uuid:66666666-6666-4666-8666-666666666666"

///////////////////////////////////////////////////////////
// SUBMISSIONSET
///////////////////////////////////////////////////////////

* entry[7].fullUrl = "urn:uuid:88888888-8888-4888-8888-888888888888"
* entry[7].resource = SubmissionSet-Strict
* entry[7].request.method = #POST
* entry[7].request.url = "List"

Instance: SubmissionSet-Strict
InstanceOf: List
Usage: #inline

* meta.profile = "https://interop.esante.gouv.fr/StructureDefinition/PDSm-SubmissionSet"

* status = #current
* mode = #working

* code.coding.system = "http://ihe.net/fhir/CodeSystem/MHDlistTypes"
* code.coding.code = #submissionset

* subject.reference = "urn:uuid:11111111-1111-4111-8111-111111111111"

* date = "2026-03-19T10:00:00+01:00"

* entry[0].item.reference = "urn:uuid:77777777-7777-4777-8777-777777777777"