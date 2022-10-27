Instance: PDSm-List-authorOrg
InstanceOf: SearchParameter
Usage: #definition
Description: "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément sourceId"

* name = "PDSm_authorOrg"
* status = #active
// * date = "2021-10-21T13:35:16.5262064+00:00"
// * publisher = "ANS"
* description = ""
* purpose = "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'auteur quand celui-ci correspond à une organisation"
* code = #authorOrg
* base = #List
* type = #reference
* expression = "(extension('http://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-authorOrg').value as Reference)"