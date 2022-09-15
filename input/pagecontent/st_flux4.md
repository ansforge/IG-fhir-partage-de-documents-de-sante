### Flux 04 : résultat de la mise à jour des métadonnées de la fiche

Ce flux retourne le résultat de demande de modification des métadonnées de la fiche. La demande peut être un succès ou un échec.

Il doit être indiqué dans la réponse, le statut (succès ou échec) de la requête. Le contenu qui a été modifié est aussi retourné. 

### Construction du flux 

Il s'agit de la réponse à la demande de mise à jour des métadonnées de la fiche.

Le gestionnaire de partage de documents de santé retourne un "HTTP Status code" approprié au résultat de la mise à jour de chaque élément contenu dans la requête. Par exemple :
* Si la mise à jour de la ressource DocumentReference est correctement effectuée, un code HTTP 200 « OK » doit être retourné.
* Si la mise à jour de la ressource DocumentReference porte sur des éléments autres que status, securityLabel et PDSm_isArchived, une erreur 405 « Method Not Allowed » doit être retournée.

Pour des informations sur les autres codes HTTP retournés en cas d’échec, consultez la documentation relative à [l’interaction « patch »](https://www.hl7.org/fhir/http.html#summary) de l’API REST FHIR.

Le corps de la réponse doit contenir une ressource DocumentReference constituée des éléments modifiés.

Ci-dessous un exemple de réponse suite au succès de la mise à jour du statut à « current » de la ressource DocumentReference d’identifiant 35 (cf annexe VI).

```
HTTP/1.1 200 Ok
Content-Type : application/fhir+JSON
Last-Modified : 2021-06-07
ETag : W/"2"
{
 "resourceType":"DocumentReference",
 "meta": { "versionId": "2" },
 "id":"35",
 "status":"current ",
 …
}
```