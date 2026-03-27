//====================================================================
// Bundle PDSm IT-65 : Remplacement CR bio corrigé
//====================================================================

Instance: PDSm-ex-comprehensiveProvideDocumentBundleReplace
InstanceOf: Bundle
Usage: #example
Title: "Bundle Remplacement CR bio conforme PDSm IT-65"
Description: "Exemple complet PDSm IT-65 avec JDV ANS, remplacement d'un document CR bio"
* meta.profile[0] = "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-provide-document-bundle"
* type = #transaction
* timestamp = "2026-03-27T12:00:00+01:00"

//====================================================================
// Patient
//====================================================================
Instance: Patient-patient1
InstanceOf: Patient
Usage: #example
* id = "patient-1"
* identifier[0].system = "http://#example.org/patients"
* identifier[0].value = "mrn-1234"
* name[0].family = "Schmidt"
* name[0].given[0] = "Dee"
* birthDate = "1923-07-25"
* gender = #other

//====================================================================
// Practitioner
//====================================================================
Instance: Practitioner-pract1
InstanceOf: Practitioner
Usage: #example
* id = "practitioner-1"
* identifier[0].system = "http://#example.org/practitioners"
* identifier[0].value = "prac-001"
* name[0].family = "Dupont"
* name[0].given[0] = "Alice"

//====================================================================
// Organization
//====================================================================
Instance: Organization-org1
InstanceOf: Organization
Usage: #example
* id = "organization-1"
* identifier[0].system = "http://#example.org/organizations"
* identifier[0].value = "org-001"
* name = "Laboratoire Central"

//====================================================================
// SubmissionSet PDSm
//====================================================================
Instance: List-submissionset1
InstanceOf: List
Usage: #example
* id = "submissionset-1"
* meta.profile[0] = "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-submissionset"
* status = #current
* mode = #working
* code.coding[0].system = "https://profiles.ihe.net/ITI/MHD/CodeSystem/MHDlistTypes"
* code.coding[0].code = #submissionset
* subject.reference = "Patient/patient-1"
* entry[0].item.reference = "DocumentReference/doc1"

//====================================================================
// Binary (PDF du document CR bio corrigé)
//====================================================================
Instance: Binary-binary1
InstanceOf: Binary
Usage: #example
* id = "binary-cr-bio"
* contentType = #application/pdf
* data = "SGVsbG8gV29ybGQ=" // base64 PDF

//====================================================================
// DocumentReference CR bio corrigé
//====================================================================
Instance: DocumentReference-doc1
InstanceOf: DocumentReference
Usage: #example
* id = "docref-cr-bio"
* meta.profile[0] = "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-documentreference"
* masterIdentifier.use = #usual
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.250.1.213.1.1.11502"
* status = #current
* type.coding[0].code = #11502-CR-BIO
* category[0].coding[0].code = #CR
* content[0].attachment.url = "urn:uuid:binary-cr-bio"
* content[0].attachment.contentType = #application/pdf
* content[0].attachment.size = 12345
* content[0].format.code = #application/pdf
* context.practiceSetting.coding[0].code = #01
* context.facilityType.coding[0].code = #LABO
* context.sourcePatientInfo.reference = "Patient/patient-1"

//====================================================================
// Parameters pour le remplacement (replace)
//====================================================================
Instance: Parameters-replace-doc1
InstanceOf: Parameters
Usage: #example
* id = "parameters-replace-cr-bio"
* parameter[0].name = "operation"
* parameter[0].part[0].name = "path"
* parameter[0].part[0].valueString = "DocumentReference.status"
* parameter[0].part[1].name = "type"
* parameter[0].part[1].valueCode = #replace
* parameter[0].part[2].name = "value"
* parameter[0].part[2].valueCode = #superseded