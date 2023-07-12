<div align="center">
<object data="ci-sis-logo.png" type="image/png"></object>
</div>
<br/>


### Introduction
Ce document présente les spécifications techniques du volet "Partage de documents de santé en mobilité". Sa production est basée sur les [Spécifications Fonctionnelles des Echanges du volet Partage de Documents de Santé](https://esante.gouv.fr/volet-partage-de-documents-de-sante) (SFE-PDS) et le profil [MHD](https://profiles.ihe.net/ITI/MHD/index.html) (Mobile access to Health Documents) défini par IHE (Integrating the Healthcare Entreprise).
    
Il s’agit d’un volet de la couche service spécifiant les modalités de partage de documents sans contraindre ces derniers. Les spécifications liées aux documents de santé constituent les volets de la couche métier du CI-SIS.

A noter que la dénomination du volet « Partage de documents de santé en mobilité » n’est pas restrictive. En effet, les standards sous-jacents aux spécifications techniques, par opposition au volet historique « Partage de documents de santé », permettent le déploiement de cas d'usage en mobilité mais ces spécifications peuvent également être mises en œuvre dans d'autres cas d'usage.

### Lectorat cible 

Ce document s'adresse aux développeurs des interfaces interopérables des systèmes implémentant le partage de documents de santé ou à toute autre personne intervenant dans le processus de mise en place de ces interfaces.

### Standards utilisés

Ces spécifications techniques se basent sur le standard HL7 FHIR Release 4, et plus particulièrement sur les contraintes spécifiées par le profil MHD version 4.0.1. Elles font référence à un certain nombre de ressources du standard ainsi qu'aux spécifications de l'API REST FHIR, basées sur le protocole HTTP. Les syntaxes retenues sont la syntaxe XML et JSON.

Une [mise en équivalence](equivalences.html) entre les acteurs et les flux identifiés dans les SFE-PDS et ceux présentés dans le profil MHD est disponible.
Ce volet met en place l’option du profil MHD « Comprehensive Metadata » qui permet aux acteurs d’échanger des métadonnées complètes répondant aux exigences définies dans le profil XDS. 

#### Ressources FHIR utilisées

Les ressources utilisées et les niveaux de maturité sont les suivants :

* DocumentReference (NM 3)
* List (NM 1)
* Patient (NM N)
* Practitioner (NM 3)
* PractitionerRole (NM 2)
* Organization (NM 3)
* Device (NM 2)
* Binary (NM N)
* Bundle (NM N)


#### Profils utilisés

Des ressources FHIR ont été profilées pour le contexte français et sont utilisés dans le cadre des spécifications techniques du volet « Partage de documents de santé en mobilité ».

Deux sources seront utilisées dans le cadre de ce volet :
* Les profils FHIR « FrPatient », « FrPractitioner » et « FrOrganization » publiés par HL7 France sont utilisés dans ce volet. Les présentes spécifications se basent sur les profils du package hl7.fhir.fr.core 1.1.0.

* Dans le cadre de l’annuaire santé, l’ANS met à disposition un service national de publication des données des professionnels et des structures au format FHIR5; deux profils de l’annuaire santé, à savoir « PractitionerRoleProfessionalRoleRASS », « PractitionerRoleOrganizationalRoleRASS » sont utilisés pour le cas d’usage cahier de liaison. Les présentes spécifications se basent sur les profils du package ANS.annuaire.fhir.r4 0.2.0.

Ces spécifications s’appuient également sur les profils définis dans le profil IHE MHD v4.0.1 relatifs à l’option « Comprehensive Metadata ».

Le tableau ci-après spécifie les profils utilisés pour les ressources et types de données mentionnés dans ce document. Les présentes spécifications définissent également des profils propres au présent volet (préfixe PDSm).
Pour les ressources et types de données non mentionnés dans ce tableau, le profil à utiliser est celui défini par HL7 FHIR.

Cet Implementation Guide contient 7 profils :
- 3 profils pour le flux d'alimentation :  
    - 1) la fiche document [PDSm_ComprehensiveDocumentReference](StructureDefinition-pdsm-comprehensive-document-reference.html), 
    - 2) le classeur [PDSm_FolderComprehensive](StructureDefinition-pdsm-folder-comprehensive.html),
    - 3) le Lot de soumission [PDSm_SubmissionSetComprehensive](StructureDefinition-pdsm-submissionset-comprehensive.html)
- 1 profil pour le flux d'alimentation simplifié :
    - 1) la fiche document [PDSm_SimplifiedPublish](StructureDefinition-pdsm-simplified-publish.html), 
- 1 profil Bundle pour encapsuler l'envoi des documents :
    - [PDSm_ComprehensiveProvideDocumentBundle](StructureDefinition-pdsm-comprehensive-provide-document-bundle.html)
- 2 profils Bundle pour encapsuler les résultats de recherche :
    - 1) par fiche [PDSm_FindDocumentReferencesComprehensiveResponse](StructureDefinition-pdsm-find-documentreferences-comprehensive-response.html),
    - 2) par lot de soumission [PDSm_FindListsResponse](StructureDefinition-pdsm-find-lists-response.html)

Au total, les ressources à utiliser dans le cadre de cet Implementation Guide sont :


