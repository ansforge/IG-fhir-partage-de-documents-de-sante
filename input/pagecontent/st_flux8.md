### Flux 08 : résultat de la demande de consultation de documents

Il s'agit de la réponse à la demande de consultation de documents faite par le consommateur de documents. Le corps de la réponse est le document.

### Construction du flux 

Il s'agit du résultat de la demande de consultation d’un document.

Quand le document demandé est retourné, le gestionnaire de partage de documents doit répondre avec un code `HTTP 200 OK`. Le corps du message HTTP doit être le contenu du document demandé.

Le gestionnaire de partage de documents doit fournir le document dans le MIME type demandé ou répondre avec un "HTTP Status Code" indiquant la condition d'erreur. Le gestionnaire de partage de documents n'est pas obligé de transformer le document.

Les situations d'erreur et les réponses HTTP correspondantes sont listées dans le [profil MHD](https://profiles.ihe.net/ITI/MHD/index.html).