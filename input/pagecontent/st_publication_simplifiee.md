Ce flux permet la publication simplifiée d'un document en respectant la requête de la transaction IHE "Simplified Publish [ITI-105]" du profil MHD.

### Flux 09 : publication simplifiée d’un document

Ce flux correspond à une interaction « CREATE » où le créateur de document va émettre une requête HTTP POST dont le corps contient une ressource de type DocumentReference. Un profil spécifique héritant du profil IHE MHD « SimplifiedPublish.DocumentReference » est créé pour ce volet et nommé PDSm_SimplifiedDocumentReference.

Dans le cas d’un dépôt d’un nouveau document, aucune contrainte supplémentaire ne s’applique.

Dans le cas d’une demande de remplacement d’un document existant, l’élément `DocumentReference.relatesTo` doit être renseigné afin d’indiquer le lien avec le document remplacé :

* `relatesTo.code` = `replaces`
* `relatesTo.target` référence le DocumentReference existant, conforme au profil PDSm_SimplifiedPublish, correspondant au document remplacé.

Conformément à la transaction IHE MHD « Simplified Publish [ITI-105] », le gestionnaire de partage de documents fait alors passer le statut du DocumentReference remplacé à « superseded ». Si le gestionnaire de partage de documents ne supporte pas ce type de relation, il retourne un avertissement (warning) plutôt qu’une erreur, conformément au profil MHD.

Les ressources référencées à partir de ce profil (ex : PractitionerRole, via l’attribut PDSm_SimplifiedDocumentReference.author) peuvent être  :

* Logiques, via le champ identifier
* Littérales,
  * Avec une URL absolue ou relative si la ressource référencée est déjà existante au niveau du système cible.
  * Avec une référence vers un fragment interne (via l’attribut contained). L’élément DocumentReference.contained [0..*] peut contenir l’ensemble des ressources référencées, à l’exception du patient référencé par `subject` (voir ci-dessous).

#### Identification du patient

