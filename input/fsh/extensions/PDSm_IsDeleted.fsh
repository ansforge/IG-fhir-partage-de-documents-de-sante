Extension: PDSm_IsDeleted
Id: pdsm-ext-is-deleted
Title: "PDSm_isDeleted"
Description: "Extension définie par le volet ANS \"Volet Partage de documents de santé en mobilité\" sur la ressource DocumentReference pour distinguer les fiches supprimées. A noter que la suppression est logique et pas physique."

* ^context[0].type = #element
* ^context[=].expression = "DocumentReference"

* value[x] 1..
* value[x] only boolean