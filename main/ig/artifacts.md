# Artifacts Summary - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Behavior: Capability Statements 

The following artifacts define the specific capabilities that different types of systems are expected to have in order to comply with this implementation guide. Systems conforming to this implementation guide are expected to declare conformance to one or more of the following capability statements.

| | |
| :--- | :--- |
| [CI-SIS Partage-De-Documents-De-Sante - ConsommateurDeDocuments](CapabilityStatement-PDSm-ConsommateurDeDocuments.md) | Il s’agit d’un système d’information ou d’un composant de système d’information qui recherche des documents selon certains critères, et qui peut consulter les documents qui l’intéressent. |
| [CI-SIS Partage-De-Documents-De-Sante - GestionnaireDePartageDeDocuments](CapabilityStatement-PDSm-GestionnaireDePartageDeDocuments.md) | Il s’agit d’un système d’information ou d’un composant d'un système d’information qui stocke, classe et archive les documents d’un dossier patient. |
| [CI-SIS Partage-De-Documents-De-Sante - ProducteurDeDocuments](CapabilityStatement-PDSm-ProducteurDeDocuments.md) | Il s’agit d’un système d’information ou d’un composant de système d’information qui envoie au gestionnaire de partage de documents une demande d’ajout de nouveaux documents et/ou des nouvelles versions de documents. Ce système fournit également les modifications des métadonnées du document. |

### Behavior: Search Parameters 

These define the properties by which a RESTful server can be searched. They can also be used for sorting and including related resources.

| | |
| :--- | :--- |
| [PDSm-DocumentReference-period-end](SearchParameter-PDSm-DocumentReference-period-end.md) | Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément context.period.end correspondant à lobjet dateFinActe |
| [PDSm-DocumentReference-period-start](SearchParameter-PDSm-DocumentReference-period-start.md) | Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément context.period.start correspondant à lobjet dateDebutActe |
| [PDSm-List-PatientAsSource](SearchParameter-PDSm-List-PatientAsSource.md) | Paramètre de recherche chaîné créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément source:Patient.given et source:Patient.family |
| [PDSm-List-PatientAsSubject](SearchParameter-PDSm-List-PatientAsSubject.md) | Paramètre de recherche chaîné créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément subject:Patient.identifier |
| [PDSm-List-PractitionerRoleAsSource](SearchParameter-PDSm-List-PractitionerRoleAsSource.md) | Paramètre de recherche chaîné créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément source:PractitionerRole.practitioner:Practitioner.given et source:PractitionerRole.practitioner:Practitioner.family |
| [PDSm-List-authorOrg](SearchParameter-PDSm-List-authorOrg.md) | Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément sourceId |
| [PDSm-isArchived](SearchParameter-PDSm-isArchived.md) | Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère derecherche l'élément isArchived qui permet distinguer les lots de soumission et les fiches archivés des actives. |

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
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

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [PDSm_intendedRecipient](StructureDefinition-pdsm-ext-intended-recipient.md) | Représente le destinataire du lot de soumission |
| [PDSm_isArchived](StructureDefinition-pdsm-ext-is-archived.md) | Extension définie par le volet ANS "Volet Partage de documents de santé en mobilité" sur les ressources List et DocumentReference pour distinguer les lots de soumission et les fiches archivés des actives. |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| | |
| :--- | :--- |
| [Exemple de Classeur PDSm](List-ExampleFolder.md) | Exemple d’une instance conforme au profil PDSm_FolderComprehensive regroupant des fiches de documents. |
| [Exemple de DocumentReference pour PDSm](DocumentReference-exemple-pdsm-documentreference.md) | Exemple illustratif d’un DocumentReference conforme au profil PDSm_ComprehensiveDocumentReference. |
| [Exemple de bundle de type transaction-response du flux 2](Bundle-a9c10f8a-882d-4000-a280-7150e0aeb478.md) |  |
| [Exemple de lot de soumission PDSm](List-ExampleSubmissionSet.md) | Exemple conforme au profil PDSm_SubmissionSetComprehensive. |
| [Exemple de publication simplifiée PDSm](DocumentReference-PDSmSimplifiedExample.md) | Note d'évolution suite à une consultation de suivi. |
| [Exemple de ressource Binary - Fichier PDF](Binary-6789.md) |  |
| [fr-patient-123](Patient-fr-patient-123.md) |  |
| [org-example](Organization-org-example.md) |  |

