Instance: PDSm-isArchived
InstanceOf: SearchParameter
Usage: #definition
* url = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_isArchived"
* version = "1.0"
* name = "PDSm_isArchived"
* status = #active
* date = "2021-07-30"
* publisher = "ANS"
* description = "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère derecherche l'élément isARchived qui permet distinguer les lots de soumission et les fiches archivés des actives."
* code = #isArchived
* base[0] = #DocumentReference
* base[+] = #List
* type = #token
* expression = "(extension('http://esante.gouv.fr/cisis/fhir/StructureDefinition/PDSm_isArchived').value as Boolean)"