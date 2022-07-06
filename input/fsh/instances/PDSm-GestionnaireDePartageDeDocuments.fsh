Instance: PDSm-GestionnaireDePartageDeDocuments
InstanceOf: CapabilityStatement
Usage: #definition
* url = "http://esante.gouv.fr/ci-sis/fhir/CapabilityStatements/PDSm.GestionnaireDePartageDeDocuments"
* version = "1.0"
* name = "PDSm_GestionnaireDePartageDeDocuments"
* title = "CI-SIS Partage-De-Documents-De-Sante - GestionnaireDePartageDeDocuments"
* status = #active
* experimental = false
* date = "2021-07-30T14:32:30+02:00"
* publisher = "ANS"
* description = "Il s’agit d’un système d’information ou d’un composant d'un système d’information qui stocke, classe et archive les documents d’un dossier patient."
* kind = #requirements
* fhirVersion = #4.0.0
* format[0] = #xml
* format[+] = #json
* implementationGuide = "http://esante.gouv.fr/ci-sis/fhir/ImplementationGuides/CI-SIS.PartageDeDocumentsDeSante"
* rest.mode = #server
* rest.documentation = "Il s’agit d’un système d’information ou d’un composant d'un système d’information qui stocke, classe et archive les documents d’un dossier patient."
* rest.security.cors = false
* rest.security.description = "L’ANS propose des référentiels dédiés à la politique de sécurité (la PGSSI-S ) et des mécanismes de sécurisation sont définis dans les volets de la couche Transport du Cadre d’Interopérabilité des systèmes d’information de santé (CI-SIS)"
* rest.resource[0].type = #List
* rest.resource[=].profile = "http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/PDSm_SubmissionSetComprehensive"
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].searchParam[0].name = "date"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "Représente la date et heure de soumission."
* rest.resource[=].searchParam[+].name = "DesignationType"
* rest.resource[=].searchParam[=].definition = "http://profiles.ihe.net/ITI/MHD/SearchParameter/List-DesignationType"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Représente le type d’activité associé à l’événement clinique ayant abouti à la constitution du lot de soumission."
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/List-clinical-identifier"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Représente l'identifiant."
* rest.resource[=].searchParam[+].name = "status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/List-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Représente le statut du lot de soumission."
* rest.resource[=].searchParam[+].name = "PDSm_isArchived"
* rest.resource[=].searchParam[=].definition = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_isArchived"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "permet distinguer les lots de soumission et les fiches archivés des actifs."
* rest.resource[=].searchParam[+].name = "title"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/List-title"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "Représente le titre du lot de soumission."
* rest.resource[=].searchParam[+].name = "SourceId"
* rest.resource[=].searchParam[=].definition = "http://profiles.ihe.net/ITI/MHD/SearchParameter/List-SourceId"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Représente l’identifiant unique global du système émetteur du lot de soumission."
* rest.resource[=].searchParam[+].name = "source"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/List-source"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Représente l’auteur du lot de soumission, quand l'auteur est de type patient, practitionerrole ou device."
* rest.resource[=].searchParam[+].name = "PDSm_authorOrg"
* rest.resource[=].searchParam[=].definition = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_authorOrg"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Représente l’auteur du lot de soumission, quand l'auteur est de type organization."
* rest.resource[=].searchParam[+].name = "code"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Représente le but du lot de soumission."
* rest.resource[=].searchParam[+].name = "PDSm_List_PatientAsSource"
* rest.resource[=].searchParam[=].definition = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_List_PatientAsSource"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Recherche sur les éléments source:Patient.given et source:Patient.family."
* rest.resource[=].searchParam[+].name = "PDSm_List_PatientAsSubject"
* rest.resource[=].searchParam[=].definition = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_List_PatientAsSubject"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Recherche sur l'élément subject:Patient.identifier."
* rest.resource[=].searchParam[+].name = "PDSm_List_PractitionerRoleAsSource"
* rest.resource[=].searchParam[=].definition = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_List_PractitionerRoleAsSource"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Recherche sur les éléments source:PractitionerRole.practitioner:Practitioner.given et source:PractitionerRole.practitioner:Practitioner.family."
* rest.resource[+].type = #DocumentReference
* rest.resource[=].profile = "http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/PDSm_ComprehensiveDocumentReference"
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[+].code = #patch
* rest.resource[=].conditionalUpdate = true
* rest.resource[=].searchParam[0].name = "type"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-type"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Représente le type du document."
* rest.resource[=].searchParam[+].name = "setting"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-setting"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Représente le cadre d’exercice de l’acte qui a engendré la création du document"
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-identifier"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Représente l'identifiant unique d'une fiche d'un document."
* rest.resource[=].searchParam[+].name = "creation"
* rest.resource[=].searchParam[=].definition = "http://profiles.ihe.net/ITI/MHD/SearchParameter/DocumentReference-Creation"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "Représente la date et l'heure de la création du document."
* rest.resource[=].searchParam[+].name = "security-label"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-security-label"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Contient les informations définissant le niveau de confidentialité d'un document."
* rest.resource[=].searchParam[+].name = "status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Représente le statut de la fiche d'un document."
* rest.resource[=].searchParam[+].name = "PDSm_isArchived"
* rest.resource[=].searchParam[=].definition = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_isArchived"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "permet distinguer les lots de soumission et les fiches archivés des actifs."
* rest.resource[=].searchParam[+].name = "PDSm_DocumentReference_period-start"
* rest.resource[=].searchParam[=].definition = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_DocumentReference_period-start"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "Représente la date de début de l’acte de référence."
* rest.resource[=].searchParam[+].name = "PDSm_DocumentReference_period-end"
* rest.resource[=].searchParam[=].definition = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_DocumentReference_period-end"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "Représente la date de fin de l’acte de référence."
* rest.resource[=].searchParam[+].name = "format"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-format"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Format technique détaillé du document."
* rest.resource[=].searchParam[+].name = "category"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-category"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Représente la classe du document (compte rendu, imagerie médicale, traitement, certificat, ....)."
* rest.resource[=].searchParam[+].name = "relatesto"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-relatesto"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Représente l'identifiant d'une association entre deux fiches."
* rest.resource[=].searchParam[+].name = "event"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-event"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Actes et pathologies en rapport avec le document."
* rest.resource[=].searchParam[+].name = "period"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-period"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "Représente la période."
* rest.resource[=].searchParam[+].name = "PDSm_DocumentReference_PatientAsSubject"
* rest.resource[=].searchParam[=].definition = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_DocumentReference_PatientAsSubject"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Représente l'identifiant du patient qui est le sujet du document."
* rest.resource[=].searchParam[+].name = "PDSm_DocumentReference_DeviceAsAuthor"
* rest.resource[=].searchParam[=].definition = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_DocumentReference_DeviceAsAuthor"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Représente l'identifiant du dispositif médical qui est l'auteur du document."
* rest.resource[=].searchParam[+].name = "PDSm_DocumentReference_PatientAsAuthor"
* rest.resource[=].searchParam[=].definition = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_DocumentReference_PatientAsAuthor"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Représente l'identifiant, le nom, le prénom du patient qui est l'auteur du document."
* rest.resource[=].searchParam[+].name = "PDSm_DocumentReference_PractitionerRoleAsAuthor"
* rest.resource[=].searchParam[=].definition = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_DocumentReference_PractitionerRoleAsAuthor"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Représente l'identifiant, le nom, le prénom du praticien dans sa situation d'exercice qui est l'auteur du document."
* rest.resource[+].type = #Binary
* rest.resource[=].profile = "http://hl7.org/fhir/StructureDefinition/Binary"
* rest.resource[=].interaction.code = #read
* rest.interaction.code = #transaction
* rest.interaction.documentation = "http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/PDSm_ComprehensiveProvideDocumentBundle"