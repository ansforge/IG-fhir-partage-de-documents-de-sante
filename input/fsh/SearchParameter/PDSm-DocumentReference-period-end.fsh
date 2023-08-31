Instance: PDSm-DocumentReference-period-end
InstanceOf: SearchParameter
Usage: #definition
* name = "PDSmDocumentReferencePeriodEnd"
* status = #active
* date = "2021-10-21T14:09:31.7181197+00:00"
* publisher = "ANS"
* description = "Paramètre de recherche créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément context.period.end correspondant à lobjet dateFinActe"
* code = #period-end
* base = #DocumentReference
* type = #date
* expression = "DocumentReference.context.period.end"
* multipleOr = true
* multipleAnd = true