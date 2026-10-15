# Publication simplifiée d'un document (ITI-105) - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

## Publication simplifiée d'un document (ITI-105)

Ce flux permet la publication simplifiée d'un document en respectant la requête de la transaction IHE "Simplified Publish [ITI-105]" du profil MHD.

### Flux 09 : publication simplifiée d’un document

Ce flux correspond à une interaction « CREATE » où le créateur de document va émettre une requête HTTP POST dont le corps contient une ressource de type DocumentReference. Un profil spécifique héritant du profil IHE MHD « SimplifiedPublish.DocumentReference » est créé pour ce volet et nommé PDSm_SimplifiedDocumentReference.

Dans le cas d’un dépôt d’un nouveau document, aucune contrainte supplémentaire ne s’applique.

Dans le cas d’une demande de remplacement d’un document existant, l’élément `DocumentReference.relatesTo` doit être renseigné afin d’indiquer le lien avec le document remplacé :

* `relatesTo.code` = `replaces`
* `relatesTo.target` référence le DocumentReference existant, conforme au profil PDSm_SimplifiedPublish, correspondant au document remplacé.

Conformément à la transaction IHE MHD « Simplified Publish [ITI-105] », le gestionnaire de partage de documents fait alors passer le statut du DocumentReference remplacé à « superseded ». Si le gestionnaire de partage de documents ne supporte pas ce type de relation, il retourne un avertissement (warning) plutôt qu’une erreur, conformément au profil MHD.

Les ressources référencées à partir de ce profil (ex : PractitionerRole, via l’attribut PDSm_SimplifiedDocumentReference.author) peuvent être :

* Logiques, via le champ identifier
* Littérales, 
* Avec une URL absolue ou relative si la ressource référencée est déjà existante au niveau du système cible.
* Avec une référence vers un fragment interne (via l’attribut contained). L’élément DocumentReference.contained [0..*] peut contenir l’ensemble des ressources référencées, à l’exception du patient référencé par `subject` (voir ci-dessous).
 

#### Identification du patient

Conformément à IHE MHD (section [2:3.105.4.1.2.2 Patient Identity](https://profiles.ihe.net/ITI/MHD/ITI-105.html#231054122-patient-identity) de la transaction ITI-105), deux éléments portent l'identité du patient :

* `DocumentReference.subject` identifie le patient titulaire du dossier dans le système cible : c'est cet élément qui fait foi pour le rattachement du document. Il ne pointe pas une ressource contenue (contained). Lorsque le patient dispose d'une identité INS qualifiée, le matricule INS est porté par `subject.identifier` (référence logique). MHD admet explicitement une référence logique fondée sur un identifiant commun, tel qu'un identifiant national individuel. La référence peut aussi pointer une ressource Patient déjà connue du système cible.
* `DocumentReference.context.sourcePatientInfo` porte l'identité du patient telle que connue du producteur du document. Lorsqu'il est fourni, il référence une ressource Patient contenue (contained), conforme au profil FR Core Patient INS lorsque l'identité est qualifiée (matricule INS et traits INSi), ou FR Core Patient sinon.

En complément de MHD, qui n'impose pas de concordance entre ces deux éléments, PDSm exige que, lorsque `subject.identifier` porte un matricule INS et que `context.sourcePatientInfo` est fourni, la ressource Patient contenue porte le même matricule INS (invariant `constr-sp-subject-sourcePatientInfo-ins`).

Le producteur du document est responsable de la cohérence de ces deux identités. En cas de discordance, le système cible doit rejeter la transaction en retournant une ressource OperationOutcome décrivant l'erreur, et ne doit pas tenter de la corriger. Il appartient au producteur de résoudre la discordance, conformément à ses procédures d'identitovigilance, avant de soumettre à nouveau le document.

### Flux 10 : résultat de la publication simplifiée d’un document

Le résultat de la publication simplifiée d’un document doit être conforme au résultat de l’interaction HTTP « CREATE » de FHIR . En cas de succès, le serveur retourne :

* Le HTTP Code 201 Created
* Un body contenant la ressource créée avec les attributs ; id, lastUpdated et versionId mis à jour

En cas d’erreur, le serveur retourne :

* un HTTP Code statut (400 Bad Request, 404 Not Found, 422 Unprocessable Entity, …)
* En cas d’erreur 422, le corps de la réponse devrait contenir la ressource OperationOutcome détaillant l’erreur.

Dans le cas d’une demande de remplacement, si le gestionnaire de partage de documents ne supporte pas la relation `relatesTo` demandée, la réponse reste un succès (HTTP 201 Created) mais le corps de la réponse contient un avertissement (OperationOutcome de sévérité `warning`), conformément au profil MHD [ITI-105].

