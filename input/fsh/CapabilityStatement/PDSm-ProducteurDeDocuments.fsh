Instance: PDSm-ProducteurDeDocuments
InstanceOf: CapabilityStatement
Usage: #definition
* name = "PDSmProducteurDeDocuments"
* title = "CI-SIS Partage-De-Documents-De-Sante - ProducteurDeDocuments"
* status = #active
* experimental = false
* date = "2021-07-30T14:32:30+02:00"
* publisher = "ANS"
* description = "Il s’agit d’un système d’information ou d’un composant de système d’information qui envoie au gestionnaire de partage de documents une  demande d’ajout de nouveaux documents et/ou des nouvelles versions de documents. Ce système fournit également les modifications des  métadonnées du document."
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #xml
* format[+] = #json
* implementationGuide = "https://interop.esante.gouv.fr/ig/fhir/pdsm/ImplementationGuide/ans.fhir.fr.pdsm"
* rest.mode = #client
* rest.documentation = "Ajout d’un lot de documents, Demande de mise à jour des métadonnées de la fiche et Publication simplifiée d’un document"
* rest.security.cors = false
* rest.security.description = "L’ANS propose des référentiels dédiés à la politique de sécurité (la PGSSI-S ) et des mécanismes de sécurisation sont définis dans les volets de la couche Transport du Cadre d’Interopérabilité des systèmes d’information de santé (CI-SIS)"
* rest.resource.type = #DocumentReference
* rest.resource.profile = Canonical(PDSm_ComprehensiveDocumentReference)
* rest.resource.supportedProfile = Canonical(PDSm_SimplifiedPublish)
* rest.resource.interaction[0].code = #patch
* rest.resource.interaction[+].code = #create
* rest.resource.interaction[=].documentation = "Flux 09 - Publication simplifiée d’un document (IHE MHD Simplified Publish [ITI-105]) : POST d’une ressource DocumentReference conforme au profil PDSm_SimplifiedPublish."
* rest.resource.conditionalUpdate = true
* rest.interaction.code = #transaction
* rest.interaction.documentation = Canonical(PDSm_ComprehensiveProvideDocumentBundle)