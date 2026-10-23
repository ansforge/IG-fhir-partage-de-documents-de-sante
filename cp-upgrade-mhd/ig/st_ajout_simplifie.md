# Ajout simplifié d'un document (ITI-105) - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Spécifications techniques - vue d'ensemble**](construction_des_flux.md)
* **Ajout simplifié d'un document (ITI-105)**

## Ajout simplifié d'un document (ITI-105)

Ce flux permet l'ajout simplifié d'un document en respectant la requête de la transaction IHE "Simplified Publish [ITI-105]" du profil MHD.

### Flux 09 : ajout simplifié d’un document

Ce flux correspond à une interaction « CREATE » où le créateur de document va émettre une requête HTTP POST dont le corps contient une ressource de type DocumentReference. Un profil spécifique héritant du profil IHE MHD « SimplifiedPublish.DocumentReference » est créé pour ce volet et nommé PDSm_SimplifiedDocumentReference.

Les ressources référencées à partir de ce profil (ex : Patient, via l’attribut PDSm_SimplifiedDocumentReference.subject) peuvent être :

* Logiques, via le champ identifier
* Littérales, 
* Avec une URL absolue ou relative si la ressource référencée est déjà existante au niveau du système cible.
* Avec une référence vers un fragment interne (via l’attribut contained). L’élément DocumentReference.contained [0..*] peut contenir l’ensemble des ressources référencées.
 

### Flux 10 : résultat de l’ajout simplifié d’un document

Le résultat de l’ajout simplifié d’un document doit être conforme au résultat de l’interaction HTTP « CREATE » de FHIR . En cas de succès, le serveur retourne :

* Le HTTP Code 201 Created
* Un body contenant la ressource créée avec les attributs ; id, lastUpdated et versionId mis à jour

En cas d’erreur, le serveur retourne :

* un HTTP Code statut (400 Bad Request, 404 Not Found, 422 Unprocessable Entity, …)
* En cas d’erreur 422, le corps de la réponse devrait contenir la ressource OperationOutcome détaillant l’erreur.

