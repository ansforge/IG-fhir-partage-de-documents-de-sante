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

// Référence logique : le matricule INS identifie le patient dans le système cible
* subject.type = "Patient"
* subject.identifier.type = https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203#INS-NIR-TEST
* subject.identifier.system = "urn:oid:1.2.250.1.213.1.4.10"
* subject.identifier.value = "185112906412322"

* date = "2025-04-30T09:30:00+01:00"

* custodian = Reference(org-example)

* author[0] = Reference(practitionerrole-example)
* authenticator = Reference(practitionerrole-example)

* description = "Compte rendu de passage aux urgences."

* securityLabel[confidentiality] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N "Normal"

* content.attachment.contentType = #application/pdf
* content.attachment.language = #fr-FR
* content.attachment.data = "SGVsbG8gV29ybGQ="
* content.attachment.title = "CR de passage aux urgences du 30 avril 2025"
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
Title: "Exemple de ressource Patient contenue (sourcePatientInfo) - identité INS de test, statut qualifié"
// Patient fictif issu des jeux d'essais INS (ANS, v20260213) : cas nominal 1 (BRANCHY Max Patrick)

* identifier[INS-NIR-TEST].type = https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203#INS-NIR-TEST
* identifier[INS-NIR-TEST].system = "urn:oid:1.2.250.1.213.1.4.10"
* identifier[INS-NIR-TEST].value = "185112906412322"

* extension[identityReliability].extension[identityStatus].url = "identityStatus"
* extension[identityReliability].extension[identityStatus].valueCoding = https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0445#VALI "Identité validée"

* extension[birthPlace].valueAddress.extension[inseeCode].url = "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-address-insee-code"
* extension[birthPlace].valueAddress.extension[inseeCode].valueCoding = https://mos.esante.gouv.fr/NOS/TRE_R13-CommuneOM/FHIR/TRE-R13-CommuneOM#29064 "Goulven"

* name[officialName].use = #official
* name[officialName].family = "BRANCHY"
* name[officialName].given = "MAX"
* name[officialName].extension[birth-list-given-name].valueString = "MAX PATRICK"

* gender = #male
* birthDate = "1985-11-01"
