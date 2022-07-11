Profile: PDSm_ComprehensiveDocumentReference
Parent: IHE.MHD.Comprehensive.DocumentReference
Id: PDSmComprehensiveDocumentReference
Title: "PDSm_ComprehensiveDocumentReference"
Description: "Profil spécifique dérivé du profil IHE MHD v4.0.1 \"ComprehensiveDocumentReference\" créé pour le volet \"Partage de documents de santé en mobilité\"."
* ^meta.lastUpdated = "2021-10-21T13:35:33.281+00:00"
* ^date = "2021-07-30"

* meta.versionId MS
* meta.versionId ^short = "Numéro de version de la fiche d’un document attribués par le système cible. La valeur de la métadonnée version est égale à 1 pour la première version de la fiche."
* meta.versionId obeys constr-cdr-maj

* masterIdentifier MS
* masterIdentifier ^short = "Représente l’identifiant unique global affecté au document par son créateur. Il est utilisable comme référence externe dans d’autres documents."

* contained MS
* contained 1..
* contained only Patient or Device or $practitionerRole-organizationalRole-rass or $organization-rass or $practitionerRole-professionalRole-rass or $practitioner-rass //FrPatient

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension contains PDSm_IsArchived named isArchived 0..1
* extension[isArchived] MS
* extension[isArchived] ^short = "Extension définie par ce volet pour distinguer les fiches archivées des actives."

* identifier MS

* status MS

* type MS
* type from $JDV-J07-XdsTypeCode-CISIS (preferred)
* type ^definition = "Représente le type du document."
* type ^definition = "Les valeurs possibles pour cet élément doivent provenir d’une des terminologies de référence suivantes :\r\n- TRE_A05-TypeDocComplementaireCISIS, OID : 1.2.250.1.213.1.1.4.12\r\n- TRE_A04-TypeDocument-LOINC, OID : 2.16.840.1.113883.6.1\r\n- TRE_A12-NomenclatureASTM, OID : ASTM\r\nLes valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J66-TypeCode-DMP).\r\nEn l’absence de spécifications complémentaires, le jeu de valeurs JDV_J07-XdsTypeCode-CISIS peut être utilisé."
* type ^binding.description = "XDS typeCode CI-SIS"

* category MS
* category from $JDV-J06-XdsClassCode-CISIS (preferred)
* category ^short = "Représente la classe du document (compte rendu, imagerie médicale, traitement, certificat,...)."
* category ^definition = "Les valeurs possibles pour cet élément doivent provenir d’une des terminologies de référence suivantes :\r\n- TRE_A03-ClasseDocument-CISIS, OID : 1.2.250.1.213.1.1.4.1\r\n- TRE_A10-NomenclatureURN, OID : URN\r\nLes valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J57-ClassCode-DMP).\r\nEn l’absence de spécifications complémentaires, le jeu de valeurs JDV_J06-XdsClassCode-CISIS peut être utilisé."
* category ^binding.description = "XDS classCode CI-SIS"

* subject only Reference(Patient) //TODO : FrPatient
* subject MS
* subject ^short = "Représente l'identifiant du patient."
* subject ^definition = "La ressource référencée doit être présente sous l’élément DocumentReference.contained. Référence contrainte au profil FrPatient? Cette même ressource est référencée depuis context.sourcePatientInfo"
* subject ^type.aggregation = #contained

* date MS
* date ^short = "Représente la date de création de la ressource DocumentReference dans FHIR"

* author MS
* author ^short = "Personnes physiques ou morales et/ou les dispositifs auteurs d'un document."
* author 1..
* author only Reference($practitionerRole-organizationalRole-rass or Device or Patient) //TODO FrPatient
* author ^type.aggregation = #contained

* authenticator MS
* authenticator 1..
* authenticator ^short = "Cet attribut représente l’acteur validant le document et prenant la responsabilité du contenu médical de celui-ci. Il peut s’agir de l’auteur du document si celui-ci est une personne et s’il endosse la responsabilité du contenu médical de ses documents. Si l’auteur est un dispositif, cet attribut doit représenter la personne responsable de l’action effectuée par le dispositif. Pour les documents d’expression personnelle du patient, cet attribut fait référence au patient." // --> comment peut-il faire référence au patient ? Pas possible selon la doc
* authenticator only Reference($practitionerRole-organizationalRole-rass or $organization-rass)

* relatesTo MS
* relatesTo ^definition = "Cardinalité contrainte à [1..1] lorsque le flux envoyé correspond au remplacement d’un document."
* relatesTo ^short = "Relation avec d'autres fiches"
* relatesTo obeys constr-cdr-rempl
* relatesTo.code ^short = "Représente le type d'association entre deux fiches."
* relatesTo.target ^short = "Représente l'identifiant d'une association entre deux fiches."

* description MS
* description ^short = "Commentaire associé au document."

