# Accueil - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

## Accueil

 **PDSm Implementation Guide**
 This document presents the technical specifications of the “Partage de documents de santé en mobilité” section. This is a part of the service layer specifying the terms of document sharing without constraining them. The specifications related to health documents constitute the components of the business layer of CI-SIS. 

### Introduction

Ce document présente les spécifications techniques du volet "Partage de documents de santé en mobilité". Sa production est basée sur les Spécifications Fonctionnelles des Echanges du volet Partage de Documents de Santé et le profil [MHD](https://profiles.ihe.net/ITI/MHD/index.html) (Mobile access to Health Documents) défini par IHE (Integrating the Healthcare Entreprise).

Il s’agit d’un volet de la couche service spécifiant les modalités de partage de documents sans contraindre ces derniers. Les spécifications liées aux documents de santé constituent les volets de la couche métier du CI-SIS.

A noter que la dénomination du volet « Partage de documents de santé en mobilité » n’est pas restrictive. En effet, les standards sous-jacents aux spécifications techniques, par opposition au volet historique « Partage de documents de santé », permettent le déploiement de cas d'usage en mobilité mais ces spécifications peuvent également être mises en œuvre dans d'autres cas d'usage.

Ce document s'adresse aux personnes intervenant dans la mise en place des interfaces interopérables des systèmes implémentant le partage de documents de santé.

### Ressources FHIR et profils

Le tableau ci-après spécifie les profils utilisés pour les ressources et types de données mentionnés dans ce document.

| | |
| :--- | :--- |
| Titre du profil | Description |
| [PDSm Comprehensive DocumentReference](StructureDefinition-pdsm-comprehensive-document-reference.md) | Profil contenant les métadonnées du document ainsi que le lien vers la ressource Binary contenant le document dérivé de la ressource DocumentReference et du profil IHE MHD v4.0.1 "ComprehensiveDocumentReference" |
| [PDSm Comprehensive Provide Document Bundle](StructureDefinition-pdsm-comprehensive-provide-document-bundle.md) | Profil basé sur la transaction IHE "Provide Document Bundle [ITI-65]" du profil MHD ; le bundle est de type transaction et contient :* une ressource de type « List » représentant le lot de soumission,
* une à plusieurs ressources de type « DocumentReference », représentant les fiches de documents,
* zero à plusieurs ressources « Binary » représentant les documents envoyés dans le flux,
* zero à plusieurs ressources de type « List » représentant les classeurs. Dans le cas d’un dépôt d’un nouveau document, l’élément DocumentReference.content.attachment.url doit pointer vers une ressource Binary, représentant le document, présente dans le bundle. Dans le cas d’une demande de mise à jour d’un document par remplacement, l’élément DocumentReference.relatesTo doit être renseigné afin d’indiquer le lien avec un DocumentReference existant et de préciser la nature de la mise à jour. L’élément DocumentReference.content.attachment.url doit pointer vers une ressource Binary, représentant le document qui remplace l’ancien, présente dans le bundle. Dans le cas d’une mise à jour d’un classeur, comme List.status ou List.entry pour reclasser des documents, une nouvelle version de la ressource List est envoyée.
 |
| [PDSm Find DocumentReferences Comprehensive Response](StructureDefinition-pdsm-find-documentreferences-comprehensive-response.md) | Profil de réponse de la transaction IHE "Find Document References [ITI-67]" basée sur le bundle MHD FindDocumentReferencesComprehensiveResponseMessage |
| [PDSm Find Lists Response](StructureDefinition-pdsm-find-lists-response.md) | Profil de réponse de la transaction IHE "Find Document Lists [ITI-66]" basée sur le bundle MHD FindDocumentListsResponseMessage |
| [PDSm Folder Comprehensive](StructureDefinition-pdsm-folder-comprehensive.md) | Profil du Classeur dérivé de la ressource List et du profil IHE MHD « Comprehensive Folder ». |
| [PDSm Simplified Publish Document Reference](StructureDefinition-pdsm-simplified-publish.md) | Profil utilisé dans le cadre du flux 9 d'ajout simplifié de document. Le flux et le profil sont inspirés d’IHE MHD, transaction ITI-105.Contrairement au profil PDSm_ComprehensiveDocumentReference, le document est directement inclus dans DocumentReference.attachment.data et non dans une ressource « Binary » externe.La publication simplifiée est une simple requête HTTP POST d'une ressource DocumentReference conforme à ce profil. |
| [PDSm SubmissionSet Comprehensive](StructureDefinition-pdsm-submissionset-comprehensive.md) | Profil du lot de soumission dérivé de la ressource List et du profil IHE MHD « ComprehensiveSubmissionSet ». |

### Les flux

Un flux est un échange entre deux systèmes. Des flux ont été identifiés lors d'études métiers et définis, avec partage de ressources FHIR. Pour en savoir davantage, rendez-vous sur la page [construction des flux](construction_des_flux.md).

| | | |
| :--- | :--- | :--- |
| [Les flux 01 et 02 ](st_ajout.md) | AjoutLotDocument et ResultatAjoutLotDocument | Pour la demande d’ajout ou de remplacement d’un document au gestionnaire de partage de documents ainsi que le résultat de la demande |
| [Les flux 03 et 04](st_maj.md) | MiseAJourMetadonneeFiche et ResultatMAJMetadonneeFiche | Pour la modification de certaines métadonnées du document comme le statut ou le niveau de confidentialité ainsi que le résultat de la demande |
| [Les flux 05a et 06a](st_recherche_lot.md) | RechercheDocument et ResultatRechercheDocument | Pour la recherche de lot de documents à l'aide de critères de recherche ainsi que le résultat de la demande |
| [Les flux 05b et 06b](st_recherche_fiche.md) | RechercheDocument et ResultatRechercheDocument | Pour la recherche de fiches à l'aide de critères de recherche ainsi que le résultat de la demande |
| [Les flux 07 et 08](st_consultation.md) | DemandeConsultationDocument et ResultatDemandeConsultationDocument | Pour demander la consultation d'un ou de plusieurs document ainsi que le résultat de la demande |
| [Les flux 09 et 10](st_ajout_simplifie.md) | AjoutSimplifieDocument et ResultatAjoutSimplifieDocument | Pour publier un document de manière simplifiée ainsi que le résultat de la demande |

#### Alimentation utilisant Comprehensive Metadata

Les trois profils utilisés pour le flux d'alimentation sont :

* 1) la fiche document [PDSm_ComprehensiveDocumentReference](StructureDefinition-pdsm-comprehensive-document-reference.md),
* 2) le classeur [PDSm_FolderComprehensive](StructureDefinition-pdsm-folder-comprehensive.md),
* 3) le lot de soumission [PDSm_SubmissionSetComprehensive](StructureDefinition-pdsm-submissionset-comprehensive.md)