Conformément à IHE MHD (section [2:3.105.4.1.2.2 Patient Identity](https://profiles.ihe.net/ITI/MHD/ITI-105.html#231054122-patient-identity) de la transaction ITI-105), deux éléments portent l'identité du patient :

* `DocumentReference.subject` identifie le patient titulaire du dossier dans le système cible : c'est cet élément qui fait foi pour le rattachement du document. Il ne pointe pas une ressource contenue (contained). Lorsque le patient dispose d'une identité INS qualifiée, le matricule INS est porté par `subject.identifier` (référence logique). MHD admet explicitement une référence logique fondée sur un identifiant commun, tel qu'un identifiant national individuel. La référence peut aussi pointer une ressource Patient déjà connue du système cible.
* `DocumentReference.context.sourcePatientInfo` porte l'identité du patient telle que connue du producteur du document. Il est obligatoire lorsque `subject.identifier` porte un matricule INS. Lorsqu'il est fourni, il référence une ressource Patient contenue (contained), conforme au profil FR Core Patient INS lorsque l'identité est qualifiée (matricule INS et traits INSi), ou FR Core Patient sinon.

En complément de MHD, qui n'impose pas de concordance entre ces deux éléments, PDSm exige que, lorsque `subject.identifier` porte un matricule INS, `context.sourcePatientInfo` soit fourni et que la ressource Patient contenue porte le statut d'identité `VALI` (extension FR Core `identityReliability`) et le même matricule INS (invariant `constr-sp-subject-sourcePatientInfo-ins`). Conformément au Guide d'implémentation de l'INS (§2.2.2), la présence du matricule INS associée au statut `VALI` exprime une identité qualifiée. Cette exigence découle du [Référentiel INS](https://esante.gouv.fr/sites/default/files/media_entity/documents/referentiel_identite_national_de_sante.pdf) et de son [Guide d'implémentation](https://esante.gouv.fr/sites/default/files/media_entity/documents/ins-guide-implementation.pdf) : l'INS est constituée du matricule INS, de son OID et des cinq traits de référence (Guide §1.1), qui doivent être transmis ensemble (Référentiel EXI 15, Guide EXI DIF 03) et accompagnés d'informations confirmant leur qualification (Référentiel EXI 18).

Le tableau suivant illustre l'application de l'invariant :

| Cas | `subject` | `context.sourcePatientInfo` | Résultat |
| --- | --- | --- | --- |
| Identité non qualifiée | Référence ou identifiant autre qu'un matricule INS | Facultatif ; Patient contenu conforme à FR Core Patient | Invariant non applicable : conforme |
| Identité INS qualifiée, patient connu ou non du système cible | `identifier` portant un matricule INS | Patient contenu portant le statut d'identité `VALI` et le même matricule INS (même OID, même valeur) | Conforme |
| Identité INS qualifiée, sans `sourcePatientInfo` | `identifier` portant un matricule INS | Absent | Non conforme : rejet |
| Matricules discordants | `identifier` portant un matricule INS | Patient contenu portant un autre matricule ou un autre OID (par exemple NIA d'un côté, NIR de l'autre) | Non conforme : rejet |
| Patient contenu sans matricule INS | `identifier` portant un matricule INS | Patient contenu sans matricule INS | Non conforme : rejet |
| Identité non déclarée validée | `identifier` portant un matricule INS | Patient contenu portant le même matricule INS, sans statut d'identité `VALI` | Non conforme : rejet |

L'invariant ne vérifie que la cohérence interne du DocumentReference : il ne tient pas compte de l'existence du patient dans le système cible (voir ci-dessous).

Le producteur du document est responsable de la cohérence de ces deux identités. En cas de discordance, le système cible doit rejeter la transaction en retournant une ressource OperationOutcome décrivant l'erreur, et ne doit pas tenter de la corriger. Il appartient au producteur de résoudre la discordance, conformément à ses procédures d'identitovigilance, avant de soumettre à nouveau le document.

La règle de rejet ci-dessus porte uniquement sur la cohérence interne de la transaction. Le rattachement du document à un patient du système cible relève des procédures d'identitovigilance de celui-ci, conformément au [Guide d'implémentation de l'INS](https://esante.gouv.fr/sites/default/files/media_entity/documents/ins-guide-implementation.pdf) : le statut « Identité qualifiée » se transmet tel quel au sein d'un même domaine d'identification (EXI ID 30) ; entre deux domaines, il ne se transmet pas sans contrat de confiance, et le système cible procède alors au rapprochement et, le cas échéant, à la requalification de l'identité (EXI ID 31). Le traitement d'un patient inconnu du système cible (création de l'identité ou rejet de la transaction) relève de la politique de celui-ci. Le passage d'un matricule NIA à un matricule NIR est détecté par le producteur au moyen de l'opération de vérification INSi (EXI VER 02) ; le producteur transmet toujours le matricule INS courant.

### Flux 10 : résultat de la publication simplifiée d’un document

Le résultat de la publication simplifiée d’un document doit être conforme au résultat de l’interaction HTTP « CREATE » de FHIR .
En cas de succès, le serveur retourne :

* Le HTTP Code 201 Created
* Un body contenant la ressource créée avec les attributs ; id, lastUpdated et versionId mis à jour

En cas d’erreur, le serveur retourne :

* un HTTP Code statut (400 Bad Request, 404 Not Found, 422 Unprocessable Entity, …)
* En cas d’erreur 422, le corps de la réponse devrait contenir la ressource OperationOutcome détaillant l’erreur.

Dans le cas d’une demande de remplacement, si le gestionnaire de partage de documents ne supporte pas la relation `relatesTo` demandée, la réponse reste un succès (HTTP 201 Created) mais le corps de la réponse contient un avertissement (OperationOutcome de sévérité `warning`), conformément au profil MHD [ITI-105].
