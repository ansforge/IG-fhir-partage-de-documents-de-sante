### Liste des équivalences

Ce document indique les équivalences avec d'autres modèles

#### Mise en équivalence SFE-PDS avec le profil MHD

Ce tableau reprend les acteurs identifiés dans les SFE-PDS ainsi que les flux qu’ils prennent en charge et les met en équivalence avec le profil MHD. 

| SFE-PDS | Profil MHD |
| ----- | ----- |
| **Producteur de documents** | **Document source** |
| Flux 1 - AjoutLotDocument <br/> Flux 2 - ResultatAjoutLotDocument | Provide Document Bundle [ITI-65] |
| Flux 3 - MiseAJourMetadonneeFiche <br/> Flux 4 - ResultatMAJMetadonneFiche | Hors périmètre MHD|
| **Consommateur de documents** | **Document Consumer** |
| Flux 5 - RechercheDocument <br/> Flux 6 - ResultatRechercheDocument | Find Document Lists [ITI-66] <br/>Find Document References [ITI-67] |
| Flux 7 - DemandeConsultationDocuments <br/>Flux 8 - ResultatDemandeConsultationDocument | Retrieve Document [ITI-68]| 
| **Gestionnaire de partage de documents** | **DocumentRecipient** |
| Flux 1 - AjoutLotDocument <br/> Flux 2 - ResultatAjoutLotDocument | Provide Document Bundle [ITI-65] |
| Flux 3 - MiseAJourMetadonneeFiche <br/> Flux 4 - ResultatMiseAJourMetadonneFiche | Hors périmètre MHD |
| **Gestionnaire de partage de documents** | **Document Responder** |
| Flux 5 - RechercheDocument <br/> Flux 6 - ResultatRechercheDocument | Find Document Lists [ITI-66] <br/> Find Document References [ITI-67] |
| Flux 7 - DemandeConsultationDocuments <br/> Flux 8 - ResultatDemandeConsultationDocument | Retrieve Document [ITI-68] |
{: .grid }

#### Mise en correspondance des flux avec le volet Partage de documents de santé

| **Flux partage de documents de santé en mobilité** | **Flux partage de documents de santé** |
| ----- | ----- |
| Flux 1 - AjoutLotDocument <br/> Flux 2 - ResultatAjoutLotDocument XDS | Provide & Register Document Set ITI-41 |
| Flux 3 - MiseAJourMetadonneeFiche <br/> Flux 4 - ResultatMAJMetadonneFiche | XDS Update Document Set ITI-57 |
| Flux 5 - RechercheDocument  <br/> Flux 6 - ResultatRechercheDocument | XDS Stored Query ITI-18 |
| Flux 7 - DemandeConsultationDocuments  <br/> Flux 8 - ResultatDemandeConsultationDocument | XDS Retrieve Document Set ITI-43 |
{: .grid }

#### Mise en correspondance avec API DOC MES

| **Flux partage de documents de santé en mobilité** | **Flux API DOC CNAM** | **Comparaison** |
| ----- | ----- | ----- |
| Flux 1 - AjoutLotDocument <br/> Flux 2 - ResultatAjoutLotDocument XDS | Flux 1 : Alimentation d'un document | Certains différences de modélisation font qu'il n'y a pas de compatibilité, par exemple DocumentReference.category ne sont pas liés au  même ValueSet |
| Flux 3 - MiseAJourMetadonneeFiche <br/> Flux 4 - ResultatMAJMetadonneFiche | ∅ Pas d'équivalence | ∅ Pas d'équivalence |
| Flux 5 - RechercheDocument  <br/> Flux 6 - ResultatRechercheDocument | Flux 2 : Recherche multicritère des métadonnées d'un ou plusieurs documents | Les critères de recherche sont différent, mise à part period-start (cf tableau ci-dessous) |
| Flux 7 - DemandeConsultationDocuments  <br/> Flux 8 - ResultatDemandeConsultationDocument | Flux 3 : Récupération d'un document | Similaire : accès à une url via un HTTP Get |
{: .grid }

#### Mise en correspondance des critères de recherche avec API Doc de l'Assurance Maladie

| **PDSm Flux 05-a** | **API DOC CNAM** | **Remarques** |
| ----- | ----- | ----- |
| period-start | period-start | OK |
| category | category | ValueSet différents |
| patient.identifier | patient:identifier | Recherche différente |
| type | ∅ Pas d'équivalence | |
| facility |  ∅ Pas d'équivalence | |
| setting |  ∅ Pas d'équivalence | |
| identifier |  ∅ Pas d'équivalence | |
| creation |  ∅ Pas d'équivalence | |
| security-label |  ∅ Pas d'équivalence | |
| status |  ∅ Pas d'équivalence | |
| isArchived |  ∅ Pas d'équivalence | |
| period-end |  ∅ Pas d'équivalence | |
| format |  ∅ Pas d'équivalence | |
| relatesto |  ∅ Pas d'équivalence | |
| event |  ∅ Pas d'équivalence | |
| period |  ∅ Pas d'équivalence | |
{: .grid }



##### Search Parameters de la ressource DocumentReference (flux 05-b)

| **Nom SearchParam PDSm** | **Commentaire** |
| ----- | ----- |
| period-start | Compatible |
| category | Compatible |
| patient.identifier | Devient patient:identifier dans API DOC MES|
| _count | N'est pas présent dans la documentation de PDSm |
{: .grid }


##### Différences de modélisation de la ressource DocumentReference

* DocumentReference.category n'est pas bindé au même ValueSet (table des catégories ENS vs TRE)
* content.attachment.data (obligatoire pour API DOC MES vs ressource Binary pour PDSm)

