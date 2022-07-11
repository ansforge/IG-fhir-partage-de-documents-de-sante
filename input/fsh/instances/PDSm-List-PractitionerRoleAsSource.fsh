Instance: PDSm-List-PractitionerRoleAsSource
InstanceOf: SearchParameter
Usage: #definition
* url = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_List_PractitionerRoleAsSource"
* version = "1.0"
* name = "PDSm_List_PractitionerRoleAsSource"
* derivedFrom = "http://hl7.org/fhir/SearchParameter/List-source"
* status = #active
* date = "2021-07-30"
* publisher = "ANS"
* description = "Paramètre de recherche chaîné créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément source:PractitionerRole.practitioner:Practitioner.given et source:PractitionerRole.practitioner:Practitioner.family"
* code = #source
* base = #List
* type = #reference
* expression = "List.source"
* xpath = "f:List/f:source"
* xpathUsage = #normal
* target = #PractitionerRole
* multipleOr = true
* multipleAnd = true
* modifier[0] = #exact
* modifier[+] = #contains
* chain[0] = "partOf.practitioner.given"
* chain[+] = "partOf.practitioner.family"
* chain[+] = "partOf.givenEx"
* chain[+] = "partOf.familyEx"