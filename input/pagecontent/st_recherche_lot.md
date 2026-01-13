Ce flux intervient lorsque le consommateur de documents souhaite rechercher un lot de soumission.

Ces flux se basent sur la requête et la réponse de la transaction IHE "Find Document Lists [ITI-66](https://profiles.ihe.net/ITI/MHD/ITI-66.html) du profil MHD.

### Flux 05-a de recherche de LotDeSoumission

Le flux 05-a de recherche de LotDeSoumission se base sur l’interaction « search » de L’API REST FHIR. Il s’agit d’une requête HTTP GET ou HTTP POST adressant la ressource List et regroupant les paramètres listés dans la liste ci-dessous.

Le flux 05-a contient les critères suivants :

<!-- Rajouter les liens vers les searchparam custom -->
<!-- Mettre une colonne critère de recherche FHIR avec la description à côté, enlever le mapping fonctionnel -->


#### Paramètre de recherche de la ressource List

| Critère de recherche FHIR | Type | Description |
| ----- | ----- | ----- |
| date | date | Date de soumission du lot |
| designationType | token | Type d'activité |
| identifier | token | Identifiant unique ou identifiant du lot de soumission |
| status | token | Statut du lot|
| [isArchived](SearchParameter-PDSm-isArchived.html)* | token | Recherche des documents archivés ou non |
| title | string | Titre du lot |
| sourceId | reference | Identifiant de la source |
| [source](SearchParameter-PDSm-List-PatientAsSource.html)* | reference | recherche l'élément patient.identifier |
| [source](SearchParameter-PDSm-List-PractitionerRoleAsSource.html)* | reference | recherche l'élément source:PractitionerRole.practitioner:Practitioner.given et source:PractitionerRole.practitioner:Practitioner.family |
| [authorOrg](SearchParameter-PDSm-List-authorOrg.html)* | reference | Référence vers l'auteur source |
| [patient](SearchParameter-PDSm-List-PatientAsSubject.html)* | reference | Recherche dans subject:Patient.identifier |
| code | token | Recherche sur le cas d'utilisation de la ressource List |
| source:Patient.given <br/> source:PractitionerRole.name  | string | Recherche sur le prénom de la personne (praticien ou patient) à l'origine du document |
| source:Patient.family <br/> source:PractitionerRole.name | string   | Recherche sur le nom de famille de la personne (praticien ou patient) à l'origine du document |
{: .grid }

#### Paramètre de recherche de la ressource Patient

| Critère de recherche FHIR | Type | Description |
| ----- | ----- | ----- |
| patient.identifier | token | Recherche par identifiant patient |
| given | token | Recherche sur le prénom de l'auteur |
| family | token | Recherche sur le nom de l'auteur |
{: .grid }

#### Paramètre de recherche de la ressource PractitionerRole

| Critère de recherche FHIR | Type | Description |
| ----- | ----- | ----- |
| name | token | Recherche sur le nom ou prénom de l'auteur. SearchParameter défini dans le guide d'implémentation de l'annuaire |
{: .grid }

\* Paramètre de recherche créé pour le volet PDSm

Ci-dessous des exemples de requête :

* Rechercher les ressources de type List, correspondant à des lots de soumission, ayant été créées depuis le 01/01/2021 dont l’auteur est une professionnelle ayant pour nom de famille Dupont et prénom Emma.

`GET http://targetsystem.com/API/List?code=http://profiles.ihe.net/ITI/MHD/CodeSystem/MHDlistTypes|submissionset&date=ge2021-01-01&source:PractitionerRole.partOf.family-ex =Dupont& source:PractitionerRole.name =Emma HTTP/1.1`

* Rechercher les ressource de type List, correspondant à des lots de soumission dont le patient a l’identifiant 156.

`POST http://targetsystem.com/API/List/_search?patient.identifier=156&code=http://profiles.ihe.net/ITI/MHD/CodeSystem/MHDlistTypes|submissionset`

### Flux 06-a : réponse au flux 05-a
Il s'agit du résultat de la recherche de documents retourné par le gestionnaire de partage de documents. La recherche de Lots de Soumission retourne les ressources List qui correspondent aux critères de recherche fournis par le consommateur de documents. On retrouve les mêmes éléments qui constituent les lots de soumission que lors de la demande d’ajout d’un lot de documents.

Un profil spécifique dérivé du profil IHE MHD v4.0.1 « FindListsResponse » est créé pour ce volet et nommé [PDSm_FindListsResponse](StructureDefinition-pdsm-find-lists-response.html). Il contient zéro ou plusieurs ressources DocumentReference répondants aux critères de la requête.

Ce flux correspond à la réponse à la requête reposant sur l’interaction « search » du flux précédent.
En cas de succès, le gestionnaire de partage de documents retourne un code `HTTP 200 OK` ainsi qu’un Bundle de type searchset.

Si le gestionnaire de partage de documents envoie des "warnings", la ressource Bundle doit aussi contenir une ressource "OperationOutcome" qui contient ces "warnings".
Si le gestionnaire de partage de documents doit reporter une erreur, il doit utiliser un "[HTTP error response codes](http://hl7.org/fhir/R4/http.html)" et doit inclure un "[FHIR OperationOutcome](http://hl7.org/fhir/R4/operationoutcome.html)" avec plus de détails sur l'échec.