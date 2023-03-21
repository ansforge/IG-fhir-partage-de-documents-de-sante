Instance: PDSm-PractitionerRole-family-ex
InstanceOf: SearchParameter
Usage: #definition
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