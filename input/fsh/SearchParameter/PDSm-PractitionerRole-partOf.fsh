Instance: PDSm-PractitionerRole-partOf
InstanceOf: SearchParameter
Usage: #definition
// * url = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_partOf"
// * version = "1.0"
* name = "PDSm_partOf"
* status = #active
* date = "2021-07-30"
* publisher = "ANS"
* description = "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'extension partof qui permet de faire référence à l'exercice professionnel depuis la situation d'exercice"
* code = #partOf
* base = #PractitionerRole
* type = #reference
* expression = "(extension('https://apifhir.annuaire.sante.fr/ws-sync/exposed/structuredefinition/practitionerRole-partOf').value as Reference)"


// Note : ce searchparam n'a pas la même forme que les autres searchparams de PDSm sur le package simplifier (n'a pas List dans le nom) mais a été corrigé par Tristan Rieu le 09.01
// https://simplifier.net/CI-SIS/PDSmfamilyEx/~json