Profile: PDSm_SubmissionSetComprehensive
Parent: IHE.MHD.Comprehensive.SubmissionSet
Id: pdsm-submissionset-comprehensive
Title: "PDSm SubmissionSet Comprehensive"
Description: "Profil spécifique dérivé du profil IHE MHD v4.0.1 « ComprehensiveSubmissionSet  » créé pour le volet ANS \"Partage de documents de santé en mobilité\" ; ce profil concerne le lot de soumission."

* contained MS
* contained 1..

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

* source 1..
* source only Reference(AsPractitionerRoleProfile or Device or FrPatient) 
* source obeys constr-bind-source
* source ^short = "Représente les personnes physiques ou morales et/ou les dispositifs auteurs d’un lot de soumission."

* source.extension ^slicing.discriminator.type = #value
* source.extension ^slicing.discriminator.path = "url"
* source.extension ^slicing.rules = #open

* source.extension[authorOrg] ^short = "Un lot de soumission est obligatoirement associé à un auteur. Si l’attribut “source” n’est pas renseigné, autrement dit si l’auteur est une personne morale, la cardinalité est contrainte à [1..1]."
* source.extension[authorOrg].value[x] only Reference(AsOrganizationProfile)
* source.extension[authorOrg].value[x] ^type.aggregation = #contained
* source.extension[authorOrg] obeys constr-bind-authororg




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

Invariant: constr-bind-source
Description: "Un lot de soumission est obligatoirement associé à un auteur. Si l’attribut \"ihe-authorOrg\" n’est pas renseigné, autrement dit si l’auteur est une personne physique ou un dispositif."
Expression:       "f:source"
Severity:    #error


Invariant: constr-bind-authororg
Description: "Un lot de soumission est obligatoirement associé à un auteur. Si l’attribut \"source\" n’est pas renseigné, autrement dit si l’auteur est une personne morale, la cardinalité est contrainte à [1..1].
La ressource référencée doit être présente sous l’élément List.contained."
Expression:       "f:source/f:extension[authorOrg]"
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