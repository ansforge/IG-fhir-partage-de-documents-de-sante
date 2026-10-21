Ce flux permet la publication simplifiée d'un document en respectant la requête de la transaction IHE "Simplified Publish [ITI-105]" du profil MHD.

### Flux 09 : publication simplifiée d’un document

Ce flux correspond à une interaction « CREATE » où le créateur de document va émettre une requête HTTP POST dont le corps contient une ressource de type DocumentReference. Un profil spécifique héritant du profil IHE MHD « SimplifiedPublish.DocumentReference » est créé pour ce volet et nommé PDSm_SimplifiedPublish.

Dans le cas d’un dépôt d’un nouveau document, aucune contrainte supplémentaire liée au remplacement ne s’applique. Les exigences d'identification du patient (voir ci-dessous) s'appliquent dans tous les cas.

Dans le cas d’une demande de remplacement d’un document existant, l’élément `DocumentReference.relatesTo` doit être renseigné afin d’indiquer le lien avec le document remplacé :

* `relatesTo.code` = `replaces`
* `relatesTo.target` référence le DocumentReference existant, conforme au profil PDSm_SimplifiedPublish, correspondant au document remplacé.

Conformément à la transaction IHE MHD « Simplified Publish [ITI-105] », le gestionnaire de partage de documents fait alors passer le statut du DocumentReference remplacé à « superseded ». Si le gestionnaire de partage de documents ne supporte pas ce type de relation, il retourne un avertissement (warning) plutôt qu’une erreur, conformément au profil MHD.

Les ressources référencées à partir de ce profil (ex : PractitionerRole, via l’attribut PDSm_SimplifiedPublish.author) peuvent être  :

* Logiques, via le champ identifier
* Littérales,
  * Avec une URL absolue ou relative si la ressource référencée est déjà existante au niveau du système cible.
  * Avec une référence vers un fragment interne (via l’attribut contained). L’élément DocumentReference.contained [0..*] peut contenir l’ensemble des ressources référencées, à l’exception du patient référencé par `subject` (voir ci-dessous).

#### Identification du patient

