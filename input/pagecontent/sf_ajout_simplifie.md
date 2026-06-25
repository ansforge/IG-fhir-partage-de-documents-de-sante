### Définition 


```plantuml
@startuml
skinparam backgroundColor white
skinparam DefaultFontName Arial
skinparam DefaultFontSize 12
skinparam Padding 5
skinparam usecase {
  BackgroundColor #e8e8e8
  BorderColor #888888
  BorderThickness 1
  FontSize 12
}
skinparam actor {
  BorderColor #FF7777
  BackgroundColor #FF9999
  FontColor #000000
  FontSize 12
}
skinparam ArrowColor #000000
left to right direction
actor "Producteur de documents" as PROD <<Rôle>>
usecase "Ajout simplifié\nd'un document" as UC
actor "Gestionnaire de partage\nde documents" as GEST <<Rôle>>
PROD -- UC
UC -- GEST
@enduml
```

**Figure 16 : Processus collaboratif "Ajout simplifié d'un document"**
<br>

| **Service attendu** | Le producteur de documents envoie au gestionnaire de partage de documents une demande d'ajout simplifié d'un document. |
| **Pré-conditions** | Le producteur de documents doit au préalable :<br>1. être en possession du document à ajouter,<br>2. être habilité |
| **Post-conditions** | N/A |
| **Contraintes fonctionnelles** | N/A |
| **Scénario nominal** | N/A |

**Table 5 Caractéristiques du processus collaboratif**


### Description et identification des flux

```plantuml
@startuml
skinparam backgroundColor white
skinparam DefaultFontName Arial
skinparam DefaultFontSize 12
skinparam activity {
  BackgroundColor #dce8f5
  BorderColor #888888
  FontColor #000000
  ArrowColor #000000
  StartColor #B8860B
  EndColor #B8860B
  FontSize 12
}
skinparam swimlane {
  BorderColor #888888
  TitleFontSize 13
  TitleFontColor #000000
  TitleBackgroundColor white
}
|Producteur de documents|
start
:Préparer le document;
-> <<flow>>\nFlux 9 - AjoutSimplifieDocument;
|Gestionnaire de partage de documents|
:Traiter la demande\nd'ajout simplifié;
-[dashed]-> <<flow>>\nFlux 10 - ResultatAjoutSimplifieDocument;
|Producteur de documents|
:Traiter la réponse;
stop
@enduml
```

**Figure 17 : Processus collaboratif "Ajout simplifié d'un document"**
<br>

#### Description des actions


| **Action** | **Description** |
| ------ | ------ |
| Préparer le document | Le producteur de documents prépare le document à ajouter dans l'infrastructure de partage de documents. |
| Traiter la réponse | Le producteur de documents reçoit et traite le résultat de la demande d'ajout simplifié du document. Il peut afficher à l'utilisateur le résultat de la demande. |
| Traiter la demande d'ajout simplifié | L'infrastructure de partage de documents traite la demande d'ajout simplifié, exécute les actions nécessaires au traitement de cette demande et retourne le résultat du traitement. |

**Table 14 Tableau des actions**


#### Identification des flux


| **Flux** | **Processus** | **Emetteur** | **Récepteur** | **Périmètre** |
| ------ | ------ | ------ | ------ | ------ |
| Flux 9 - AjoutSimplifieDocument | Ajout simplifié d'un document | Producteur de documents | Gestionnaire de partage de documents | Oui |
| Flux 10 - ResultatAjoutSimplifieDocument | Ajout simplifié d'un document | Gestionnaire de partage de documents | Producteur de documents | Oui |


### Flux 9 - AjoutSimplifieDocument MODELISATION DES FLUX D'INFORMATIONS

```plantuml
@startuml
hide circle
skinparam backgroundColor white
skinparam DefaultFontName Arial
skinparam DefaultFontSize 11
skinparam class {
  BackgroundColor white
  BorderColor #888888
  HeaderBackgroundColor #dce8f5
  ArrowColor #000000
  FontColor #000000
  FontSize 11
}
skinparam ClassAttributeFontSize 10
class AjoutSimplifieDocument
class Fiche {
  idFiche : Identifiant [0..*]
  idUnique : Identifiant [0..1]
  auteur : Identifiant [1..*]
  statut : Code [1..1]
  classeDocument : Code [0..1]
  typeDocument : Code [0..1]
  authentificateur : Identifiant [0..1]
  dateCreationDocument : DateHeure [1..1]
  niveauConfidentialite : Code [0..*]
  cadreExercice : Code [0..1]
  idPatient : Identifiant [0..1]
  secteurActivite : Code [0..1]
  dateDebutActe : DateHeure [0..1]
  dateFinActe : DateHeure [0..1]
  commentaire : Texte [0..1]
  titreDocument : Texte [0..1]
  langueDocument : Code [0..1]
  formatDocument : Code [0..1]
  actePathologie : Code [0..1]
  version : Numerique [0..1]
}
class Document {
  contenuDocument : ObjetBinaire [1..1]
}
AjoutSimplifieDocument "1" --> "1" Fiche
Fiche "1" --> "1" Document
@enduml
```

**Figure 18 : Flux 9 - AjoutSimplifieDocument**
<br>

#### Classe "Document"

Un document est la plus petite unité d'information déposée dans l'infrastructure de partage de documents. Dans le cadre de l'ajout simplifié, le contenu du document est directement inclus dans la fiche (et non transmis dans une ressource séparée).

| **Nom** | **Description** |
| ----- | ----- |
| contenuDocument : [1..1] ObjetBinaire | Contient le document au format binaire. |

