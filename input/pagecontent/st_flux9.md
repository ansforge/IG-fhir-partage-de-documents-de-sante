### Flux 09 : ajout simplifié d’un document

Ce flux est utilisé pour publier un document ainsi que ses métadonnées au sein d’une ressource DocumentReference.
Le système cible qui reçoit le DocumentReference simplifié doit valider la ressource, extraire le document de DocumentReference.content.attachment.data, créer une ressource Binary et SubmissionSet dérivé du DocumentReference . 


### Construction du flux

Ce flux d’ajout simplifié d’un document se base sur la requête de la transaction IHE "Simplified Publish [ITI-105]" du profil MHD lorsque celui-ci sera publié. 
Concrètement, c’est une interaction « CREATE »  de l’API REST FHIR où le créateur de document va émettre une requête HTTP POST dont le body contient une ressource de type DocumentReference. Un profil spécifique inspiré du profil IHE MHD en version build au 03.10.22 « SimplifiedPublish.DocumentReference » est créé pour ce volet et nommé [PDSm_SimplifiedDocumentReference](StructureDefinition-PDSmSimplifiedDocumentReference.html).
Les références de ce flux tel que PDSm_SimplifiedDocumentReference.subject peuvent lier des ressources contenues, être des ressources logiques (par identifiant métier) ou bien référencer des ressources déjà postées .
