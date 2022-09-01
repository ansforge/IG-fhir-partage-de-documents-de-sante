Extension: PDSm_IsArchived
Id: PDSmIsArchived
Title: "PDSm_isArchived"
Description: "Extension définie par le volet ANS \"Volet Partage de documents de santé en mobilité\" sur les ressources List et DocumentReference pour distinguer les lots de soumission et les fiches archivés des actives."

* ^context[0].type = #element
* ^context[=].expression = "DocumentReference"
* ^context[+].type = #element
* ^context[=].expression = "List"
* value[x] 1..
* value[x] only boolean