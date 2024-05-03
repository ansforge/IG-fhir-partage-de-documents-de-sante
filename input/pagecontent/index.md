<p style="padding: 5px; border-radius: 5px; border: 2px solid maroon; background: #ffffe6; width: 65%">
<b>PDSm Implementation Guide</b><br>
This document presents the technical specifications of the “Partage de documents de santé en mobilité” section.
This is a part of the service layer specifying the terms of document sharing without constraining them. The specifications related to health documents constitute the components of the business layer of CI-SIS.
</p>

<div class="figure">
    <img src="ci-sis-logo.png" alt="CI-SIS" title="Logo du CI-SIS" style="width:100%;">
</div>

### Introduction

Ce document présente les spécifications techniques du volet "Partage de documents de santé en mobilité". Sa production est basée sur les Spécifications Fonctionnelles des Echanges du volet Partage de Documents de Santé et le profil [MHD](https://profiles.ihe.net/ITI/MHD/index.html) (Mobile access to Health Documents) défini par IHE (Integrating the Healthcare Entreprise).

Il s’agit d’un volet de la couche service spécifiant les modalités de partage de documents sans contraindre ces derniers. Les spécifications liées aux documents de santé constituent les volets de la couche métier du CI-SIS.

A noter que la dénomination du volet « Partage de documents de santé en mobilité » n’est pas restrictive. En effet, les standards sous-jacents aux spécifications techniques, par opposition au volet historique « Partage de documents de santé », permettent le déploiement de cas d'usage en mobilité mais ces spécifications peuvent également être mises en œuvre dans d'autres cas d'usage.

### Lectorat cible

Ce document s'adresse aux développeurs des interfaces interopérables des systèmes implémentant le partage de documents de santé ou à toute autre personne intervenant dans le processus de mise en place de ces interfaces.

### Standards utilisés

Ces spécifications techniques se basent sur le standard HL7 FHIR Release 4, et plus particulièrement sur les contraintes spécifiées par le profil MHD. Elles font référence à un certain nombre de ressources du standard ainsi qu'aux spécifications de l'API REST FHIR, basées sur le protocole HTTP. Les syntaxes retenues sont la syntaxe XML et JSON.

Une [mise en équivalence](equivalences.html) entre les acteurs et les flux identifiés dans les SFE-PDS et ceux présentés dans le profil MHD est disponible.
Ce volet met en place l’option du profil MHD « Comprehensive Metadata » qui permet aux acteurs d’échanger des métadonnées complètes répondant aux exigences définies dans le profil XDS.

#### Ressources FHIR et profils

Le tableau ci-après spécifie les profils utilisés pour les ressources et types de données mentionnés dans ce document.

{% sql SELECT '[' || Title ||'](StructureDefinition-' || id || '.html)' as "Titre du profil", Description FROM Resources WHERE Type = 'StructureDefinition' and Description like "Profil%" %}

##### Alimentation utilisant Comprehensive Metadata

Les trois profils utilisés pour le flux d'alimentation sont :  

* 1) la fiche document [PDSm_ComprehensiveDocumentReference](StructureDefinition-pdsm-comprehensive-document-reference.html),
* 2) le classeur [PDSm_FolderComprehensive](StructureDefinition-pdsm-folder-comprehensive.html),
* 3) le Lot de soumission [PDSm_SubmissionSetComprehensive](StructureDefinition-pdsm-submissionset-comprehensive.html)

Ces trois profils doivent être encapsulés dans le [Bundle Comprehensive Provide Document](StructureDefinition-pdsm-comprehensive-provide-document-bundle.html).

<div class="figure" style="width:100%;">
    <p>{% include document-overview-alimentation.svg %}</p>
</div>

#### Alimentation utilisant la publication simplifiée

La publication simplifiée utilise le profil [DocumentReference Simplified Publish](StructureDefinition-pdsm-simplified-publish.html).

#### Recherche par lot ou par fiche

Il existe deux profils Bundle permettent d'encapsuler les résultats de recherche.

* 1) Le bundle permettant de renvoyer les résultats d'une recherche de fiche [PDSm_FindDocumentReferencesComprehensiveResponse](StructureDefinition-pdsm-find-documentreferences-comprehensive-response.html),
* 2) Le bundle permettant de renvoyer les résultats d'une recherche de lot de soumission [PDSm_FindListsResponse](StructureDefinition-pdsm-find-lists-response.html)

#### Utilisation de l'IG

Les spécifications d'interopérabilité présentées dans ce volet ne présagent pas des conditions de leur mise en œuvre dans le cadre d'un système d'information partagé. Il appartient à tout responsable de traitement de s'assurer que les services utilisant ces spécifications respectent les cadres et bonnes pratiques applicables à ce genre de service (ex.: cadre juridique, bonnes pratiques de sécurité, ergonomie, accessibilité ...).

### Les flux

Un flux est un échange entre deux systèmes. Des flux ont été identifiés lors d'études métiers et définis, avec partage de ressources FHIR. Pour en savoir davantage, rendez-vous sur la page <a href="construction_des_flux.html">construction des flux</a>.

| | Nom des flux métiers  | Description |
| ----- | ----- | ----- |
| <a href="st_ajout.html">Les flux 01 et 02 </a> | AjoutLotDocument et ResultatAjoutLotDocument | Pour la demande d’ajout ou de remplacement d’un document au gestionnaire de partage de documents ainsi que le résultat de la demande |
| <a href="st_maj.html">Les flux 03 et 04</a> | MiseAJourMetadonneeFiche et ResultatMAJMetadonneeFiche | Pour la modification de certaines métadonnées du document comme le statut ou le niveau de confidentialité ainsi que le résultat de la demande |
| <a href="st_recherche_lot.html">Les flux 05a et 06a</a> | RechercheDocument et ResultatRechercheDocument | Pour la recherche de lot de documents à l'aide de critères de recherche ainsi que le résultat de la demande |
| <a href="st_recherche_fiche.html">Les flux 05b et 06b</a> | RechercheDocument et ResultatRechercheDocument | Pour la recherche de fiches à l'aide de critères de recherche ainsi que le résultat de la demande |
| <a href="st_consultation.html">Les flux 07 et 08</a> | DemandeConsultationDocument et ResultatDemandeConsultationDocument | Pour demander la consultation d'un ou de plusieurs document ainsi que le résultat de la demande |
| <a href="st_ajout_simplifie.html">Les flux 09 et 10</a> | AjoutSimplifieDocument et ResultatAjoutSimplifieDocument | Pour publier un document de manière simplifiée ainsi que le résultat de la demande |

### Dépendances

Plusieurs spécifications sont utilisées dans le cadre de ce volet :

* Ces spécifications s’appuient sur les profils définis dans le profil IHE MHD relatifs à l’option « Comprehensive Metadata ».

* Le profil FHIR « FrPatient » publié par HL7 France (Interop'Santé) est utilisé dans ce volet. Les présentes spécifications se basent sur les profils du package hl7.fhir.fr.core.

* Dans le cadre de l’annuaire santé, l’ANS met à disposition un service national de publication des données des professionnels et des structures au format FHIR; les profils de l’annuaire santé, à savoir « AsPractitionerRoleProfile », « AsPractitionerProfile » et « AsOrganizationProfile » sont utilisés.

* Des ressources standards (Device, Binary) pourront également être utilisées pour compléter les profils définis.

{% include dependency-table.xhtml %}
