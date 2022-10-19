### Flux 09 : ajout simplifié d’un document

Ce flux est utilisé pour publier un document ainsi que ses métadonnées au sein d’une ressource DocumentReference.
Le système cible qui reçoit le DocumentReference simplifié doit valider la ressource, extraire le document de DocumentReference.content.attachment.data, créer une ressource Binary et SubmissionSet dérivé du DocumentReference . 

Ce flux d’ajout simplifié d’un document se base sur la requête de la transaction IHE "Simplified Publish [ITI-105]" du profil MHD lorsque celui-ci sera publié. 
Concrètement, c’est une interaction « CREATE »  de l’API REST FHIR où le créateur de document va émettre une requête HTTP POST dont le body contient une ressource de type DocumentReference. Un profil spécifique inspiré du profil IHE MHD en version build au 03.10.22 « SimplifiedPublish.DocumentReference » est créé pour ce volet et nommé [PDSm_SimplifiedDocumentReference](StructureDefinition-PDSmSimplifiedDocumentReference.html).
Les références de ce flux tel que PDSm_SimplifiedDocumentReference.subject peuvent lier des ressources contenues, être des ressources logiques (par identifiant métier) ou bien référencer des ressources déjà postées .


### Flux 10 : résultat de l’ajout simplifié d’un document

Ce flux retourne le résultat de demande d’ajout simplifié d’un document. La demande peut être un succès ou un échec. 
Il doit être indiqué dans la réponse, le statut (succès ou échec) de la requête. Le contenu qui vient d’être créé peut aussi être retourné


Le résultat de l’ajout simplifié d’un document doit être conforme au résultat de l’interaction HTTP « CREATE » de FHIR .
En cas de succès, le serveur retourne :
-	Le HTTP Code 201 Created
-	Un body contenant la ressource créée avec l’id, le lastUpdated et le versionId mis à jour
En cas d’erreur, le serveur retourne :
-	un HTTP Code statut (400 Bad Request, 404 Not Found, 422 Unprocessable Entity)
-	Un body contenant la ressource OperationOutcome exprimant l’erreur détaillée.
