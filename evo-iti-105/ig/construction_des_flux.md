# Spécifications techniques - vue d'ensemble - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* **Spécifications techniques - vue d'ensemble**

## Spécifications techniques - vue d'ensemble

La construction des flux reprend le profil MHD. Ces flux représentent des interactions avec le gestionaire de documents, dont la construction est détaillée dans des pages dédiées à chaque objectif :

### Ajout d'un lot de documents

**Ajout d'un lot de documents : Flux 01 et 02"**

* Le flux 01 d’ajout d’un lot de documents sera assuré par l’interaction « transaction » de FHIR. Le gestionnaire de partage de documents doit supporter les requêtes HTTP POST.
* Le flux 02 de résultat de la demande d’ajout d’un lot de documents sera assuré par la réponse à la requête HTTP POST.

Les flux 01 et 02 correspondent à la transaction IHE "Provide Document Bundle [ITI-65]". La documentation complète est accessible [ici](st_ajout.md)

### Mise à jour de documents

**Mise à jour de documents: Flux 03 et 04"**

* Le flux 03 de demande de mise à jour des métadonnées de la fiche sera assuré par l’interaction « patch » de FHIR. Le gestionnaire de partage de documents doit supporter les requêtes HTTP PATCH et le « conditional patch » afin d’effectuer la demande via l’identifiant métier.
* Le flux 04 résultat de la demande de mise à jour des métadonnées de la fiche.

Les flux 03 et 04 se situent hors du périmètre du profil MHD. La documentation complète est accessible [ici](st_maj.md)

### Recherche de lot de documents

**Recherche de lot de documents et recherche de fiche : Flux 05 et 06"**

* Le flux 05 de recherche de documents sera assuré par l’interaction « search » de FHIR. Le gestionnaire de partage de documents doit supporter les requêtes HTTP GET et HTTP POST. On recherche ici un lot de soumission (ressource List).
* Le flux 06 résultat de la recherche de documents sera assuré par la réponse à la requête HTTP.

La recherche de lots de soumission correspond à la transaction IHE "Find Document Lists [ITI-66]". La documentation complète est accessible [ici](st_recherche_lot.md)

### Recherche de fiche

* Le flux 05 de recherche de documents sera assuré par l’interaction « search » de FHIR. Le gestionnaire de partage de documents doit supporter les requêtes HTTP GET et HTTP POST. On recherche ici une fiche d’un document (ressource DocumentReference).
* Le flux 06 résultat de la recherche de documents sera assuré par la réponse à la requête HTTP.

La recherche de fiches correspond à la transaction IHE "Find Document References [ITI-67]". La documentation complète est accessible [ici](st_recherche_fiche.md)

### Consultation de documents

**Consultation de documents : Flux 07 et 08"**

* Le flux 07 de demande de consultation de documents repose sur l’interaction « read » de FHIR. Le gestionnaire de partage de documents doit supporter les requêtes HTTP GET.
* Le flux 08 résultat de la demande de consultation de documents sera assuré par la réponse à la requête HTTP GET.

Les flux 07 et 08 correspondent aux transactions IHE "Retrieve Document [ITI-68]". La documentation complète est accessible [ici](st_consultation.md)

### Ajout simplifié de document

**Ajout simplifié de document : Flux 09 et 10"**

* Le flux 09 d’ajout d’un document de manière simplifiée repose sur l'interaction « create » de FHIR.
* Le flux 10 de résultat de la demande d’ajout simplifié d'un document sera assuré par la réponse à la requête HTTP POST.

La documentation complète est accessible [ici](st_ajout_simplifie.md)

