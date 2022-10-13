### Flux 10 : résultat de l’ajout simplifié d’un document

Ce flux retourne le résultat de demande d’ajout simplifié d’un document. La demande peut être un succès ou un échec. 
Il doit être indiqué dans la réponse, le statut (succès ou échec) de la requête. Le contenu qui vient d’être créé peut aussi être retourné



### Construction du flux 
Le résultat de l’ajout simplifié d’un document doit être conforme au résultat de l’interaction HTTP « CREATE » de FHIR .
En cas de succès, le serveur retourne :
-	Le HTTP Code 201 Created
-	Un body contenant la ressource créée avec l’id, le lastUpdated et le versionId mis à jour
En cas d’erreur, le serveur retourne :
-	un HTTP Code statut (400 Bad Request, 404 Not Found, 422 Unprocessable Entity)
-	Un body contenant la ressource OperationOutcome exprimant l’erreur détaillée.
