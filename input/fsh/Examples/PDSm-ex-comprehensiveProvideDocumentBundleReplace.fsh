Alias: $v3-Confidentiality = http://terminology.hl7.org/CodeSystem/v3-Confidentiality
Alias: $MHDlistTypes = http://ihe.net/fhir/CodeSystem/MHDlistTypes

Instance: PDSm-example-comprehensiveProvideDocumentBundleReplace
InstanceOf: Bundle
Usage: #example
* type = #transaction
* meta.profile = "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-provide-document-bundle"
* timestamp = "2026-03-19T10:00:00+01:00"
* entry[0].fullUrl = "urn:uuid:patient-1"
* entry[=].resource = patient-1
* entry[=].request.method = #POST
* entry[=].request.url = "Patient"
* entry[+].fullUrl = "urn:uuid:practitioner-1"
* entry[=].resource = practitioner-1
* entry[=].request.method = #POST
* entry[=].request.url = "Practitioner"
* entry[+].fullUrl = "urn:uuid:organization-1"
* entry[=].resource = organization-1
* entry[=].request.method = #POST
* entry[=].request.url = "Organization"
* entry[+].fullUrl = "urn:uuid:binary-1"
* entry[=].resource = binary-1
* entry[=].request.method = #POST
* entry[=].request.url = "Binary"
* entry[+].fullUrl = "urn:uuid:docref-1"
* entry[=].resource = docref-1
* entry[=].request.method = #POST
* entry[=].request.url = "DocumentReference"
* entry[+].fullUrl = "urn:uuid:submission-1"
* entry[=].resource = submission-1
* entry[=].request.method = #POST
* entry[=].request.url = "List"

Instance: patient-1
InstanceOf: Patient
Usage: #inline
* meta.profile = "https://interop.esante.gouv.fr/StructureDefinition/fr-core-patient"
* identifier.system = "urn:oid:1.2.250.1.213.1.4.8"
* identifier.value = "189079912345678"
* name.use = #official
* name.family = "DUPONT"
* name.given = "JEAN"
* gender = #male
* birthDate = "1989-07-09"

Instance: practitioner-1
InstanceOf: Practitioner
Usage: #inline
* meta.profile = "https://interop.esante.gouv.fr/StructureDefinition/fr-core-practitioner"
* identifier.system = "urn:oid:1.2.250.1.71.4.2.1"
* identifier.value = "10000000001"
* name.family = "MARTIN"
* name.given = "ALICE"

Instance: organization-1
InstanceOf: Organization
Usage: #inline
* meta.profile = "https://interop.esante.gouv.fr/StructureDefinition/fr-core-organization"
* identifier.system = "urn:oid:1.2.250.1.71.4.2.2"
* identifier.value = "750100015"
* name = "CENTRE HOSPITALIER DEMO"

Instance: binary-1
InstanceOf: Binary
Usage: #inline
* contentType = #application/pdf
* data = "SGVsbG8gV29ybGQ="

Instance: docref-1
InstanceOf: DocumentReference
Usage: #inline
* meta.profile = "https://interop.esante.gouv.fr/StructureDefinition/PDSm-DocumentReference"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:docref-1"
* status = #current
* type = urn:oid:1.2.250.1.213.1.1.4.12#11502-CR-BIO "Compte rendu de biologie"
* category = urn:oid:1.2.250.1.213.1.1.4.12#CR
* subject = Reference(urn:uuid:patient-1)
* date = "2026-03-19T10:00:00+01:00"
* author = Reference(urn:uuid:practitioner-1)
* custodian = Reference(urn:uuid:organization-1)
* securityLabel = $v3-Confidentiality#N
* content.attachment.contentType = #application/pdf
* content.attachment.language = #fr-FR
* content.attachment.title = "Compte rendu biologique"
* content.attachment.creation = "2026-03-19T09:45:00+01:00"
* content.attachment.url = "urn:uuid:binary-1"
* content.format = urn:ietf:rfc:6838#application/pdf
* context.practiceSetting = urn:oid:1.2.250.1.213.1.1.4.13#01 "Biologie médicale"
* context.facilityType = urn:oid:1.2.250.1.213.1.1.4.14#LABO "Laboratoire"

Instance: submission-1
InstanceOf: List
Usage: #inline
* meta.profile = "https://interop.esante.gouv.fr/StructureDefinition/PDSm-SubmissionSet"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:submission-1"
* status = #current
* mode = #working
* code = $MHDlistTypes#submissionset
* subject = Reference(urn:uuid:patient-1)
* date = "2026-03-19T10:00:00+01:00"
* entry.item = Reference(urn:uuid:docref-1)