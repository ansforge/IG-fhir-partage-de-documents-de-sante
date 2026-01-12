### Définition 

<div class="figure" style='text-align: center;'>
    <img src="fonctionnel/fig_3.png" alt="Figure 3" title="Figure 3 : Processus collaboratif Mise à jour des métadonnées d'une fiche" style="width:60%;">
    <figcaption><b>Figure 3 : Processus collaboratif "Mise à jour des métadonnées d'une fiche"</b></figcaption>
</div>
<br>

| **Service attendu** | Le producteur de documents envoie au gestionnaire de partage de documents les modifications des métadonnées du document : niveau de confidentialité, options de visibilité et statut. Il peut envoyer une de ces métadonnées, plusieurs ou toutes. |
| **Pré-conditions** | Le producteur de documents doit au préalable : <br> 1. être en possession des métadonnées à modifier, <br> 2. être habilité |
| **Post-conditions** | N/A |
| **Contraintes fonctionnelles** | N/A |
| **Scénario nominal** | N/A |

**Table 2 Caractéristiques du processus collaboratif**


### Description et identification des flux


<object data="fonctionnel/fig_7.png" type="image/png"></object>
<br/>


<div class="figure" style='text-align: center;'>
    <img src="fonctionnel/fig_7.png" alt="Figure 7" title="Figure 7 : Processus collaboratif Mise à jour des métadonnées d'une fiche" style="width:80%;">
    <figcaption><b>Figure 7 : Processus collaboratif "Mise à jour des métadonnées d'une fiche"</b></figcaption>
</div>
<br>


#### Description des flux


| **Action** | **Description** |
| ------ | ------ |
| Mise à jour des métadonnées de la fiche | Le producteur de document soumet les métadonnées à mettre à jour au gestionnaire. |
| Consulter la réponse | Le producteur de documents prend connaissance de la réponse du gestionnaire suite à la demande de mise à jour. |
| Réceptionner la demande | Le gestionnaire reçoit la demande de mise à jour des métadonnées. <br/>Exécuter la demande si possible	Le gestionnaire met à jour, si possible, la ou les métadonnées de la fiche avec les éléments envoyés par le producteur. |

**Table 8 Tableau des actions**

#### Identification des flux


| **Flux** | **Processus** | **Emetteur** | **Récepteur** | **Périmètre** |
| ------ | ------ | ------ | ------ | ------ |
| Flux 3 - MiseAJourMetadonneeFiche | Mise à jour des métadonnées d'une fiche | Producteur de documents | Gestionnaire de partage de documents | Oui |
| Flux 4 – ResultatMAJMetadonneeFiche | Mise à jour des métadonnées d'une fiche | Gestionnaire de partage de documents | Producteur de documents | Oui |


### Flux 3 - MiseAJourMetadonneeFiche MODELISATION DES FLUX D'INFORMATIONS

<div class="figure" style='text-align: center;'>
    <img src="fonctionnel/fig_12.png" alt="Figure 12" title="Figure 12 Flux 3 - MiseAJourMetadonneeFiche" style="width:80%;">
    <figcaption><b>Figure 12 : Flux 3 - MiseAJourMetadonneeFiche</b></figcaption>
</div>
<br>

#### Classe "Fiche"
Une fiche représente le document stocké dans l’infrastructure de partage de documents. Elle contient les informations décrivant les caractéristiques principales d’un document servant au classement et à la recherche des documents.

| **Nom** | **Description** |
| ----- | ----- |
| idUnique : [0..1] Identifiant	Identifiant unique global affecté au document par son créateur. Il est utilisable comme référence externe dans d’autres documents.|
| statut : [1..1] Code | Représente le statut de la fiche d'un document.<br/>Nomenclature(s) associée(s) :<br/>** TRE_R269-AvailabilityStatusProvenanceOasis<br/>** TRE_R270-AvailabilityStatus |
| niveauConfidentialite : [0..*] Code | Contient les informations définissant le niveau de confidentialité d'un document.<br/>Nomenclatures utilisées :<br/>** TRE_A08-Confidentiality-HL7<br/>** TRE_A07-StatusVisibiliteDocument<br/>** JDV_J08-XdsConfidentialityCode-CISIS|

**Table 23 Attributs de la classe "Fiche"**

### Flux 4 - ResultatMAJMetadonneeFiche MODELISATION DES FLUX D'INFORMATIONS

<object data="fonctionnel/fig_13.png" type="image/png"></object>
<br/>

<div class="figure" style='text-align: center;'>
    <img src="fonctionnel/fig_13.png" alt="Figure 13" title="Figure 13 Flux 4 - ResultatMAJMetadonneeFiche" style="width:80%;">
    <figcaption><b>Figure 13 : Flux 4 - ResultatMAJMetadonneeFiche</b></figcaption>
</div>
<br>

#### Classe "Fiche"
Une fiche représente le document stocké dans l’infrastructure de partage de documents. Elle contient les informations décrivant les caractéristiques principales d’un document servant au classement et à la recherche des documents.

| **Nom** | **Description** |
| ----- | ----- |
| statutAttributFiche : [0..*] Texte | La réponse de la demande de modification du dossier patient peut contenir une fiche qui contient le statut (réussite ou échec) de chaque attribut renseigné lors de la demande de modification du dossier patient.

**Table 24 Attributs de la classe "Fiche"**

