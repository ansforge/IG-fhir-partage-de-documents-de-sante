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

* `DocumentReference.subject` identifie le patient titulaire du dossier dans le système cible : c'est cet élément qui fait foi pour le rattachement du document. Il porte dans `subject.identifier` l'identifiant du patient dans le domaine d'identification du système cible. Il correspond à la donnée fonctionnelle `idPatient` (« identifiant du patient »), commune à ce volet et au [volet Partage de documents de santé](https://esante.gouv.fr/sites/default/files/media/document/CI-SIS_SERVICE_VOLET-PARTAGE-DOCUMENTS-SANTE_V1.16.5.pdf) du CI-SIS. Ce dernier, qui contraint XDS pour le contexte français, restreint la métadonnée `patientId` au matricule INS (§3.4.34) ; PDSm admet en outre un identifiant local pour les échanges au sein d'un même domaine d'identification. MHD admet explicitement une référence logique fondée sur un identifiant commun, tel qu'un identifiant national individuel :
  * matricule INS (NIR ou NIA) lorsque l'identité du patient est qualifiée et que le partage sort du domaine d'identification du producteur ;
  * identifiant local du patient (ex : IPP) lorsque le producteur et le système cible partagent un même domaine d'identification, notamment pour les échanges intra-établissement, où l'INS n'est pas nécessairement connu ou utilisé.

  `subject.reference` peut en complément pointer une ressource Patient déjà connue du système cible. `subject` ne pointe pas une ressource contenue (contained).
* `DocumentReference.context.sourcePatientInfo` porte l'identité du patient telle que connue du producteur du document, et regroupe les métadonnées XDS `sourcePatientId` et `sourcePatientInfo` (volet §3.4.42 et §3.4.43). Lorsqu'il est fourni, il référence une ressource Patient contenue (contained), conforme au profil FR Core Patient, qui porte l'identifiant du patient dans le système du producteur (IPP, ou à défaut le matricule INS) et ses traits d'identité. Ces informations ne doivent pas être réutilisées par le système cible pour calculer un identifiant.

Seul `subject` fait l'objet d'un contrôle : comme pour les métadonnées XDS `sourcePatientId` et `sourcePatientInfo`, aucun contrôle de concordance n'est effectué entre `subject` et `context.sourcePatientInfo`. Le producteur est responsable de la cohérence des identités transmises, conformément à ses procédures d'identitovigilance.

Conformément au [Référentiel INS](https://esante.gouv.fr/sites/default/files/media_entity/documents/referentiel_identite_national_de_sante.pdf) (v2.1, décembre 2024, EXI 12) et à son [Guide d'implémentation](https://esante.gouv.fr/sites/default/files/media_entity/documents/ins-guide-implementation.pdf) (v3.0, décembre 2024, EXI ID 29), le matricule INS n'est transmis que si l'identité du patient est qualifiée : en dehors d'un domaine d'identification local, la publication simplifiée d'un document suppose donc une identité INS qualifiée.

L'acceptation d'un document suppose que le système cible connaisse l'identifiant du patient ; la manière dont il en est informé (par exemple, lors de l'ouverture du dossier du patient) relève de sa responsabilité (volet §3.3.6).

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
