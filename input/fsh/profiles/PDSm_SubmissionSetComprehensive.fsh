Profile: PDSm_SubmissionSetComprehensive
Parent: IHE.MHD.Comprehensive.SubmissionSet
Id: pdsm-submissionset-comprehensive
Title: "PDSm SubmissionSet Comprehensive"
Description: "Profil spécifique dérivé du profil IHE MHD « ComprehensiveSubmissionSet » créé pour le volet ANS \"Partage de documents de santé en mobilité\" ; ce profil concerne le lot de soumission."

* contained MS
* contained 1.. 
* contained ^short = "Ressource contenue. Dans le cadre de ce profil, il est obligatoire qu'il y ait au moins une ressource contenue : source ou source.extension[authorOrg]"

* extension 2..
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open

// Extension designationType defined in MHD : https://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-designationType
* extension[designationType].value[x] from $JDV-J03-XdsContentTypeCode-CISIS (preferred)
* extension[designationType] obeys constr-bind-designationtype
* extension[designationType] ^short = "Représente le type d’activité associé à l’événement clinique ayant abouti à la constitution du lot de soumission."

* extension[ihe-sourceId] ^short = "Représente l’identifiant unique global du système émetteur du lot de soumission."


* extension contains
    PDSm_IsArchived named isArchived 0..1

// Extension intendedRecipient defined in MHD : https://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-intendedRecipient
* extension[intendedRecipient] MS
* extension[intendedRecipient].value[x] ^type.aggregation = #contained
* extension[intendedRecipient] ^short = "Représente le destinataire du lot de soumission. Il peut s'agir d'un AsPractitioner associé à un AsPractitionerRole ou bien d'une AsOrganization."

* subject only Reference(FrPatient)

* extension[isArchived] ^short = "Extension définie par ce volet pour distinguer les lots de soumission archivés des actives."

* identifier[uniqueId] MS
* identifier[uniqueId] ^short = "IdUnique : Identifiant unique global affecté à ce lot de soumission par son créateur. Cet attribut est utilisé à des fins de références externes alors que idLotSoumission est destiné à des fins de gestion interne."

* identifier[entryUUID] MS
* identifier[entryUUID] ^short = "idLotSoumission : Identifiant unique du lot de soumission. Cet attribut est destiné à des fins de gestion interne alors que idUnique est utilisé à des fins de références externes."

* status MS
* status ^short = "Représente le statut du lot de soumission."

* mode MS
* mode ^short = "Mode de traitement qui s’applique au lot de soumission"

* title MS
* title ^short = "Représente le titre du lot de soumission."

* code MS
* code ^short = "Désigne le cas d’utilisation de la ressource List. Il s’agit ici du lot de soumission."

* subject MS
* subject ^short = "Référence vers la ressource Patient titulaire du dossier."

* date MS
* date ^short = "Représente la date et heure de soumission."

* source 1.. // Source est contained dans le profil MHD
* source only Reference(AsPractitionerRoleProfile or Device or FrPatient) 
* source ^short = "Représente l'auteur du lot de soumission. Si l'auteur est une organisation, utiliser l'extension authorOrg. Si l’auteur est une personne physique ou un dispositif, utiliser l’attribut source.reference ." 

// Extension from MHD https://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-authorOrg

* source.extension[authorOrg] ^short = "Auteur organisationnel du document"
* source.extension[authorOrg].value[x] only Reference(AsOrganizationProfile)
* source.extension[authorOrg].value[x] ^type.aggregation = #contained


* note ^short = "Représente les commentaires associés au lot de soumission."

* entry.item only Reference(PDSm_ComprehensiveDocumentReference or PDSm_FolderComprehensive)
* entry.item ^short = "Représente la référence à la fiche d’un document faisant partie du classeur."


Extension: PDSm_intendedRecipient
Id: PDSmintendedrecipient
Description: "Représente le destinataire du lot de soumission"
* ^context.type = #element
* ^context.expression = "List"
* . ^short = "Représente le destinataire du lot de soumission"
* value[x] only Reference(AsPractitionerRoleProfile or AsOrganizationProfile)


Invariant: constr-bind-designationtype
Description: "Les valeurs possibles doivent provenir d’une des terminologies de référence suivantes : 
- TRE_A00-ProducteurDocNonPS, OID : 1.2.250.1.213.1.1.4.6 
- TRE_R209-TypeActivite, OID : 1.2.250.1.213.2.2 
- TRE_R02-SecteurActivite, OID : 1.2.250.1.71.4.2.4 Les valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J59-ContentTypeCode-DMP). 
En l’absence de spécifications complémentaires, le jeu de valeurs JDV_J03-XdsContentTypeCode-CISIS peut être utilisé."
Expression:       "f:extension[designationType]"
Severity:    #error



Mapping:  ConceptMetierToPDSm_SubmissionSetComprehensive
Source:   PDSm_SubmissionSetComprehensive
Id:       specmetier-to-PDSmSubmissionSetComprehensive
Title:    "Spécification métier vers le profil PDSm_SubmissionSetComprehensive"
* -> "LotDeSoumission"
* source.extension[ihe-authorOrg] -> "auteur : [1..1] Identifiant"
* extension[isArchived] -> "statut : [1..1] Code"
* status -> "statut : [1..1] Code"
* extension[ihe-designationType] -> "typeActivite : [1..1] Code"
* identifier[uniqueId] -> "idUnique : [0..1] Identifiant"
* subject -> "idPatient : [0..1] Identifiant"
* date -> "dateSoumission : [1..1] DateHeure"
* note -> "commentaire : [0..1] Texte"
* identifier[entryUUID] -> "idLotSoumission : [0..*] Identifiant"
* extension[ihe-sourceId] -> "idSource : [0..1] Identifiant"
* title -> "titre : [0..1] Texte"
* entry.item -> "Fiche : [0..*]"
* entry.item -> "Classeur : [0..*]"