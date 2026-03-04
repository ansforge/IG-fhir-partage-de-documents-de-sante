# Consultation de documents - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Spécifications fonctionnelles - vue d'ensemble**](specifications_fonctionnelles.md)
* **Consultation de documents**

## Consultation de documents

### Définition

**Figure 5 : Processus collaboratif "Consultation de documents"**

| | |
| :--- | :--- |
|  **Service attendu** |  Le consommateur de documents consulte des documents stockés dans l’infrastructure de partage de documents à partir des références qu’il a obtenues. |
| **Pré-conditions** | Le consommateur de documents doit :1. avoir au préalable récupéré les références du ou des document(s) qu’il souhaite consulter2. être habilité  |
| **Post-conditions** | N/A  |
| **Contraintes fonctionnelles** | N/A  |
| **Scénario nominal** | N/A  |

**Table 4 Caractéristiques du processus collaboratif**

### Description et identification des flux

**Figure 9 : Processus collaboratif "Consultation de documents"**

#### Description des actions

| | |
| :--- | :--- |
|  Transmettre la demande de consultation de documents | Le consommateur de documents envoie à l'infrastructure de partage de documents une demande pour consulter un ou plusieurs documents. |
| Traiter la réponse | Le consommateur de documents reçoit et traite la réponse à la demande de consultation de documents et affiche le résultat à l'utilisateur. |
| Traiter la demande de consultation | L'infrastructure de partage de documents traite la demande de consultation du ou des documents et retourne le résultat de la demande au consommateur de documents. |

**Table 12 Tableau des actions**

#### Identification des flux

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
|  Flux 7 - DemandeConsultationDocument |  Consultation de documents |  Consommateur de documents |  Gestionnaire de partage de documents |  Oui |
|  Flux 8 - ResultatDemandeConsultationDocument |  Consultation de documents |  Gestionnaire de partage de documents |  Consommateur de documents |  Oui |

### Flux de recherche : Flux 7 – DemandeConsultationDocument

La demande de consultation de document se fait via l’envoi de l’identifiant unique du document, récupéré dans le résultat de recherche de documents, à la plateforme de partage de documents de santé

| | |
| :--- | :--- |
| Fiche/idUnique | Identifiant unique global affecté au document par son créateur. Il est utilisable comme référence externe dans d’autres documents. |

**Table 28 Flux de recherche**

### Flux 8 - ResultatDemandeConsultationDocument

**Figure 15 : Flux 8 - ResultatDemandeConsultationDocument**

#### Classe "Document"

Un document est la plus petite unité d'information déposée dans l’infrastructure de partage de documents. Une fois stocké dans l’infrastructure de partage de documents avec un identifiant unique, le document ne subit plus aucune modification.

| | |
| :--- | :--- |
| contenuDocument : [1..1] ObjetBinaire |  Contient le document au format binaire |

**Table 29 Attributs de la classe "Document"**

