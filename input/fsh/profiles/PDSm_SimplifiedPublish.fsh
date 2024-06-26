Profile: PDSm_SimplifiedPublish
Parent: IHE.MHD.SimplifiedPublish.DocumentReference
Id: pdsm-simplified-publish
Title: "PDSm Simplified Publish Document Reference"
Description:    """Profil utilisé dans le cadre du flux 9 d'ajout simplifié de document. Le flux et le profil sont inspirés d’IHE MHD, transaction ITI-105.

Contrairement au profil PDSm_ComprehensiveDocumentReference, le document est directement inclus dans DocumentReference.attachment.data et non dans une ressource « Binary » externe.

La publication simplifiée est une simple requête HTTP POST d'une ressource DocumentReference conforme à ce profil.
"""

* meta.versionId MS
* meta.versionId ^short = "Numéro de version de la fiche d’un document attribué par le système cible. La valeur de la métadonnée version est égale à 1 pour la première version de la fiche. Cet élément est requis lorsque le flux envoyé correspond à une mise à jour des données d’une fiche."

* masterIdentifier MS
* masterIdentifier ^short = "Représente l’identifiant unique global affecté au document par son créateur. Il est utilisable comme référence externe dans d’autres documents."

* identifier MS

* status MS
* status 1..1
* status = http://hl7.org/fhir/document-reference-status#current

* type MS
* type from $JDV-J07-XdsTypeCode-CISIS (preferred)
* type ^definition = "Représente le type du document."
* type obeys constr-bind-type

* category MS
* category from $JDV-J06-XdsClassCode-CISIS (preferred)
* category ^short = "Représente la classe du document (compte rendu, imagerie médicale, traitement, certificat,...)."
* category obeys constr-bind-category

* subject 1..1
* subject ^short = "Patient concerné par ce document. La ressource référencée peut être présente sous l’élément DocumentReference.contained ou via le champ identifier."
* subject only Reference(FRCorePatientProfile) 

* date MS
* date ^short = "Représente la date de création de la ressource DocumentReference dans FHIR"

* author MS
* author ^short = "Personnes physiques ou morales et/ou les dispositifs auteurs d'un document."
* author 1..
* author only Reference(AsPractitionerRoleProfile or AsPractitionerProfile or AsOrganizationProfile or Device or FRCorePatientProfile or FRCoreRelatedPersonProfile) 


* authenticator MS
* authenticator 0..1
* authenticator ^short = "Cet attribut représente l’acteur validant le document et prenant la responsabilité du contenu médical de celui-ci. Il peut s’agir de l’auteur du document si celui-ci est une personne et s’il endosse la responsabilité du contenu médical de ses documents. Si l’auteur est un dispositif, cet attribut doit représenter la personne responsable de l’action effectuée par le dispositif."
* authenticator only Reference(AsPractitionerRoleProfile or AsOrganizationProfile)

* description MS
* description ^short = "Commentaire associé au document."

* securityLabel obeys constr-bind-securityLabel
* securityLabel ^short = "Contient les informations définissant le niveau de confidentialité d'un document."

// ###########
// # CONTENT #
// ###########
* content MS
* content ^short = "Document contenu."

* content.attachment.contentType 1..1

* content.attachment.language 0..1 MS
* content.attachment.language ^short = "Pour tous les documents produits par les systèmes initiateurs français, le code est \"fr-FR'."


* content.attachment.data 1..1
* content.attachment.data ^short = "Le document est contenu dans l'élément .data au format base64."
* content.attachment.url 0..0

* content.attachment.size ^short = "Représente la taille du document."

* content.attachment.hash ^short = "Représente le résultat de hachage du document (SHA 1)."
* content.attachment.title 1..

* content.attachment.creation 0..1 MS
* content.attachment.creation ^short = "Représente la date et l’heure de création du document."

* content.format 0..1 MS
* content.format from $JDV-J10-XdsFormatCode-CISIS (preferred)
* content.format obeys constr-bind-format
* content.format ^short = "Format technique détaillé du document."

// ###########
// # CONTEXT #
// ###########
* context MS
* context.event ..1
* context.event obeys constr-bind-context-event
* context.event ^short = "Représente les actes et les pathologies en rapport avec le document."

* context.period 0..1 MS

* context.facilityType MS
* context.facilityType from $JDV-J02-XdsHealthcareFacilityTypeCode-CISIS (preferred)
* context.facilityType obeys constr-bind-ProducteurDoc-simplified
* context.facilityType ^short = "Secteur d'activité lié à la prise en charge de la personne, en lien avec le document produit."

* context.practiceSetting 0..1 MS
* context.practiceSetting from $JDV-J04-XdsPracticeSettingCode-CISIS (preferred)
* context.practiceSetting obeys constr-bind-ProducteurDoc-simplified
* context.practiceSetting ^short = "Cadre d’exercice de l’acte qui a engendré la création du document."

* context.sourcePatientInfo only Reference(FRCorePatientProfile)
* context.sourcePatientInfo ^short = "Référence vers la ressource Patient titulaire du dossier."


Invariant: constr-bind-ProducteurDoc-simplified
Description: "L’utilisation de cette nomenclature est recommandée mais non obligatoire (prefered) :
-	TRE_R02-SecteurActivite, OID : 1.2.250.1.71.4.2.4 (lorsque l’auteur du document est un professionnel ou un équipement sous sa responsabilité)
Les valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J61-HealthcareFacilityTypeCode-DMP).
En l’absence de spécifications complémentaires, le jeu de valeurs JDV_J02-XdsHealthcareFacilityTypeCode-CISIS peut être utilisé."
// Expression:       "f:context/f:practiceSetting or f:context/f:facilityType"
Severity:    #error