**Table 30 Attributs de la classe "Document"**

#### Classe "Fiche"
Une fiche représente le document stocké dans l'infrastructure de partage de documents. Elle contient les informations décrivant les caractéristiques principales d'un document servant au classement et à la recherche des documents.

| **Nom** | **Description** |
| ----- | ----- |
| idFiche : [0..*] Identifiant | Identifiant unique d'une fiche d'un document. |
| idUnique : [0..1] Identifiant | Identifiant unique global affecté au document par son créateur. Il est utilisable comme référence externe dans d'autres documents. |
| auteur : [1..*] Identifiant | Identifiant de la personne physique et/ou du dispositif auteur d'un document. |
| statut : [1..1] Code | Représente le statut de la fiche d'un document (valeur fixée à « current »).<br/>Nomenclature(s) associée(s) :<br/>** TRE_R269-AvailabilityStatusProvenanceOasis<br/>** TRE_R270-AvailabilityStatus |
| classeDocument : [0..1] Code | Représente la classe du document (compte rendu, imagerie médicale, traitement, certificat, ...).<br/>Jeu de valeurs issu de la nomenclature TRE_A03-ClasseDocument |
| typeDocument : [0..1] Code | Représente le type du document.<br/>Jeu de valeurs issu des nomenclatures :<br/>** LOINC<br/>** et TRE_A05-TypeDocComplementaire |
| authentificateur : [0..1] Identifiant | Cet attribut représente l'acteur validant le document et prenant la responsabilité du contenu médical de celui-ci. Il peut s'agir de l'auteur du document si celui-ci est une personne et s'il endosse la responsabilité du contenu médical de ses documents. |
| dateCreationDocument : [1..1] DateHeure | Représente la date et l'heure de la création du document. |
| niveauConfidentialite : [0..*] Code | Contient les informations définissant le niveau de confidentialité d'un document.<br/>Nomenclatures utilisées :<br/>** TRE_A08-Confidentiality-HL7<br/>** TRE_A07-StatusVisibiliteDocument<br/>** JDV_J08-XdsConfidentialityCode-CISIS |
| cadreExercice : [0..1] Code | Cadre d'exercice de l'acte qui a engendré la création du document.<br/>Nomenclature utilisée : TRE_A01-CadreExercice |
| idPatient : [0..1] Identifiant | Représente l'identifiant du patient. |
| secteurActivite : [0..1] Code | Secteur d'activité lié à la prise en charge de la personne, en lien avec le document produit.<br/>Nomenclature utilisée : TRE_R02-SecteurActivite |
| dateDebutActe : [0..1] DateHeure | Représente la période de début de l'acte de référence. |
| dateFinActe : [0..1] DateHeure | Date de fin de l'acte de référence, si connue. |
| commentaire : [0..1] Texte | Commentaire associé au document. |
| titreDocument : [0..1] Texte | Titre du document. |
| langueDocument : [0..1] Code | Langue dans laquelle le document est rédigé. Pour tous les documents produits par les systèmes initiateurs français, le code est "fr-FR". |
| formatDocument : [0..1] Code | Format technique détaillé du document.<br/>Nomenclatures utilisées :<br/>TRE_A06-FormatCodeComplementaire<br/>TRE_A09-DICOMuidRegistry<br/>TRE_A10-NomenclatureURN<br/>TRE_A11-IheFormatCode<br/>ASS_X11-CorresModeleCDA-XdsFormatCode-CISIS<br/>ASS_A12-CorresMediaTypeCDANonStructure-XdsFormatCode-CISIS |
| actePathologie : [0..1] Code | Actes et pathologies en rapport avec le document.<br/>Nomenclatures utilisées :<br/>** CCAM pour les actes médicaux (OID="1.2.250.1.213.2.5");<br/>** CIM-10 pour les diagnostics de pathologie (OID="2.16.840.1.113883.6.3");<br/>** TRE_A00-ProducteurDocNonPS pour les documents d'expression personnelle du patient. |
| version : [0..1] Numerique | Numéro de version de la fiche d'un document. La valeur de la métadonnée version est égale à 1 pour la première version de la fiche. |

**Table 31 Attributs de la classe "Fiche"**


### Flux 10 - ResultatAjoutSimplifieDocument MODELISATION DES FLUX D'INFORMATIONS

```plantuml
@startuml
hide circle
skinparam backgroundColor white
skinparam DefaultFontName Arial
skinparam DefaultFontSize 11
skinparam class {
  BackgroundColor white
  BorderColor #888888
  HeaderBackgroundColor #dce8f5
  ArrowColor #000000
  FontColor #000000
  FontSize 11
}
class ResultatAjoutSimplifieDocument
class Fiche {
  statutAttributFiche : Texte [0..*]
}
ResultatAjoutSimplifieDocument "0..1" --> "*" Fiche
@enduml
```

**Figure 19 : Flux 10 - ResultatAjoutSimplifieDocument**
<br>

#### Classe "Fiche"

Une fiche représente le document stocké dans l'infrastructure de partage de documents. Elle contient les informations décrivant les caractéristiques principales d'un document servant au classement et à la recherche des documents.

| **Nom** | **Description** |
| ----- | ----- |
| statutAttributFiche : [0..*] Texte | La réponse de la demande d'ajout simplifié d'un document peut contenir une fiche qui contient le statut (réussite ou échec) de chaque attribut renseigné lors de la demande d'ajout. |

**Table 32 Attributs de la classe "Fiche"**
