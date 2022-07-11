# Description
Ce document présente les spécifications techniques du volet "Partage de documents de santé en mobilité". Sa production est basée sur les [Spécifications Fonctionnelles des Echanges du volet Partage de Documents de Santé](https://esante.gouv.fr/volet-partage-de-documents-de-sante) (SFE-PDS) et le profil [MHD](https://profiles.ihe.net/ITI/MHD/index.html) (Mobile access to Health Documents) défini par IHE (Integrating the Healthcare Entreprise).
    
Il s’agit d’un volet de la couche service spécifiant les modalités de partage de documents sans contraindre ces derniers. Les spécifications liées aux documents de santé constituent les volets de la couche métier du CI-SIS.

A noter que la dénomination du volet « Partage de documents de santé en mobilité » n’est pas restrictive. En effet, les standards sous-jacents aux spécifications techniques, par opposition au volet historique « Partage de documents de santé », permettent le déploiement de cas d'usage en mobilité mais ces spécifications peuvent également être mises en œuvre dans d'autres cas d'usage.

# NOTES IMPORTANTES

A noter, les profils issus du package français sont issus de simplifier et contiennent des erreurs de validation, empêchant ainsi d'utiliser leur dépendance. 
La référence reste à ce jour le [document publié sur le site des volets du CI-SIS](https://esante.gouv.fr/volet-partage-de-documents-de-sante).
De plus, les jeux de valeurs (JDV) du NOS n'étant pas packagées, il n'y a pas non plus de dépendances associées.


## Prérequis : sushi, java, ruby et jekyll

Sushi permet de convertir la [grammaire FSH](https://build.fhir.org/ig/HL7/fhir-shorthand/) pour générer des profils, extensions (StructureDefinition) et des exemples / instances FHIR. La prise en main est relativement facile lorsque l'on connaît bien FHIR.
Sushi est développé en javascript sous forme de module npm. 

```
npm install -g fsh-sushi
```
Pour information, [GoFSH](https://github.com/FHIR/GoFSH) permet de faire la transformation inverse : transformer une StructureDefinition au format FSH.

Une fois ses outils installés, il faut installer les dépendances de l'IG publisher :
Installation de [java](https://www.java.com/fr/download/help/download_options.html), [ruby](https://www.ruby-lang.org/fr/documentation/installation/) et [jekyll](https://jekyllrb.com/docs/installation/).

```
brew install ruby (sur mac)
gem install bundler jekyll
```
Vous trouverez davantage d'informations sur le [confluence d'hl7](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation)

Des difficultés pour installer ruby et jekyll peuvent survenir sur mac M1, M2: lancer le [terminal avec rosetta](https://apple.stackexchange.com/questions/428768/on-apple-m1-with-rosetta-how-to-open-entire-terminal-iterm-in-x86-64-architec) et suivre [cette procédure](https://github.com/jekyll/jekyll/issues/8576#issuecomment-798080994) permet de régler les problèmes.

## Générer l'IG
```
bash _updatePublisher.sh // Mise à jour du publisher java
bash _genonce.sh // Génère l'IG
```


## Acronymes
FIG : FHIR Implementation Guide