Ces trois profils doivent être encapsulés dans le [Bundle Comprehensive Provide Document](StructureDefinition-pdsm-comprehensive-provide-document-bundle.md).


#### Alimentation utilisant la publication simplifiée

La publication simplifiée utilise le profil [DocumentReference Simplified Publish](StructureDefinition-pdsm-simplified-publish.md).

#### Recherche par lot ou par fiche

Il existe deux profils Bundle permettent d'encapsuler les résultats de recherche.

* 1) Le bundle permettant de renvoyer les résultats d'une recherche de fiche [PDSm_FindDocumentReferencesComprehensiveResponse](StructureDefinition-pdsm-find-documentreferences-comprehensive-response.md),
* 2) Le bundle permettant de renvoyer les résultats d'une recherche de lot de soumission [PDSm_FindListsResponse](StructureDefinition-pdsm-find-lists-response.md)

### Dépendances

Plusieurs spécifications sont utilisées dans le cadre de ce volet :

* Ce volet met en place l’option du profil MHD « Comprehensive Metadata » qui permet aux acteurs d’échanger des métadonnées complètes répondant aux exigences définies dans le profil XDS.
* Le profil FHIR « FrPatient » publié par HL7 France (Interop'Santé) est utilisé dans ce volet. Les présentes spécifications se basent sur les profils du package hl7.fhir.fr.core.
* Dans le cadre de l’annuaire santé, l’ANS met à disposition un service national de publication des données des professionnels et des structures au format FHIR; les profils de l’annuaire santé, à savoir « AsPractitionerRoleProfile », « AsPractitionerProfile » et « AsOrganizationProfile » sont utilisés.
* Des ressources standards (Device, Binary) pourront également être utilisées pour compléter les profils définis.

Une [mise en équivalence](equivalences.md) entre les acteurs et les flux identifiés dans les SFE-PDS et ceux présentés dans le profil MHD est disponible.












