Alias: $v3-Confidentiality = http://terminology.hl7.org/CodeSystem/v3-Confidentiality
Alias: $MHDlistTypes = http://ihe.net/fhir/CodeSystem/MHDlistTypes

Instance: PDSm-example-comprehensiveProvideDocumentBundleReplace
InstanceOf: Bundle
Usage: #example
* type = #transaction
* meta.profile = "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-provide-document-bundle"
* timestamp = "2026-03-19T10:00:00+01:00"
* entry[0].fullUrl = "urn:uuid:fr-patient-123"
* entry[=].resource = fr-patient-123
* entry[=].request.method = #POST
* entry[=].request.url = "Patient"
* entry[+].fullUrl = "urn:uuid:practitioner-example"
* entry[=].resource = practitioner-example
* entry[=].request.method = #POST
* entry[=].request.url = "Practitioner"
* entry[+].fullUrl = "urn:uuid:org-example"
* entry[=].resource = org-example
* entry[=].request.method = #POST
* entry[=].request.url = "Organization"
* entry[+].fullUrl = "urn:uuid:6789"
* entry[=].resource = 6789
* entry[=].request.method = #POST
* entry[=].request.url = "Binary"
* entry[+].fullUrl = "urn:uuid:docref-example"
* entry[=].resource = docref-example
* entry[=].request.method = #POST
* entry[=].request.url = "DocumentReference"
* entry[+].fullUrl = "urn:uuid:submission-example"
* entry[=].resource = submission-example
* entry[=].request.method = #POST
* entry[=].request.url = "List"

Instance: fr-patient-123
InstanceOf: FRCorePatientProfile
Usage: #inline
* identifier.system = "urn:oid:1.2.250.1.213.1.4.8"
* identifier.value = "189079912345678"
* name.use = #official
* name.family = "DUPONT"
* name.given = "JEAN"
* gender = #male
* birthDate = "1989-07-09"

Instance: practitioner-example
InstanceOf: Practitioner
Usage: #inline
* meta.source = "https://annuaire.sante.fr"
* meta.profile[0] = "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner"
* meta.profile[+] = "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-dp-practitioner"
* language = #fr
* extension.url = "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-ext-smartcard"
* extension.extension[0].url = "type"
* extension.extension[=].valueCodeableConcept = $TRE-R87-TypeCarte#CPS
* extension.extension[+].url = "number"
* extension.extension[=].valueString = "3100345668"
* extension.extension[+].url = "period"
* extension.extension[=].valuePeriod.start = "2024-02-21"
* extension.extension[=].valuePeriod.end = "2027-02-21"
* identifier[0].use = #official
* identifier[=].type = $fr-core-cs-v2-0203#IDNPS
* identifier[=].system = "urn:oid:1.2.250.1.71.4.2.1"
* identifier[=].value = "810101201234"
* identifier[+].use = #official
* identifier[=].type = $fr-core-cs-v2-0203#RPPS
* identifier[=].system = "https://rpps.esante.gouv.fr"
* identifier[=].value = "10101201234"
* active = true

Instance: org-example
InstanceOf: Organization
Usage: #inline
* meta.profile[0] = "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization"
* meta.profile[+] = "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-dp-organization"
* language = #fr
* identifier[0].use = #official
* identifier[=].type = $fr-core-cs-v2-0203#IDNST
* identifier[=].system = "urn:oid:1.2.250.1.71.4.2.2"
* identifier[=].value = "2264403106"
* identifier[+].use = #official
* identifier[=].type = $fr-core-cs-v2-0203#SIREN
* identifier[=].system = "https://sirene.fr"
* identifier[=].value = "264403106"
* name = "CENTRE HOSPITALIER DEMO"

Instance: 6789
InstanceOf: Binary
Usage: #inline
* contentType = #application/pdf
* data = "SGVsbG8gV29ybGQ="

Instance: docref-example
InstanceOf: DocumentReference
Usage: #inline
* meta.profile = "https://interop.esante.gouv.fr/StructureDefinition/PDSm-DocumentReference"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:docref-example"
* status = #current
* type = urn:oid:1.2.250.1.213.1.1.4.12#11502-CR-BIO "Compte rendu de biologie"
* category = urn:oid:1.2.250.1.213.1.1.4.12#CR
* subject = Reference(urn:uuid:fr-patient-123)
* date = "2026-03-19T10:00:00+01:00"
* author = Reference(urn:uuid:practitioner-example)
* custodian = Reference(urn:uuid:org-example)
* securityLabel = $v3-Confidentiality#N
* content.attachment.contentType = #application/pdf
* content.attachment.language = #fr-FR
* content.attachment.title = "Compte rendu biologique"
* content.attachment.creation = "2026-03-19T09:45:00+01:00"
* content.attachment.url = "urn:uuid:6789"
* content.format = https://mos.esante.gouv.fr/NOS/TRE_A11-IheFormatCode/FHIR/TRE-A11-IheFormatCode#urn:ihe:iti:xds-sd:pdf:2008 "Document à corps non structuré en Pdf/A-1"
* context.practiceSetting = urn:oid:1.2.250.1.213.1.1.4.13#01 "Biologie médicale"
* context.facilityType = urn:oid:1.2.250.1.213.1.1.4.14#LABO "Laboratoire"

Instance: submission-example
InstanceOf: PDSm_SubmissionSetComprehensive
Usage: #inline
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:submission-example"
* status = #current
* mode = #working
* code = $MHDlistTypes#submissionset
* subject = Reference(urn:uuid:fr-patient-123)
* date = "2026-03-19T10:00:00+01:00"
* entry.item = Reference(urn:uuid:docref-example)