* securityLabel ^definition = "Les codes pour cet élément doivent provenir du ValueSet spécifié par le standard. Lorsqu’aucun code ne correspond au concept recherché, un code provenant de la terminologie de référence TRE_A07-StatusVisibiliteDocument, OID : 1.2.250.1.213.1.1.4.13 peut être utilisé (cf JDV_J110 : https://mos.esante.gouv.fr/NOS/JDV_J110-StatutVisibiliteDocument-CISIS/FHIR/JDV-J110-StatutVisibiliteDocument-CISIS)."
* securityLabel ^short = "Contient les informations définissant le niveau de confidentialité d'un document."

// ###########
// # CONTENT #
// ###########
* content MS
* content ^short = "cument référencé."
* content.attachment.language ^short = "Pour tous les documents produits par les systèmes initiateurs français, le codes est \"fr-FR'."
* content.attachment.size 1.. 
* content.attachment.size ^short = "Représente la taille du document."
* content.attachment.hash 1..
* content.attachment.hash ^short = "Représente le résultat de hachage du document (SHA 1)."
* content.attachment.title 1..
* content.attachment.url ^short = "Représente la référence vers une ressource Binary où se trouvent les données du document référencé"

* content.attachment.creation ^short = "Représente la date et l’heure de création du document"

* content.format from $JDV-J10-XdsFormatCode-CISIS (preferred)
* content.format ^definition = "Les valeurs possibles pour cet élément doivent provenir d’une des terminologies de référence suivantes :\r\n- TRE_A06-FormatCodeComplementaire, OID : 1.2.250.1.213.1.1.4.2.282\r\n- TRE_A11-IheFormatCode, OID : 1.3.6.1.4.1.19376.1.2.3\r\n- TRE_A09-DICOMuidRegistry, OID : 1.2.840.10008.2.6.1\r\n- TRE_A10-NomenclatureURN, OID : URN\r\nLes valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J60-FormatCode-DMP).\r\nEn l’absence de spécifications complémentaires, le jeu de valeurs JDV_J10-XdsFormatCode-CISIS peut être utilisé."
* content.format ^binding.description = "XDS formatCode documents CI-SIS"
* content.format ^short = "Format technique détaillé du document."

// ###########
// # CONTEXT #
// ###########
* context MS
* context.event ..1
* context.event ^definition = "- Nomenclatures utilisées :\r\nCCAM pour les actes médicaux (OID=\"\"1.2.250.1.213.2.5\"\");\r\n- CIM-10 pour les diagnostics de pathologie (OID=\"\"2.16.840.1.113883.6.3\"\").\r\n- TRE_A00-ProducteurDocNonPS pour les documents d'expression personnelle du patient.\""
* context.event ^short = "Représente les actes et les pathologies en rapport avec le document."

* context.period 1..
* context.period.start 1..

* context.facilityType from $JDV-J02-XdsHealthcareFacilityTypeCode-CISIS (preferred)
* context.facilityType ^definition = "Les valeurs possibles pour cet élément doivent provenir d’une des terminologies de référence suivantes :\r\n- TRE_A00-ProducteurDocNonPS, OID : 1.2.250.1.213.1.1.4.6 (lorsque l’auteur du document est un patient ou un équipement sous sa responsabilité)\r\n- TRE_R02-SecteurActivite, OID : 1.2.250.1.71.4.2.4 (lorsque l’auteur du document est un professionnel ou un équipement sous sa responsabilité)\r\nLes valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J61-HealthcareFacilityTypeCode-DMP).\r\nEn l’absence de spécifications complémentaires, le jeu de valeurs JDV_J02-XdsHealthcareFacilityTypeCode-CISIS peut être utilisé."
* context.facilityType ^binding.description = "XDS healthcareFacilityTypeCode CI-SIS"
* context.facilityType ^short = "Secteur d'activité lié à la prise en charge de la personne, en lien avec le document produit."

* context.practiceSetting from $JDV-J04-XdsPracticeSettingCode-CISIS (preferred)
* context.practiceSetting ^definition = "Les valeurs possibles pour cet élément doivent provenir d’une des terminologies de référence suivantes :\r\n- TRE_A00-ProducteurDocNonPS, OID : 1.2.250.1.213.1.1.4.6 (lorsque l’auteur du document est un patient ou un équipement sous sa responsabilité)\r\n- TRE_A01-CadreExercice, OID : 1.2.250.1.213.1.1.4.9 (lorsque l’auteur du document est un professionnel ou un équipement sous sa responsabilité)\r\nLes valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J62-PracticeSettingCode-DMP).\r\nEn l’absence de spécifications complémentaires, le jeu de valeurs JDV_J04-XdsPracticeSettingCode-CISIS peut être utilisé."
* context.practiceSetting ^short = "Cadre d’exercice de l’acte qui a engendré la création du document."
* context.practiceSetting ^binding.description = "XDS practiceSettingCode CI-SIS"

* context.sourcePatientInfo only Reference(Patient) //FrPatient
* context.sourcePatientInfo ^short = "Référence vers la ressource Patient titulaire du dossier."
* context.sourcePatientInfo ^type.aggregation = #contained

Invariant:   constr-cdr-maj
Description: "Elément requis lorsque le flux envoyé correspond à une mise à jour des données d’une fiche"
Severity:    #error

Invariant:   constr-cdr-rempl
Description: "Elément requis lorsque le flux envoyé correspond au remplacement d'un document"
Severity:    #error