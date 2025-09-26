Instance: ExampleSubmissionSet
InstanceOf: PDSm_SubmissionSetComprehensive
Title: "Exemple de lot de soumission PDSm"
Description: "Exemple conforme au profil PDSm_SubmissionSetComprehensive."
Usage: #example

* status = #current
* mode = #working
* title = "Dossier de suivi post-opératoire"
* code = https://profiles.ihe.net/ITI/MHD/CodeSystem/MHDlistTypes#submissionset "Submission Set"
* date = "2025-04-30T14:00:00+01:00"

* subject = Reference(fr-patient-123)

* source = Reference(practitionerrole-example)
* source.extension[authorOrg].valueReference = Reference(org-example)

* identifier[uniqueId].value = "urn:uuid:11111111-aaaa-bbbb-cccc-222222222222"
* identifier[entryUUID].value = "urn:uuid:33333333-dddd-eeee-ffff-444444444444"

* extension[designationType].valueCodeableConcept = https://mos.esante.gouv.fr/NOS/TRE_R02-SecteurActivite/FHIR/TRE-R02-SecteurActivite#SA05 "Centre de santé"

* extension[ihe-sourceId].valueIdentifier.system = "urn:oid:1.2.250.1.213.1.1.1"
* extension[ihe-sourceId].valueIdentifier.value = "SRC-01"

* extension[isArchived].valueBoolean = false

* extension[PDSmintendedRecipient].valueReference = Reference(practitionerrole-example)

* note.text = "Suivi post-chirurgical – documents cliniques regroupés."

* entry[0].item = Reference(exemple-pdsm-documentreference)
// * entry[1].item = Reference(Folder/example) TODO

* contained[0] = practitionerrole-example
* contained[1] = org-example