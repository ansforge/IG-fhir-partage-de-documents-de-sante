# Ajout d'un lot de documents (ITI-65) - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Spécifications techniques - vue d'ensemble**](construction_des_flux.md)
* **Ajout d'un lot de documents (ITI-65)**

## Ajout d'un lot de documents (ITI-65)

Ce flux permet l’ajout ou le remplacement d’un document au dossier patient. Cette demande de modification est faite par le producteur de documents.

Ces flux se basent sur la requête et la réponse de la transaction IHE "Provide Document Bundle [ITI-65](https://profiles.ihe.net/ITI/MHD/ITI-65.html)" du profil MHD.

### Flux 01 : Ajout d’un lot de documents

La première étape de la construction du flux 01 de la demande de modification du dossier patient consiste à organiser son contenu dans une ressource Bundle. Un profil spécifique dérivé du profil IHE MHD v4.0.1 « ComprehensiveProvideDocumentBundle » est créé pour ce volet et nommé [PDSm Comprehensive Provide Document Bundle](StructureDefinition-pdsm-comprehensive-provide-document-bundle.md).

Le flux doit contenir :

* une ressource de type « List » représentant le lot de soumission (profil [PDSm_SubmissionsSetComprehensive](StructureDefinition-pdsm-submissionset-comprehensive.md))
* une à plusieurs ressources de type « DocumentReference », représentant les fiches de documents (profil [PDSm_ComprehensiveDocumentReference](StructureDefinition-pdsm-comprehensive-document-reference.md)),
* zero à plusieurs ressources « Binary » représentant les documents envoyés dans le flux (ressource [Binary](https://www.hl7.org/fhir/binary.html)).,
* zero à plusieurs ressources de type « List » représentant les classeurs (profil PDSm_FolderComprehensive).

Dans le cas d’un dépôt d’un nouveau document, l’élément `DocumentReference.content.attachment.url` doit pointer vers une ressource Binary, représentant le document, présente dans le flux.

Dans le cas d’une demande de mise à jour d’un document par remplacement, l’élément DocumentReference.relatesTo doit être renseigné afin d’indiquer le lien avec un DocumentReference existant et de préciser la nature de la mise à jour. L’élément `DocumentReference.content.attachment.url` doit pointer vers une ressource Binary, représentant le document qui remplace l’ancien, présente dans le flux.

Dans le cas d’une mise à jour d’un classeur, comme `List.status` ou `List.entry` pour reclasser des documents, une nouvelle version de la ressource List est envoyée.

Le corps de la requête est une ressource "Bundle" de type "transaction" encapsulant toutes les ressources listées précédemment. Cet objet de type JSON ou XML sera envoyé dans le contenu de la requête HTTP POST.

A la réception de la demande, le gestionnaire de partage de documents doit valider les ressources et répondre avec un HTTP Code statut

### Flux 02 : Résultat de l'ajout d'un lot de documents

Ce flux retourne le résultat de demande de modification du dossier. La demande peut être un succès ou un échec.

Il doit être indiqué dans la réponse, le statut (succès ou échec) de chaque élément mentionné dans la requête. Le contenu qui a été créé ou modifié est aussi retourné.

Le gestionnaire de partage de documents de santé retourne un "HTTP Status code" approprié au résultat de la demande comme indiqué dans la spécification du profil MHD. Le corps de la réponse doit être un Bundle de type transaction-response avec un élément entry pour chaque ressource reçue dans le Bundle de la requête, dans le même ordre, avec le résultat du traitement de l'élément. Le corps de la réponse doit être conforme au profil [ProvideDocumentBundleResponse](/IHE.MHD.ProvideDocumentBundleResponse) ([exemple de contenu d'un payload](Bundle-a9c10f8a-882d-4000-a280-7150e0aeb478.json.md)).

Ce flux sert à communiquer un succès ou un échec. Un succès n'est indiqué que lorsque le ou les documents sont reçus, complètement traités et conservés selon les besoins de la configuration du gestionnaire de partage de documents.

Les messages de warning concernant le traitement des associations entre fiches, l’élément DocumentReference.relatesTo, ou le traitement des classeurs sont définis par le profil MHD.

