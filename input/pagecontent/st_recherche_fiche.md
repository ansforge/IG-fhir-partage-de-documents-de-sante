Ce flux intervient lorsque le consommateur de documents souhaite rechercher un ou plusieurs documents d'un patient du gestionnaire partage de documents.

Ces flux se basent sur la requête et la réponse de la transaction IHE "Find Document References [ITI-67](https://profiles.ihe.net/ITI/MHD/ITI-67.html) du profil MHD.

### Flux 05-b de recherche de fiches

Le flux 05-b de recherche de fiches se base sur l’interaction « search » de L’API REST FHIR. Il s’agit d’une requête HTTP GET ou HTTP POST adressant la ressource DocumentReference et regroupant les paramètres listés dans le tableau ci-dessus.

Le flux 05-b contient les critères suivants :

#### Paramètre de recherche sur la ressource DocumentReference

| Critère de recherche FHIR | Type | Description |
| ----- | ----- | ----- |
| type | token | Recherche sur le type de document |
| facility | token | Recherche sur le secteur d'activité associé au document |
| setting | token | Recherche du cadre d'exercice du document |
| identifier | token | Recherche dans l'identifiant de la fiche (idUnique ou idFiche) |
| creation | date | Recherche sur la date de création du document |
| security-label | token | Recherche sur le niveau de confidentialité du document |
| status | token | Description | 
| [isArchived](SearchParameter-PDSm-isArchived.html)* | token | Recherche les documents archivés ou non |
| [period-start](SearchParameter-PDSm-DocumentReference-period-start.html)* | date | Contraindre la recherche sur la date de début de l'acte |
| [period-end](SearchParameter-PDSm-DocumentReference-period-end.html)* | date | Contraindre la recherche sur la date de fin de l'acte |
| format | token | Recherche sur le format du document |
| category | token | Recherche sur la classe du document |
| relatesTo | reference | Recherche de l'identifiant de la fiche associée |
| event | token | Recherche sur l'acte de la pathologie |
| period | date | Recherche sur le debut et la fin de l'acte |
| [patient](SearchParameter-PDSm-DocumentReference-PatientAsSubject.html)* | token | Recherche de l'identifiant du patient |
| [author](SearchParameter-PDSm-DocumentReference-PractitionerRoleAsAuthor.html)* | token | Recherche du praticien par identifiant, nom ou prénom |
{: .grid }

#### Paramètre de recherche sur les ressources Patient / Practitioner / Device

| Critère de recherche FHIR | Type | Description |
| ----- | ----- | ----- |
| identifier | token | Recherche sur l'identifiant patient / auteur |
{: .grid }

#### Paramètre de recherche sur la ressource Patient

| Critère de recherche FHIR | Type | Description |
| ----- | ----- | ----- |
| given | token | Recherche sur le prénom de l'auteur |
| family | token | Recherche sur le nom de l'auteur |
{: .grid }

#### Paramètre de recherche sur la ressource PractitionerRole

| Critère de recherche FHIR | Type | Description |
| ----- | ----- | ----- |
| [given-ex](SearchParameter-PDSm-PractitionerRole-given-ex.html)* | token | Recherche sur le prénom de l'auteur |
| [family-ex](SearchParameter-PDSm-PractitionerRole-family-ex.html)* | token | Recherche sur le nom de l'auteur |
{: .grid }

\* Paramètre de recherche créé pour le volet PDSm

Ci-dessous un exemple de requête :

* Rechercher les ressources de type DocumentReference du patient ayant l’identifiant 32659.
```
GET http://targetsystem.com/API/DocumentReference?patient.identifier=32659 HTTP/1.1
```

### Flux 06b : réponse au flux 05-b
Il s'agit du résultat de la recherche de documents retourné par le gestionnaire de partage de documents. La recherche de fiches retourne les ressources DocumentReference qui correspondent aux critères de recherche fournis par le consommateur de documents. On retrouve les mêmes éléments qui constituent les fiches que lors de la demande d’ajout d’un lot de documents. 



Un profil spécifique dérivé du profil IHE MHD v4.0.1 « FindDocumentReferencesComprehensiveResponse » est créé pour ce volet et nommé [PDSm_FindDocumentReferencesComprehensiveResponse](StructureDefinition-pdsmfinddocumentreferencescomprehensiveresponse.html). Il contient zéro ou plusieurs ressources DocumentReference répondants aux critères de la requête.

Ce flux correspond à la réponse à la requête reposant sur l’interaction « search » du flux précédent.
En cas de succès, le gestionnaire de partage de documents retourne un code `HTTP 200 OK` ainsi qu’un Bundle de type searchset.


Si le gestionnaire de partage de documents envoie des "warnings", la ressource Bundle doit aussi contenir une ressource "OperationOutcome" qui contient ces "warnings".
Si le gestionnaire de partage de documents doit reporter une erreur, il doit utiliser un "[HTTP error response codes](http://hl7.org/fhir/R4/http.html)" et doit inclure un "[FHIR OperationOutcome](http://hl7.org/fhir/R4/operationoutcome.html)" avec plus de détails sur l'échec.
