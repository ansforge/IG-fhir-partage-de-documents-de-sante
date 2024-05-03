Instance: PDSm-isArchived
InstanceOf: SearchParameter
Usage: #definition
* name = "PDSmIsArchived"
* status = #active
* date = "2021-07-30"
* publisher = "ANS"
* description = "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère derecherche l'élément isArchived qui permet distinguer les lots de soumission et les fiches archivés des actives."
* code = #isArchived
* base[0] = #DocumentReference
* base[+] = #List
* type = #token
* expression = "extension.where(url='https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-is-archived').value"