Conformément à IHE MHD (section [2:3.105.4.1.2.2 Patient Identity](https://profiles.ihe.net/ITI/MHD/ITI-105.html#231054122-patient-identity) de la transaction ITI-105), deux éléments portent l'identité du patient :

* `DocumentReference.subject` identifie le patient titulaire du dossier dans le système cible : c'est cet élément qui fait foi pour le rattachement du document. Il ne pointe pas une ressource contenue (contained). Lorsque le patient dispose d'une identité INS qualifiée, le matricule INS doit être porté par `subject.identifier` (référence logique). MHD admet explicitement une référence logique fondée sur un identifiant commun, tel qu'un identifiant national individuel. `subject.reference` peut en complément pointer une ressource Patient déjà connue du système cible. En l'absence d'identité INS qualifiée, `subject` référence le patient par un autre moyen (ressource Patient connue du système cible ou autre identifiant).
* `DocumentReference.context.sourcePatientInfo` porte l'identité du patient telle que connue du producteur du document. Il est obligatoire lorsque `subject.identifier` porte un matricule INS. Lorsqu'il est fourni, il référence une ressource Patient contenue (contained), conforme au profil FR Core Patient INS lorsque l'identité est qualifiée (matricule INS et traits de référence), ou FR Core Patient sinon.

Le matricule INS et les traits de référence sont nécessairement portés par deux éléments distincts : un élément `Reference` FHIR ne peut porter que l'identifiant du patient, et non ses traits, et MHD prévoit que `subject` référence une ressource Patient hébergée sur un serveur commun, ou, à défaut, admet une référence logique fondée sur un identifiant commun tel qu'un identifiant national : une ressource contenue ne correspond à aucun de ces deux cas. MHD n'impose pas de concordance entre ces deux éléments. PDSm les relie afin que la transaction transmette une INS complète :

* lorsque `subject.identifier` porte un matricule INS, `context.sourcePatientInfo` doit être fourni et la ressource Patient contenue doit porter le statut d'identité `VALI` (extension FR Core `identityReliability`) et le même matricule INS (invariant `constr-sp-subject-sourcePatientInfo-ins`) ;
* réciproquement, lorsque la ressource Patient contenue porte un matricule INS et le statut d'identité `VALI`, `subject.identifier` doit porter un matricule INS (invariant `constr-sp-ins-qualifiee-subject`).

Ces exigences découlent du [Référentiel INS](https://esante.gouv.fr/sites/default/files/media_entity/documents/referentiel_identite_national_de_sante.pdf) (v2.1, décembre 2024) et de son [Guide d'implémentation](https://esante.gouv.fr/sites/default/files/media_entity/documents/ins-guide-implementation.pdf) (v3.0, décembre 2024) :

* l'INS est constituée du matricule INS, de son OID et des cinq traits stricts de référence : nom de naissance, liste des prénoms de naissance, date de naissance, sexe, code INSEE du lieu de naissance (Guide §1.1) ;
* le matricule INS et son OID ne sont transmis que si l'identité est qualifiée ; à défaut, seuls les traits sont transmis (Référentiel EXI 12, Guide EXI ID 29) ;
* les traits doivent être transmis avec le matricule INS et son OID (Référentiel EXI 15) et apparaître dans les flux de données en sortie (Guide EXI DIF 03) ;
* le matricule INS et les traits doivent être accompagnés d'informations confirmant leur qualification (Référentiel EXI 18) ; un logiciel non référentiel d'identités déduit le statut « Identité qualifiée » de la présence du matricule INS et de son OID associée au statut « Identité validée » (`VALI`) (Guide §2.2.2).

Le tableau suivant illustre l'application de ces invariants :

| Cas | `subject` | `context.sourcePatientInfo` | Résultat |
| --- | --- | --- | --- |
| Identité non qualifiée | Référence ou identifiant autre qu'un matricule INS | Facultatif ; Patient contenu conforme à FR Core Patient, sans statut `VALI` | Invariants non applicables : conforme |
| Identité INS qualifiée non portée par `subject` | Référence ou identifiant autre qu'un matricule INS | Patient contenu portant un matricule INS et le statut d'identité `VALI` | Non conforme : rejet |
| Identité INS qualifiée, patient connu ou non du système cible | `identifier` portant un matricule INS | Patient contenu portant le statut d'identité `VALI` et le même matricule INS (même OID, même valeur) | Conforme |
| Identité INS qualifiée, sans `sourcePatientInfo` | `identifier` portant un matricule INS | Absent | Non conforme : rejet |
| Matricules discordants | `identifier` portant un matricule INS | Patient contenu portant un autre matricule ou un autre OID (par exemple NIA d'un côté, NIR de l'autre) | Non conforme : rejet |
| Patient contenu sans matricule INS | `identifier` portant un matricule INS | Patient contenu sans matricule INS | Non conforme : rejet |
| Identité non déclarée validée | `identifier` portant un matricule INS | Patient contenu portant le même matricule INS, sans statut d'identité `VALI` | Non conforme : rejet |

Le producteur du document est responsable de la cohérence de ces deux identités. En cas de non-respect de ces exigences, le système cible doit rejeter la transaction (voir flux 10) et ne doit pas tenter de la corriger. Il appartient au producteur de corriger l'identité transmise, conformément à ses procédures d'identitovigilance, avant de soumettre à nouveau le document.

Ces invariants et la règle de rejet portent uniquement sur la cohérence interne de la transaction : ils ne tiennent pas compte de l'existence du patient dans le système cible. Le rattachement du document à un patient du système cible relève des procédures d'identitovigilance de celui-ci, conformément au [Guide d'implémentation de l'INS](https://esante.gouv.fr/sites/default/files/media_entity/documents/ins-guide-implementation.pdf) : le statut « Identité qualifiée » se transmet tel quel au sein d'un même domaine d'identification (EXI ID 30) ; entre deux domaines, il ne se transmet pas sans contrat de confiance, et le système cible procède alors au rapprochement et, le cas échéant, à la requalification de l'identité (EXI ID 31). Le traitement d'un patient inconnu du système cible (création de l'identité ou rejet de la transaction) relève de la politique de celui-ci. Le passage d'un matricule NIA à un matricule NIR est détecté par le producteur au moyen de l'opération de vérification INSi (EXI VER 02) ; le producteur transmet toujours le matricule INS courant.

### Flux 10 : résultat de la publication simplifiée d’un document

Le résultat de la publication simplifiée d’un document doit être conforme au résultat de l’interaction HTTP « CREATE » de FHIR .
En cas de succès, le serveur retourne :

* Le HTTP Code 201 Created
* Un body contenant la ressource créée avec les attributs ; id, lastUpdated et versionId mis à jour

En cas d’erreur, le serveur retourne :

* un HTTP Code statut (400 Bad Request, 404 Not Found, 422 Unprocessable Entity, …)
* En cas d’erreur 422, le corps de la réponse devrait contenir la ressource OperationOutcome détaillant l’erreur.

En cas de non-respect des exigences d'identification du patient (voir flux 09), le serveur retourne le code HTTP 422 Unprocessable Entity et le corps de la réponse doit contenir une ressource OperationOutcome décrivant l'erreur.

Dans le cas d’une demande de remplacement, si le gestionnaire de partage de documents ne supporte pas la relation `relatesTo` demandée, la réponse reste un succès (HTTP 201 Created) mais le corps de la réponse contient un avertissement (OperationOutcome de sévérité `warning`), conformément au profil MHD [ITI-105].
