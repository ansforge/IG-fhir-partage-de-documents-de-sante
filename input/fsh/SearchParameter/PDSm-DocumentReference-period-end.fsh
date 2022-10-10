Instance: PDSm-DocumentReference-period-end
InstanceOf: SearchParameter
Usage: #definition
* meta.lastUpdated = "2021-10-21T14:09:32.446+00:00"
* url = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_DocumentReference_period-end"
* version = "1.0"
* name = "PDSm_DocumentReference_period-end"
* derivedFrom = "http://hl7.org/fhir/SearchParameter/DocumentReference-period"
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
* comparator[0] = #eq
* comparator[+] = #ne
* comparator[+] = #gt
* comparator[+] = #lt
* comparator[+] = #ge
* comparator[+] = #le
* comparator[+] = #sa
* comparator[+] = #eb
* comparator[+] = #ap