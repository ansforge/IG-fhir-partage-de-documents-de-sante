Instance: PDSm-authorOrg
InstanceOf: SearchParameter
Usage: #definition
* meta.lastUpdated = "2021-10-21T13:35:17.242+00:00"
* url = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_authorOrg"
* version = "1.0"
* name = "PDSm_authorOrg"
* status = #active
* date = "2021-10-21T13:35:16.5262064+00:00"
* publisher = "ANS"
* description = "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément sourceId"
* purpose = "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'auteur quand celui-ci correspond à une organisation"
* code = #authorOrg
* base = #List
* type = #reference
* expression = "(extension('http://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-authorOrg').value as Reference)"