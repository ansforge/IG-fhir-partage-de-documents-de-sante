# Mise à jour de documents - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Spécifications fonctionnelles - vue d'ensemble**](specifications_fonctionnelles.md)
* **Mise à jour de documents**

## Mise à jour de documents

### Définition

**Figure 3 : Processus collaboratif "Mise à jour des métadonnées d'une fiche"**

| | |
| :--- | :--- |
| **Service attendu** | Le producteur de documents envoie au gestionnaire de partage de documents les modifications des métadonnées du document : niveau de confidentialité, options de visibilité et statut. Il peut envoyer une de ces métadonnées, plusieurs ou toutes. |
| **Pré-conditions** | Le producteur de documents doit au préalable :1. être en possession des métadonnées à modifier,2. être habilité |
| **Post-conditions** | N/A |
| **Contraintes fonctionnelles** | N/A |
| **Scénario nominal** | N/A |

**Table 2 Caractéristiques du processus collaboratif**

### Description et identification des flux

**Figure 7 : Processus collaboratif "Mise à jour des métadonnées d'une fiche"**

#### Description des flux

| | |
| :--- | :--- |
| Mise à jour des métadonnées de la fiche |  Le producteur de document soumet les métadonnées à mettre à jour au gestionnaire. |
| Consulter la réponse | Le producteur de documents prend connaissance de la réponse du gestionnaire suite à la demande de mise à jour. |
| Réceptionner la demande | Le gestionnaire reçoit la demande de mise à jour des métadonnées.Exécuter la demande si possibleLe gestionnaire met à jour, si possible, la ou les métadonnées de la fiche avec les éléments envoyés par le producteur. |

**Table 8 Tableau des actions**

#### Identification des flux

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| Flux 3 - MiseAJourMetadonneeFiche | Mise à jour des métadonnées d'une fiche | Producteur de documents | Gestionnaire de partage de documents | Oui |
| Flux 4 – ResultatMAJMetadonneeFiche | Mise à jour des métadonnées d'une fiche | Gestionnaire de partage de documents | Producteur de documents | Oui |

### Flux 3 - MiseAJourMetadonneeFiche MODELISATION DES FLUX D'INFORMATIONS

**Figure 12 : Flux 3 - MiseAJourMetadonneeFiche**

#### Classe "Fiche"

Une fiche représente le document stocké dans l’infrastructure de partage de documents. Elle contient les informations décrivant les caractéristiques principales d’un document servant au classement et à la recherche des documents.

| | |
| :--- | :--- |
| idUnique : [0..1] Identifiant | Identifiant unique global affecté au document par son créateur. Il est utilisable comme référence externe dans d’autres documents. |
| statut : [1..1] Code | Représente le statut de la fiche d'un document.Nomenclature(s) associée(s) :** TRE_R269-AvailabilityStatusProvenanceOasis** TRE_R270-AvailabilityStatus |
| niveauConfidentialite : [0..*] Code | Contient les informations définissant le niveau de confidentialité d'un document.Nomenclatures utilisées :** TRE_A08-Confidentiality-HL7** TRE_A07-StatusVisibiliteDocument** JDV_J08-XdsConfidentialityCode-CISIS |

**Table 23 Attributs de la classe "Fiche"**

### Flux 4 - ResultatMAJMetadonneeFiche MODELISATION DES FLUX D'INFORMATIONS

**Figure 13 : Flux 4 - ResultatMAJMetadonneeFiche**

#### Classe "Fiche"

Une fiche représente le document stocké dans l’infrastructure de partage de documents. Elle contient les informations décrivant les caractéristiques principales d’un document servant au classement et à la recherche des documents.

| | |
| :--- | :--- |
| statutAttributFiche : [0..*] Texte | La réponse de la demande de modification du dossier patient peut contenir une fiche qui contient le statut (réussite ou échec) de chaque attribut renseigné lors de la demande de modification du dossier patient. |

**Table 24 Attributs de la classe "Fiche"**

