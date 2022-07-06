Extension: PDSm_IsArchived
Id: PDSmIsArchived
Title: "PDSm_isArchived"
Description: "Extension définie par le volet ANS \"Volet Partage de documents de santé en mobilité\" sur les ressources List et DocumentReference pour distinguer les lots de soumission et les fiches archivés des actives."
* ^url = "http://esante.gouv.fr/cisis/fhir/StructureDefinition/PDSm_isArchived"
* ^version = "1.0"
* ^date = "2021-07-30"
* ^publisher = "ANS"
* ^context[0].type = #element
* ^context[=].expression = "DocumentReference"
* ^context[+].type = #element
* ^context[=].expression = "List"
* url = "http://esante.gouv.fr/cisis/fhir/StructureDefinition/PDSm_isArchived" (exactly)
* value[x] 1..
* value[x] only boolean