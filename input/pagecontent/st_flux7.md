### Flux 07 : demande de consultation de documents
Il s'agit du flux intervenant lors de la demande de consultation d'un document par le consommateur de documents au gestionnaire de partage de documents.

La demande de consultation utilise l’url du document. Elle est récupérée depuis la fiche : [DocumentReference.content.attachment.url](StructureDefinition-PDSmComprehensiveDocumentReference-definitions.html#DocumentReference.content.attachment.url).

### Construction du flux : résultat de la demande de consultation de documents

Ce flux se base sur la requête de la transaction IHE "Retrieve Document [ITI-68](https://profiles.ihe.net/ITI/MHD/ITI-68.html)" du profil MHD.

Il s'agit d'une requête HTTP GET reposant sur l’interaction « read » envoyé par le consommateur de documents au gestionnaire de partage de documents pour demander à consulter un document.

La demande du consommateur de documents consiste à récupérer le contenu du document référencé par un DocumentReference.content.attachment.url.

Le seul MIME type que l’on puisse s’assurer de retourner est le MIME Type indiqué dans le DocumentReference.content.attachment.contentType.