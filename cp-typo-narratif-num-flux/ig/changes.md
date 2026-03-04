# Historique des changements - Partage de Documents de Santé en mobilité (PDSm) v3.1.1

* [**Table of Contents**](toc.md)
* **Historique des changements**

## Historique des changements

### Release 3.1.1 de l'Implementation Guide Partage de Documents de Santé pour usage de MES et DMP notamment

Modifications apportées dans la release [1.1.1](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/milestone/4?closed=1) :

* (3.1.1) Mise à jour du narratif [#74](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/74), [#78](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/78)
* (3.1.1) Suppression d'une terminologie NOS obsolète (TRE A04 remplacée par LOINC) [#72](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/72)
* (3.1.1) Mise à jour du narratif, mise à jour des héritages (FRCore et Annuaire), ajout d'exemples [#75](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/75)
* (3.1.1) Styling (tableaux, figures, liens, typos, menu, …) [#77](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/77) [#78](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/78) [#82](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/82)
* (3.1.1) Mise à jour introduction des spécifications fonctionnelles [#81](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/81)
* (3.1.1) Mise en conformité des flux de recherche avec MHD [#84](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/84)

### Release 3.1.0 de l'Implementation Guide Partage de Documents de Santé pour usage de MES et DMP notamment

[Modifications apportées dans cette release](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/milestone/3?closed=1) :

* (3.1.0) Ajout du schéma plantumldes ressources, mise à jour description des profils et mise à jour de la page index [36](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/36)
* (3.1.0) Mise à jour dépendance Annuaire et FrCore [64](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/64)
* (3.1.0) Ajout de la dépendance du NOS [61](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/61)
* (3.1.0) Suppression de la contrainte max 1 de context.event de comprehensive DR [60](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/60)
* (3.1.0) Amélioration narratives diverses (logo ci-sis, remaniement des pages, liens cassés) [58](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/58), [56](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/56), [52](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/52), [48](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/48), [46](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/46), [44](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/44), [41](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/41), [38](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/38), [37](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/37)
* (3.1.0) Ajout referenceIdList (accession number) pour projet DRIM [57](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/57)
* (3.1.0) Mise à jour des SP de l'annuaire (suppression de SP custom pour utiliser des SP natifs) [49](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/49)
* (3.1.0) Ajout des spécifications fonctionnelles [42](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/42)
* (3.1.0) Suppression de la contrainte contained [40](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/pull/40)
* (3.1.0-ballot) Héritage de l'IG annuaire santé ([#24](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/issues/24))
* (3.1.0-ballot) Mise à jour du narratif et éclaircissement ([#51](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/issues/51), [#50](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/issues/35), [#32](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/issues/32), [#31](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/issues/31))
* (3.1.0-ballot) Page index : ajout des dépendances, du logo ci-sis
* (3.1.0-ballot) Passage au status active
* (3.1.0-ballot) suppression de la contrainte "contained" obligatoire pour les champs subject (pour éviter les doublons) et suppression de l'obligation du type de ressources contained ([#28](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/issues/28))
* (3.1.0-ballot) Réparation de liens morts
* (3.1.0-ballot) Ajout des spécifications fonctionnelles dans l'IG ([#35](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/issues/35))
* (3.1.0-ballot) Ajout du mapping du XDS ReferenceIdList ([#55](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/issues/55))