| **Ressource** | **Profil** | **Description** |
| ----- | ----- | ----- |
| Bundle | PDSm_ComprehensiveProvideDocumentBundle |  Profil défini dans ce volet et héritant de [ComprehensiveProvideDocumentBundle](https://profiles.ihe.net/ITI/MHD/4.0.1/StructureDefinition-IHE.MHD.Comprehensive.ProvideBundle.html) défini dans le profil MHD |
| Bundle | PDSm_FindDocumentReferencesComprehensiveResponse | Profil défini dans ce volet et héritant de [FindDocumentReferencesComprehensiveResponse](https://profiles.ihe.net/ITI/MHD/4.0.1/StructureDefinition-IHE.MHD.FindDocumentReferencesComprehensiveResponseMessage.html) défini dans le profil MHD |
| Bundle | PDSm_FindListsResponse | Profil défini dans ce volet et héritant de [FindListsResponse](https://profiles.ihe.net/ITI/MHD/4.0.1/StructureDefinition-IHE.MHD.FindDocumentListsResponseMessage.html) défini dans le profil MHD |
| Bundle | [ProvideDocumentBundleResponse](https://profiles.ihe.net/ITI/MHD/4.0.1/StructureDefinition-IHE.MHD.ProvideDocumentBundleResponse.html) | Profil défini dans le profil MHD Version 4.0.1 |
| DocumentReference | PDSm_ComprehensiveDocumentReference | Profil défini dans ce volet et héritant de [ComprehensiveDocumentReference](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.Comprehensive.DocumentReference.html) défini dans le profil MHD |
| DocumentReference | PDSm_SimplifiedPublish | Profil défini dans ce volet en s'inspirant du flux simplifié défini dans le profil MHD |
| List | PDSm_SubmissionSetComprehensive | Profil défini dans ce volet et héritant de [SubmissionSetComprehensive](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.Comprehensive.SubmissionSet.html) défini dans le profil MHD |
| List | PDSm_FolderComprehensive | Profil défini dans ce volet et héritant de [FolderComprehensive](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.Comprehensive.Folder.html) défini dans le profil MHD |
| Patient | [FrPatient](https://simplifier.net/packages/hl7-france-fhir.administrative/10.2021.1/files/424014) | Profil français publié par Interop’Santé, spécifiant les identifiants de patient utilisés en France |
| Practitioner | [FrPractitioner](https://simplifier.net/packages/hl7-france-fhir.administrative/10.2021.1/files/424009) | Profil français publié par Interop’Santé, représentant un professionnel. Il contraint les types d'identifiants du professionnel en France. |
| PractitionerRole <br/> PractitionerRole| [PractitionerRoleOrganizationalRoleRASS](https://simplifier.net/packages/ans.annuaire.fhir.r4/0.2.0/files/421732) <br/> [PractitionerRoleProfessionalRoleRASS](https://simplifier.net/packages/ans.annuaire.fhir.r4/0.2.0/files/421688) | Profil de l’annuaire santé représentant la situation d’exercice et l’exercice professionnel |
| Organization | [FrOrganization](https://simplifier.net/packages/hl7-france-fhir.administrative/10.2021.1/files/424025) | Profil français publié par Interop’Santé représentant une personne morale. Ce profil spécifie les types d'identifiants pour l'organisation en France, et ajoute des extensions françaises.|
| Device | - | La ressource du standard est utilisée. Pas de profil spécifique. |
| Binary | - | La ressource du standard est utilisée. Pas de profil spécifique. |
{: .grid }



#### Utilisation de l'IG

Les spécifications d'interopérabilité présentées dans ce volet ne présagent pas des conditions de leur mise en œuvre dans le cadre d'un système d'information partagé. Il appartient à tout responsable de traitement de s'assurer que les services utilisant ces spécifications respectent les cadres et bonnes pratiques applicables à ce genre de service (ex.: cadre juridique, bonnes pratiques de sécurité, ergonomie, accessibilité ...).

### Les flux
Un flux est un échange entre deux systèmes. Des flux ont été identifiés lors d'études métiers et définis, avec partage de ressources FHIR. Pour en savoir davantage, rendez-vous sur la page  <a href="construction_des_flux.html">construction des flux</a>.

| | Nom des flux métiers  | Description |
| ----- | ----- | ----- |
| <a href="st_ajout.html">Les flux 01 et 02 </a> | AjoutLotDocument et ResultatAjoutLotDocument | Pour la demande d’ajout ou de remplacement d’un document au gestionnaire de partage de documents ainsi que le résultat de la demande |
| <a href="st_maj.html">Les flux 03 et 04</a> | MiseAJourMetadonneeFiche et ResultatMAJMetadonneeFiche | Pour la modification de certaines métadonnées du document comme le statut ou le niveau de confidentialité ainsi que le résultat de la demande |
| <a href="st_recherche_lot.html">Les flux 05a et 06a</a> | RechercheDocument et ResultatRechercheDocument | Pour la recherche de lot de documents à l'aide de critères de recherche ainsi que le résultat de la demande |
| <a href="st_recherche_fiche.html">Les flux 05b et 06b</a> | RechercheDocument et ResultatRechercheDocument | Pour la recherche de fiches à l'aide de critères de recherche ainsi que le résultat de la demande |
| <a href="st_consultation.html">Les flux 07 et 08</a> | DemandeConsultationDocument et ResultatDemandeConsultationDocument | Pour demander la consultation d'un ou de plusieurs document ainsi que le résultat de la demande |
| <a href="st_ajout_simplifie.html">Les flux 09 et 10</a> | AjoutSimplifieDocument et ResultatAjoutSimplifieDocument | Pour publier un document de manière simplifiée ainsi que le résultat de la demande |

