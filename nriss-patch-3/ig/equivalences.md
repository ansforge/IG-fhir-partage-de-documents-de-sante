# Equivalences - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Autres Ressources**](autres_ressources.md)
* **Equivalences**

## Equivalences

Ce document indique les équivalences avec d'autres modèles

### Mise en équivalence PDSm avec les concepts métiers

| | |
| :--- | :--- |
| LotDeSoumission | List SubmissionSetComprehensive |
| Fiche | DocumentReference ComprehensiveDocumentReference  |
| Classeur | List FolderComprehensive |
| Document | Binary |

### Mise en équivalence SFE-PDS avec le profil MHD

Ce tableau reprend les acteurs identifiés dans les SFE-PDS ainsi que les flux qu’ils prennent en charge et les met en équivalence avec le profil MHD.

| | |
| :--- | :--- |
| **Producteur de documents** | **Document source** |
| Flux 1 - AjoutLotDocumentFlux 2 - ResultatAjoutLotDocument | Provide Document Bundle [ITI-65] |
| Flux 3 - MiseAJourMetadonneeFicheFlux 4 - ResultatMAJMetadonneFiche | Hors périmètre MHD |
| **Consommateur de documents** | **Document Consumer** |
| Flux 5 - RechercheDocumentFlux 6 - ResultatRechercheDocument | Find Document Lists [ITI-66]Find Document References [ITI-67] |
| Flux 7 - DemandeConsultationDocumentsFlux 8 - ResultatDemandeConsultationDocument | Retrieve Document [ITI-68] |
| **Gestionnaire de partage de documents** | **DocumentRecipient** |
| Flux 1 - AjoutLotDocumentFlux 2 - ResultatAjoutLotDocument | Provide Document Bundle [ITI-65] |
| Flux 3 - MiseAJourMetadonneeFicheFlux 4 - ResultatMiseAJourMetadonneFiche | Hors périmètre MHD |
| **Gestionnaire de partage de documents** | **Document Responder** |
| Flux 5 - RechercheDocumentFlux 6 - ResultatRechercheDocument | Find Document Lists [ITI-66]Find Document References [ITI-67] |
| Flux 7 - DemandeConsultationDocumentsFlux 8 - ResultatDemandeConsultationDocument | Retrieve Document [ITI-68] |

### Mise en correspondance des flux avec le volet Partage de documents de santé

| | |
| :--- | :--- |
| Flux 1 - AjoutLotDocumentFlux 2 - ResultatAjoutLotDocument XDS | Provide & Register Document Set ITI-41 |
| Flux 3 - MiseAJourMetadonneeFicheFlux 4 - ResultatMAJMetadonneFiche | XDS Update Document Set ITI-57 |
| Flux 5 - RechercheDocumentFlux 6 - ResultatRechercheDocument |  XDS Stored Query ITI-18 |
| Flux 7 - DemandeConsultationDocumentsFlux 8 - ResultatDemandeConsultationDocument | XDS Retrieve Document Set ITI-43 |

### Mise en correspondance avec l'API documents de Mon Espace Santé (MES)

| | | |
| :--- | :--- | :--- |
| Flux 1 - AjoutLotDocumentFlux 2 - ResultatAjoutLotDocument XDS | Flux 1 : Alimentation d'un document | Certains différences de modélisation font qu'il n'y a pas de compatibilité, par exemple DocumentReference.category ne sont pas liés au même ValueSet |
| Flux 3 - MiseAJourMetadonneeFicheFlux 4 - ResultatMAJMetadonneFiche | ∅ Pas d'équivalence | ∅ Pas d'équivalence |
| Flux 5 - RechercheDocumentFlux 6 - ResultatRechercheDocument | Flux 2 : Recherche multicritère des métadonnées d'un ou plusieurs documents | Les critères de recherche sont différents, mise à part period-start (cf tableau ci-dessous). Ils peuvent cependant devenir compatibles à l'aide du paramètre de recherche _filter permettant d'utiliser l'opérateur booléen "OU" |
| Flux 7 - DemandeConsultationDocumentsFlux 8 - ResultatDemandeConsultationDocument | Flux 3 : Récupération d'un document | Similaire : accès à une url via un HTTP Get |

### Mise en correspondance des critères de recherche avec l'API documents de MES

| | | |
| :--- | :--- | :--- |
| period-start | period-start | OK |
| category | category | ValueSet différents |
| patient.identifier | patient:identifier | Recherche différente |
| type | ∅ Pas d'équivalence |   |
| facility | ∅ Pas d'équivalence |   |
| setting | ∅ Pas d'équivalence |   |
| identifier | ∅ Pas d'équivalence |   |
| creation | ∅ Pas d'équivalence |   |
| security-label | ∅ Pas d'équivalence |   |
| status | ∅ Pas d'équivalence |   |
| isArchived | ∅ Pas d'équivalence |   |
| period-end | ∅ Pas d'équivalence |   |
| format | ∅ Pas d'équivalence |   |
| relatesto | ∅ Pas d'équivalence |   |
| event | ∅ Pas d'équivalence |   |
| period | ∅ Pas d'équivalence |   |

#### Search Parameters de la ressource DocumentReference (flux 05-b)

| | |
| :--- | :--- |
| period-start | Compatible |
| category | Compatible |
| patient.identifier | Devient patient:identifier dans API DOC MES |
| _count | N'est pas présent dans la documentation de PDSm |

#### Différences de modélisation de la ressource DocumentReference

* DocumentReference.category n'est pas bindé au même ValueSet (table des catégories ENS vs TRE)
* content.attachment.data (obligatoire pour API DOC MES vs ressource Binary pour PDSm)

### Mise en équivalence des paramètres de recherche avec les critères de recherche métier

#### Recherche de lot de soumission (profil PDSmSubmissionSetComprehensive)

| | |
| :--- | :--- |
| dateSoumission : Date | date : date |
| typeActivite : Code | designationType : token |
| idUnique : Identifiant | identifier : token |
| statut : Code | status : tokenParamètre de recherche créé pour le volet PDSm :isArchived : token |
| idLotSoumission : Identifiant | identifier : token |
| titre : Texte | title : string |
| idSource : Identifiant | sourceId : reference |
| auteur : Identifiant | source : referenceParamètre de recherche créé pour le volet PDSmauthorOrg : reference |
| code : code | code : token |
| idPatient : Identifiant | patient.identifier : token |
| prenomAuteurPersonnePhysique : Texte | source:Patient.given : stringsource:PractitionerRole.name : string |
| nomAuteurPersonnePhysique : Texte | source:Patient.family : stringsource:PractitionerRole.name : string |

#### Recherche de fiche (profil PDSmComprehensiveDocumentReference)

| | |
| :--- | :--- |
| dateSoumission : Date | date : date |
| typeActivite : Code | designationType : token |
| idUnique : Identifiant | identifier : token |
| statut : Code | status : tokenParamètre de recherche créé pour le volet PDSm :isArchived : token |
| idLotSoumission : Identifiant | identifier : token |
| titre : Texte | title : string |
| idSource : Identifiant | sourceId : reference |
| auteur : Identifiant | source : referenceParamètre de recherche créé pour le volet PDSmauthorOrg : reference |
| code : code | code : token |
| idPatient : Identifiant | patient.identifier : token |
| prenomAuteurPersonnePhysique : Texte | source:Patient.given : stringsource:PractitionerRole.name : string |
| nomAuteurPersonnePhysique : Texte | source:Patient.family : stringsource:PractitionerRole.name : string |

