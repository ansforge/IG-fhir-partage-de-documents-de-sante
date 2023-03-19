Instance: PDSm-PractitionerRole-given-ex
InstanceOf: SearchParameter
Usage: #definition
// * url = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PractitionerRole_given-ex"
// * version = "2.0"
* name = "PractitionerRole-given-ex"
* status = #active
* date = "2021-12-01"
* publisher = "ANS"
* description = "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'extension PractitionerRoleName qui permet de préciser le nom d'exercice d'un professionnel (given)"
* code = #given-ex
* base = #PractitionerRole
* type = #string
* expression = "(extension('https://apifhir.annuaire.sante.fr/ws-sync/exposed/structuredefinition/practitionerRole-name').valueHumanName.given as String)"


// Note : ce searchparam n'a pas la même forme que les autres searchparams de PDSm sur simplifier (Le nom n'est pas préfixé par PDSm, mais l' "id" oui)
// https://simplifier.net/ci-sis/pdsmfamilyex