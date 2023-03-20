Instance: PDSm-PractitionerRole-family-ex
InstanceOf: SearchParameter
Usage: #definition
// * meta.lastUpdated = "2021-10-21T14:18:12.922+00:00"
// * url = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PractitionerRole_family-ex"
// * version = "2.0"
* name = "PractitionerRoleFamilyEx"
* status = #active
* date = "2021-12-01"
* publisher = "ANS"
* description = "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'extension PractitionerRoleName qui permet de préciser le nom d'exercice d'un professionnel (family)"
* code = #family-ex
* base = #PractitionerRole
* type = #string
* expression = "(extension('https://apifhir.annuaire.sante.fr/ws-sync/exposed/structuredefinition/practitionerRole-name').valueHumanName.family as String)"

// Note : ce searchparam n'a pas la même forme que les autres searchparams de PDSm sur simplifier (n'est pas préfixé par PDSm)
// https://simplifier.net/CI-SIS/givenEx/~json