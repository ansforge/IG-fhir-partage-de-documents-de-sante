Profile: PDSm_FolderComprehensive
Parent: IHE.MHD.Comprehensive.Folder
Id: PDSmFolderComprehensive
Title: "PDSm_FolderComprehensive"
Description: "Profil spécifique dérivé du profil IHE MHD v4.0.1 « Comprehensive Folder  » créé pour le volet ANS \"Partage de documents de santé en mobilité\" ; ce profil concerne le classeur."
* ^date = "2021-07-30"
* ^publisher = "ANS"

* contained 1..
//* contained only FrPatient
* contained only Patient




* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension[designationType] 1..1
* extension[designationType] ^comment = "Le jeu de valeurs est à définir par le système cible.\r\n\r\nThere can be no stigma associated with the use of extensions by any application, project, or standard - regardless of the institution or jurisdiction that uses or defines the extensions.  The use of extensions is what allows the FHIR specification to retain a core level of simplicity for everyone."


* extension[designationType] ^short = "Représente les codes spécifiant le type d’activité de l’événement clinique ayant abouti au regroupement de la fiche d’un document dans ce classeur."


* identifier[uniqueId] MS
* identifier[uniqueId] ^short = "Identifiant unique du classeur attribué par le système initiateur."
* identifier[entryUUID] MS
* identifier[entryUUID] ^short = "Identifiant attribué par le système cible."

* status MS
* status ^short = "Représente la pertinence de la version d’un classeur."

* mode ^short = "Mode de traitement qui s’applique au classeur."

* title ^short = "Représente le titre du classeur."

* code ^short = "Désigne le cas d’utilisation de la ressource List. Il s’agit ici du classeur."

//* subject only Reference(FrPatient) TODO
* subject MS
* subject ^type.aggregation = #contained

* date MS
* date 1..
* date ^short = "Représente la date de création du classeur. Cet élément est aussi mis en correspondance avec la date de mise à jour du classeur dans MHD."

* note ^short = "Représente les commentaires d’un classeur."

* entry 1..
* entry ^short = "Liste des fiches composant le classeur."
* entry.item only Reference(PDSm_ComprehensiveDocumentReference)
* entry.item ^short = "Représente la référence à la fiche d'un document faisant partie du classeur."