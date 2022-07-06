Profile: PDSm_SubmissionSetComprehensive
Parent: IHE.MHD.Comprehensive.SubmissionSet
Id: PDSmSubmissionSetComprehensive
Title: "PDSm_SubmissionSetComprehensive"
Description: "Profil spécifique dérivé du profil IHE MHD v4.0.1 « ComprehensiveSubmissionSet  » créé pour le volet ANS \"Partage de documents de santé en mobilité\" ; ce profil concerne le lot de soumission."
* ^date = "2021-07-30"
* ^publisher = "ANS"

* contained MS
* contained 1..
* contained only $practitioner-rass or $organization-rass or Patient or $practitionerRole-organizationalRole-rass or Device or $practitionerRole-professionalRole-rass //FrPatient

* extension 2..
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension[designationType] ^sliceName = "designationType"
* extension[designationType].value[x] from $JDV-J03-XdsContentTypeCode-CISIS (preferred)
* extension[designationType].value[x] ^definition = "Les valeurs possibles doivent provenir d’une des terminologies de référence suivantes :\r\n- TRE_A00-ProducteurDocNonPS, OID : 1.2.250.1.213.1.1.4.6\r\n- TRE_R209-TypeActivite, OID : 1.2.250.1.213.2.2\r\n- TRE_R02-SecteurActivite, OID : 1.2.250.1.71.4.2.4\r\nLes valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J59-ContentTypeCode-DMP)\r\nEn l’absence de spécifications complémentaires, le jeu de valeurs JDV_J03-XdsContentTypeCode-CISIS peut être utilisé."
* extension[designationType].value[x] ^binding.description = "XDS contentTypeCode CI-SIS"
* extension[designationType] ^short = "Représente le type d’activité associé à l’événement clinique ayant abouti à la constitution du lot de soumission."

* extension[ihe-sourceId] ^short = "Représente l’identifiant unique global du système émetteur du lot de soumission."

* extension[intendedRecipient] 0..0
//* extension[intendedRecipient].value[x] only Reference($organization-rass or $practitioner-rass)
//* extension[intendedRecipient].value[x] ^type.aggregation = #contained
//* extension[PDSm_intendedRecipient] only PDSm_intendedRecipient

* extension contains
    PDSm_IsArchived named isArchived 0..1 and
    PDSm_intendedRecipient named PDSm_intendedRecipient 0..*



* extension[PDSm_intendedRecipient] MS
* extension[PDSm_intendedRecipient] ^sliceName = "PDSm_intendedRecipient"
* extension[PDSm_intendedRecipient].value[x] only Reference
* extension[PDSm_intendedRecipient].value[x] ^type.aggregation = #contained
* extension[PDSm_intendedRecipient] ^short = "Représente le destinataire du lot de soumission"
* extension[PDSm_intendedRecipient] ^definition = "Les ressources référencées sont : - PractitionerRole : Dans le cas d’un destinaire professionnel, c’est le profil PractitionerRoleOrgani zationalRoleRASS représentant la situation d’exercice qui doit être référencé. Lui-même fera le lien avec le profil PractitionerRoleProfes sionalRoleRASS représentant l’exercice professionnel et avec FrPractitioner. \n- Organization contrainte au profil FrOrganization"
//* subject only Reference(FrPatient)

* extension[isArchived] ^short = "Extension définie par ce volet pour distinguer les lots de soumission archivés des actives. "

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
* subject ^type.aggregation = #contained
* subject ^short = "Référence vers la ressource Patient contained titulaire du dossier. "

* date MS
* date ^short = "Représente la date et heure de soumission."

* source 1..
* source only Reference($practitionerRole-organizationalRole-rass or Device or Patient) //FrPatient
* source ^definition = "Un lot de soumission est obligatoirement associé à un auteur. Si l’attribut “ihe-authorOrg” n’est pas renseigné, autrement dit si l’auteur est une personne physique ou un dispositif, la cardinalité est contrainte à [1..1]."
* source ^short = "Représente les personnes physiques ou morales et/ou les dispositifs auteurs d’un lot de soumission."

* source.extension ^slicing.discriminator.type = #value
* source.extension ^slicing.discriminator.path = "url"
* source.extension ^slicing.rules = #open
* source.extension[authorOrg] ^sliceName = "authorOrg"
* source.extension[authorOrg] ^definition = "Un lot de soumission est obligatoirement associé à un auteur. Si l’attribut “source” n’est pas renseigné, autrement dit si l’auteur est une personne morale, la cardinalité est contrainte à [1..1]."
* source.extension[authorOrg] ^short = "Organisation auteur du document"
* source.extension[authorOrg].value[x] only Reference($organization-rass)
* source.extension[authorOrg].value[x] ^type.aggregation = #contained

* note ^short = "Représente les commentaires associés au lot de soumission."

* entry.item only Reference(PDSm_ComprehensiveDocumentReference or PDSm_FolderComprehensive)
* entry.item ^short = "Représente la référence à la fiche d’un document faisant partie du classeur."


Extension: PDSm_intendedRecipient
Id: PDSmintendedrecipient
Description: "Représente le destinataire du lot de soumission"
* ^url = "http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/PDSm_ihe-intended_recipient"
* ^version = "1.0"
* ^date = "2021-07-30"
* ^publisher = "ANS"
* ^context.type = #element
* ^context.expression = "List"
* . ^short = "Représente le destinataire du lot de soumission"
* url = "http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/PDSm_ihe-intended_recipient" (exactly)
* value[x] only Reference($practitionerRole-organizationalRole-rass or $organization-rass)