Instance: PDSm-List-authorOrg
InstanceOf: SearchParameter
Usage: #definition
Description: "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément sourceId"
* name = "PDSm-authorOrg"
* status = #active 
* description = "Recherche sur l'auteur d'une organisation"
* purpose = "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'auteur quand celui-ci correspond à une organisation"
* code = #authorOrg
* base = #List
* type = #reference
* expression = "(extension('http://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-authorOrg').value as Reference)"

