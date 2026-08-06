Instance: PDSmSimplifiedExample
InstanceOf: pdsm-simplified-publish
Title: "Exemple de publication simplifiée PDSm"
Usage: #example

* meta.versionId = "1"
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:abcd-efgh-ijkl-mnop"

* status = #current

* type = http://loinc.org#15507-7 "CR de passage aux urgences" // SNOMED ou LOINC selon le code attendu
* category = https://mos.esante.gouv.fr/NOS/TRE_A03-ClasseDocument/FHIR/TRE-A03-ClasseDocument#10 "Compte rendu"

* subject = Reference(fr-patient-123)

* date = "2025-04-30T09:30:00+01:00"

* custodian = Reference(org-example)

* author[0] = Reference(practitionerrole-example)
* authenticator = Reference(practitionerrole-example)

* description = "Note d'évolution suite à une consultation de suivi."

* content.attachment.contentType = #application/pdf
* content.attachment.language = #fr-FR
* content.attachment.data = "SGVsbG8gV29ybGQ="
* content.attachment.title = "Note de suivi du 30 avril 2025"
* content.attachment.creation = "2025-04-29T17:00:00+01:00"
* content.attachment.size = 11
* content.attachment.hash = "Ck1VqNd45QIvq3AZd8XYQLvEhtA=" // SHA-1 de "Hello World"

* content.format = https://mos.esante.gouv.fr/NOS/TRE_A11-IheFormatCode/FHIR/TRE-A11-IheFormatCode#urn:ihe:iti:xds-sd:pdf:2008 "Document à corps non structuré en Pdf/A-1"

* context.facilityType = https://mos.esante.gouv.fr/NOS/TRE_R02-SecteurActivite/FHIR/TRE-R02-SecteurActivite#SA05 "Centre de santé"
* context.practiceSetting = https://mos.esante.gouv.fr/NOS/TRE_A01-CadreExercice/FHIR/TRE-A01-CadreExercice#ETABLISSEMENT "Etablissement de santé"

* contained[0] = sourcePatientInfo-example
* context.sourcePatientInfo = Reference(sourcePatientInfo-example)


Instance: sourcePatientInfo-example
InstanceOf: FRCorePatientINSProfile
Usage: #inline
Title: "Exemple de ressource Patient contenue (sourcePatientInfo) - identité qualifiée INS"

* identifier[INS-NIR-TEST].type = https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203#INS-NIR-TEST
* identifier[INS-NIR-TEST].system = "urn:oid:1.2.250.1.213.1.4.10"
* identifier[INS-NIR-TEST].value = "180126978912536"

* extension[identityReliability].extension[identityStatus].url = "identityStatus"
* extension[identityReliability].extension[identityStatus].valueCoding = https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0445#VALI "Identité validée"

* extension[birthPlace].valueAddress.extension[inseeCode].url = "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-address-insee-code"
* extension[birthPlace].valueAddress.extension[inseeCode].valueCoding = https://mos.esante.gouv.fr/NOS/TRE_R13-CommuneOM/FHIR/TRE-R13-CommuneOM#75056 "Paris"

* name[officialName].use = #official
* name[officialName].family = "Claire"
* name[officialName].given = "Martin"
* name[officialName].extension[birth-list-given-name].valueString = "Martin"

* gender = #male
* birthDate = "1980-01-15"
