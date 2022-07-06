La construction des flux reprend le profil MHD. Cela consiste en la construction des requêtes ou des réponses HTTP de l'API REST de FHIR.

<object data="PDSm_1.svg" type="image/svg+xml"></object>
<br/>

### Ajout de document•s

* Le <a href="flux1.html">flux 01</a> d’ajout d’un lot de documents sera assuré par l’interaction « transaction » de FHIR. Le gestionnaire de partage de documents doit supporter les requêtes HTTP POST.
* Le <a href="flux2.html">flux 02</a> résultat de la demande d’ajout d’un lot de documents sera assuré par la réponse à la requête HTTP POST.

Les flux 01 et 02 correspondent à la transaction IHE "Provide Document Bundle [ITI-65]". 


### Mise à jour de fiche document

* Le <a href="flux3.html">flux 03</a> de demande de mise à jour des métadonnées de la fiche sera assuré par l’interaction « patch » de FHIR. Le gestionnaire de partage de documents doit supporter les requêtes HTTP PATCH et le « conditional patch » afin d’effectuer la demande via l’identifiant métier.
* Le <a href="flux4.html">flux 04</a> résultat de la demande de mise à jour des métadonnées de la fiche.


<object data="PDSm_2.svg" type="image/svg+xml"></object>
<br/>

Les flux 03 et 04 se situent hors du périmètre du profil MHD.



<object data="PDSm_2.svg" type="image/svg+xml"></object>
<br/>
### Recherche de documents

* Le <a href="flux5.html">flux 05</a> de recherche de documents sera assuré par l’interaction « search » de FHIR. Le gestionnaire de partage de documents doit supporter les requêtes HTTP GET et HTTP POST. On recherche soit un lot de soumission, ressource List, soit une fiche d’un document, ressource DocumentReference.
* Le <a href="flux6.html">flux 06</a> résultat de la recherche de documents sera assuré par la réponse à la requête HTTP.

La recherche de lots de soumission correspond à la transaction IHE "Find Document Lists [ITI-66]". La recherche de fiches correspond à la transaction IHE "Find Document References [ITI-67]".

### Accès à un document

* Le <a href="flux7.html">flux 07</a> de demande de consultation de documents repose sur l’interaction « read » de FHIR. Le gestionnaire de partage de documents doit supporter les requêtes HTTP GET.
* Le <a href="flux8.html">flux 08</a> résultat de la demande de consultation de documents sera assuré par la réponse à la requête HTTP GET.
            
Les flux 07 et 08 correspondent aux transactions IHE "Retrieve Document [ITI-68]".