### Flux 06 : Résultat de la recherche de document
Il s'agit du résultat de la recherche de documents retourné par le gestionnaire de partage de documents. La recherche de Lots de Soumission retourne les ressources List qui correspondent aux critères de recherche fournis par le consommateur de documents. La recherche de fiches retourne les ressources DocumentReference qui correspondent aux critères de recherche fournis par le consommateur de documents. On retrouve les mêmes éléments qui constituent les lots de soumission et les fiches que lors de la demande d’ajout d’un lot de documents (Tableau 2). 

### Construction du flux 
Ce flux est la réponse de la transaction IHE "Find Document Lists [ITI-66](https://profiles.ihe.net/ITI/MHD/ITI-66.html)" ou "Find Document References [ITI-67](https://profiles.ihe.net/ITI/MHD/ITI-67.html) du profil MHD.
Ce flux correspond à la réponse à la requête reposant sur l’interaction « search » du flux précédent.
En cas de succès, le gestionnaire de partage de documents retourne un code `HTTP 200 OK` ainsi qu’un Bundle de type searchset.

#### Réponse au flux 05-a
Pour [ITI-66](https://profiles.ihe.net/ITI/MHD/ITI-66.html), un profil spécifique dérivé du profil IHE MHD v4.0.1 « FindListsResponse » est créé pour ce volet et nommé [PDSm_FindListsResponse](StructureDefinition-PDSmFindListsResponse.html). Il contient zéro ou plusieurs ressources 

#### Réponse au flux 05-b
Pour [ITI-67](https://profiles.ihe.net/ITI/MHD/ITI-67.html), un profil spécifique dérivé du profil IHE MHD v4.0.1 « FindDocumentReferencesComprehensiveResponse » est créé pour ce volet et nommé [PDSm_FindDocumentReferencesComprehensiveResponse](StructureDefinition-pdsmfinddocumentreferencescomprehensiveresponse.html). Il contient zéro ou plusieurs ressources DocumentReference pour [ITI-67](https://profiles.ihe.net/ITI/MHD/ITI-67.html) répondants aux critères de la requête.

Si le gestionnaire de partage de documents envoie des "warnings", la ressource Bundle doit aussi contenir une ressource "OperationOutcome" qui contient ces "warnings".
Si le gestionnaire de partage de documents doit reporter une erreur, il doit utiliser un "[HTTP error response codes](http://hl7.org/fhir/R4/http.html)" et doit inclure un "[FHIR OperationOutcome](http://hl7.org/fhir/R4/operationoutcome.html)" avec plus de détails sur l'échec.