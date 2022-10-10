Instance: PDSm-DocumentReference-PractitionerRoleAsAuthor
InstanceOf: SearchParameter
Usage: #definition
* meta.lastUpdated = "2021-10-21T14:14:42.103+00:00"
* url = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_DocumentReference_PractitionerRoleAsAuthor"
* version = "1.0"
* name = "PDSm_DocumentReference_PractitionerRoleAsAuthor"
* derivedFrom = "http://hl7.org/fhir/SearchParameter/DocumentReference-author"
* status = #active
* date = "2021-10-21T14:14:41.3948746+00:00"
* publisher = "ANS"
* description = "Paramètre de recherche chaîné créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément author:PractitionerRole.practitioner:Practitioner.identifier, author:PractitionerRole.practitioner:Practitioner.given et author:PractitionerRole.practitioner:Practitioner.family"
* code = #author
* base = #DocumentReference
* type = #reference
* expression = "DocumentReference.author"
* xpath = "f:DocumentReference/f:author"
* xpathUsage = #normal
* target = #PractitionerRole
* multipleOr = true
* multipleAnd = true
* chain[0] = "partOf.practitioner.identifier"
* chain[+] = "partOf.practitioner.given"
* chain[+] = "partOf.practitioner.family"
* chain[+] = "partOf.givenEx"
* chain[+] = "partOf.familyEx"