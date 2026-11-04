# Consultation de documents (ITI-68) - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* [**Spécifications techniques - vue d'ensemble**](construction_des_flux.md)
* **Consultation de documents (ITI-68)**

## Consultation de documents (ITI-68)

Il s'agit du flux intervenant lors de la demande de consultation d'un document par le consommateur de documents au gestionnaire de partage de documents.

Ces flux se basent sur la requête et la réponse de la transaction IHE "Retrieve Document [ITI-68](https://profiles.ihe.net/ITI/MHD/ITI-68.html)" du profil MHD.

La demande de consultation utilise l’url du document. Elle est récupérée depuis la fiche : DocumentReference.content.attachment.url.

### Flux 07 : résultat de la demande de consultation de documents

Il s'agit d'une requête HTTP GET reposant sur l’interaction « read » envoyé par le consommateur de documents au gestionnaire de partage de documents pour demander à consulter un document.

La demande du consommateur de documents consiste à récupérer le contenu du document référencé par un DocumentReference.content.attachment.url.

Le seul MIME type que l’on puisse s’assurer de retourner est le MIME Type indiqué dans le DocumentReference.content.attachment.contentType.

### Flux 08 : résultat de la demande de consultation de documents

Il s'agit de la réponse à la demande de consultation de documents faite par le consommateur de documents. Le corps de la réponse est le document.

Quand le document demandé est retourné, le gestionnaire de partage de documents doit répondre avec un code `HTTP 200 OK`. Le corps du message HTTP doit être le contenu du document demandé.

Le gestionnaire de partage de documents doit fournir le document dans le MIME type demandé ou répondre avec un "HTTP Status Code" indiquant la condition d'erreur. Le gestionnaire de partage de documents n'est pas obligé de transformer le document.

Les situations d'erreur et les réponses HTTP correspondantes sont listées dans le [profil MHD](https://profiles.ihe.net/ITI/MHD/index.html).

