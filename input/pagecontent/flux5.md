### Flux 05 : recherche de documents

Ce flux intervient lorsque le consommateur de documents souhaite rechercher un ou plusieurs documents d'un patient du gestionnaire partage de documents. Il y a deux types de recherche : la recherche de lots de soumission et la recherche de fiches. Ci-dessous les critères de recherche pour chaque type. 
x

### Construction du flux 

La recherche de documents peut se faire de deux manières/étapes :
* en faisant une recherche pour obtenir le lotDeSoumission (Flux 05-a : Recherche de LotDeSoumission)
* ou en faisant une recherche pour obtenir la fiche du document (Flux 05-b : Recherche de fiche)

#### Flux 05-a Recherche de LotDeSoumission
Ce flux se base sur la requête de la transaction IHE "Find Document Lists [ITI-66]" du profile MHD.

Le flux 05-a de recherche de LotDeSoumission se base sur l’interaction « search » de L’API REST FHIR. Il s’agit d’une requête HTTP GET ou HTTP POST adressant la ressource List et regroupant les paramètres listés dans la liste ci-dessous.

Le flux 05-a contient les critères suivants :


| Critère de recherche  | Paramètre de recherche |
| ----- | ----- |
| dateSoumission : Date | date : date            |
| typeActivite : Code | designationType : token |
| idUnique : Identifiant | identifier : token |
| statut : Code |  status : token <br/> Paramètre de recherche créé pour le volet PDSm : <br/> isArchived : token|
| idLotSoumission : Identifiant | identifier : token |
| titre : Texte | title : string |
| idSource : Identifiant | sourceId : reference |
| auteur : Identifiant | source : reference <br/> Paramètre de recherche créé pour le volet PDSm <br/> authorOrg : reference |
| code : code | code : token |
| idPatient : Identifiant | patient.identifier : token |
| prenomAuteurPersonnePhysique : Texte | source:Patient.given : string <br/> source:PractitionerRole.partOf.given-ex : string |
| nomAuteurPersonnePhysique : Texte | source:Patient.family : string  <br/> source:PractitionerRole.partOf.family-ex : string |
{: .grid }

Ci-dessous des exemples de requête :

* Rechercher les ressources de type List, correspondant à des lots de soumission, ayant été créées depuis le 01/01/2021 dont l’auteur est une professionnelle ayant pour nom de famille Dupont et prénom Emma. 
```
GET http://targetsystem.com/API/List?code=http://profiles.ihe.net/ITI/MHD/CodeSystem/MHDlistTypes|submissionset&date=ge2021-01-01&source:PractitionerRole.partOf.family-ex =Dupont& source:PractitionerRole.partOf.given-ex =Emma HTTP/1.1
```

* Rechercher les ressource de type List, correspondant à des lots de soumission dont le patient a l’identifiant 156. 
```
POST http://targetsystem.com/API/List/_search?patient.identifier=156&code=http://profiles.ihe.net/ITI/MHD/CodeSystem/MHDlistTypes|submissionset
```

#### Flux 05-b : Recherche de fiche

Ce flux se base sur la requête de la transaction IHE "Find Document References [ITI-67]" du profil MHD.

Le flux 05-b de recherche de fiches se base sur l’interaction « search19 » de L’API REST FHIR. Il s’agit d’une requête HTTP GET ou HTTP POST adressant la ressource DocumentReference et regroupant les paramètres listés dans le tableau ci-dessus.

Le flux 05-b contient les critères suivants :

|Critère de recherche | Paramètre de recherche |
| ----- | ----- |
|typeDocument : Code | type : token |
|secteurActivite : Code | facility : token |
|cadreExercice : Code | setting : token |
|idFiche : Identifiant | identifier : token |
|dateCreationDocument : Date | creation : date |
|niveauConfidentialite : Code | security-label : token |
|idUnique : Identifiant | identifier : token |
|statut : Code | status : token <br/> Paramètre de recherche créé pour le volet PDSm : <br/>  isArchived : token |
|dateDebutActe : Date | Paramètre de recherche créé pour le volet PDSm : <br/> period-start : date |
|dateFinActe : Date | Paramètre de recherche créé pour le volet PDSm : <br/> period-end : date |
|formatDocument : Code | format : token |
|classeDocument : Code | category : token |
|idFicheAssociation : Identifiant | RelatesTo : reference |
|actePathologie : code | event : token |
|period : date | period : date |
|idPatient : Identifiant | patient.identifier : token |
{: .grid }

Ci-dessous un exemple de requête :

* Rechercher les ressources de type DocumentReference du patient ayant l’identifiant 32659.
```
GET http://targetsystem.com/API/DocumentReference?patient.identifier=32659 HTTP/1.1
```