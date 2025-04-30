Instance: exemple-pdsm-documentreference
InstanceOf: PDSm_ComprehensiveDocumentReference
Title: "Exemple de DocumentReference pour PDSm"
Description: "Exemple illustratif d’un DocumentReference conforme au profil PDSm_ComprehensiveDocumentReference."
Usage: #example
* meta.versionId = "1"

* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:12345678-abcd-1234-abcd-1234567890ab"

* contained = practitioner-example
* status = #current


* type = http://loinc.org#34133-9 "Résumé de sortie d’hospitalisation"
* category = https://mos.esante.gouv.fr/NOS/TRE_A03-ClasseDocument/FHIR/TRE-A03-ClasseDocument#10 "Compte-rendu"

* subject = Reference(fr-patient-123)

* date = "2025-04-29T12:00:00+01:00"

* author = Reference(practitionerrole-example)

* authenticator = Reference(org-example)

* description = "Compte rendu d’hospitalisation suite à une chirurgie."

* securityLabel = https://mos.esante.gouv.fr/NOS/TRE_A07-StatusVisibiliteDocument/FHIR/TRE-A07-StatusVisibiliteDocument#N "Normal"

* content[0].attachment.contentType = #application/pdf
* content[0].attachment.language = #fr-FR
* content[0].attachment.size = 345678
* content[0].attachment.hash = "2jmj7l5rSw0yVb/vlWAYkK/YBwk="
* content[0].attachment.title = "CR Hospitalisation"
* content[0].attachment.url = "Binary/6789"
* content[0].attachment.creation = "2025-04-25T09:30:00+01:00"
* content[0].format = https://mos.esante.gouv.fr/NOS/TRE_A11-IheFormatCode/FHIR/TRE-A11-IheFormatCode#urn:ihe:lab:xd-lab:2008	"Compte rendu structuré d'examens de biologie médicale"

* context.period.start = "2025-04-20T08:00:00+01:00"
* context.period.end = "2025-04-25T08:00:00+01:00"

* context.facilityType = https://mos.esante.gouv.fr/NOS/TRE_R02-SecteurActivite/FHIR/TRE-R02-SecteurActivite#SA01 "Etablissement public de santé"
* context.practiceSetting = https://mos.esante.gouv.fr/NOS/TRE_A01-CadreExercice/FHIR/TRE-A01-CadreExercice#ETABLISSEMENT "Etablissement de santé"

* context.sourcePatientInfo = Reference(fr-patient-123)
