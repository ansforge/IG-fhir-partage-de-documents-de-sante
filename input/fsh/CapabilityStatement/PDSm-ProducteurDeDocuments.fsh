Instance: PDSm-ProducteurDeDocuments
InstanceOf: CapabilityStatement
Usage: #definition
* url = "http://esante.gouv.fr/ci-sis/fhir/CapabilityStatements/PDSm.ProducteurDeDocuments"
* version = "1.0"
* name = "PDSm-ProducteurDeDocuments"
* title = "CI-SIS Partage-De-Documents-De-Sante - ProducteurDeDocuments"
* status = #active
* experimental = false
* date = "2021-07-30T14:32:30+02:00"
* publisher = "ANS"
* description = "Il s’agit d’un système d’information ou d’un composant de système d’information qui envoie au gestionnaire de partage de documents une  demande d’ajout de nouveaux documents et/ou des nouvelles versions de documents. Ce système fournit également les modifications des  métadonnées du document."
* kind = #requirements
* fhirVersion = #4.0.0
* format[0] = #xml
* format[+] = #json
* implementationGuide = "http://esante.gouv.fr/ci-sis/fhir/ImplementationGuides/CI-SIS.PartageDeDocumentsDeSante"
* rest.mode = #client
* rest.documentation = "Ajout d’un lot de documents et Demande de mise à jour des métadonnées de la fiche"
* rest.security.cors = false
* rest.security.description = "L’ANS propose des référentiels dédiés à la politique de sécurité (la PGSSI-S ) et des mécanismes de sécurisation sont définis dans les volets de la couche Transport du Cadre d’Interopérabilité des systèmes d’information de santé (CI-SIS)"
* rest.resource.type = #DocumentReference
* rest.resource.profile = "http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/PDSm_ComprehensiveDocumentReference"
* rest.resource.interaction.code = #patch
* rest.resource.conditionalUpdate = true
* rest.interaction.code = #transaction
* rest.interaction.documentation = "http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/PDSm_ComprehensiveProvideDocumentBundle"