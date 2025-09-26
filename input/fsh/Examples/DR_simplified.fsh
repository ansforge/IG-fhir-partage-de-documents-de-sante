Instance: PDSmSimplifiedExample
InstanceOf: pdsm-simplified-publish
Title: "Exemple de publication simplifiée PDSm"
Usage: #example

* meta.versionId = "1"
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:abcd-efgh-ijkl-mnop"

* status = #current

* type = http://loinc.org#15507-7 "Note d’évolution" // SNOMED ou LOINC selon le code attendu
* category = https://mos.esante.gouv.fr/NOS/TRE_A03-ClasseDocument/FHIR/TRE-A03-ClasseDocument#10 "Compte rendu"

* subject = Reference(fr-patient-123)

* date = "2025-04-30T09:30:00+01:00"

* author[0] = Reference(practitionerrole-example)
* authenticator = Reference(practitionerrole-example)

* description = "Note d'évolution suite à une consultation de suivi."

* content.attachment.contentType = #application/pdf
* content.attachment.language = #fr-FR
* content.attachment.data = "SGVsbG8gV29ybGQ="
* content.attachment.title = "Note de suivi du 30 avril 2025"
* content.attachment.creation = "2025-04-29T17:00:00+01:00"
* content.attachment.size = 250000
* content.attachment.hash = "2jmj7l5rSw0yVb/vlWAYkK/YBwk=" // SHA-1 exemple

* content.format = https://mos.esante.gouv.fr/NOS/TRE_A11-IheFormatCode/FHIR/TRE-A11-IheFormatCode#urn:ihe:iti:xds-sd:pdf:2008 "Document à corps non structuré en Pdf/A-1"

* context.facilityType = https://mos.esante.gouv.fr/NOS/TRE_R02-SecteurActivite/FHIR/TRE-R02-SecteurActivite#SA05 "Centre de santé"
* context.practiceSetting = https://mos.esante.gouv.fr/NOS/TRE_A01-CadreExercice/FHIR/TRE-A01-CadreExercice#ETABLISSEMENT "Etablissement de santé"
