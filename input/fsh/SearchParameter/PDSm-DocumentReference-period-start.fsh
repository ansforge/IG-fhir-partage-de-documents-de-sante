Instance: PDSm-DocumentReference-period-start
InstanceOf: SearchParameter
Usage: #definition
* name = "PDSmDocumentReferencePeriodStart"
* status = #active
* date = "2021-10-21T14:10:19.3001986+00:00"
* publisher = "ANS"
* description = "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément context.period.start correspondant à lobjet dateDebutActe"
* code = #period-start
* base = #DocumentReference
* type = #date
* expression = "DocumentReference.context.period.start"
* multipleOr = true
* multipleAnd = true