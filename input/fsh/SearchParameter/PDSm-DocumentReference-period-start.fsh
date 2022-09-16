Instance: PDSm-DocumentReference-period-start
InstanceOf: SearchParameter
Usage: #definition
* meta.lastUpdated = "2021-10-21T14:10:19.925+00:00"
* url = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_DocumentReference_period-start"
* version = "1.0"
* name = "PDSm_DocumentReference_period-start"
* derivedFrom = "http://hl7.org/fhir/SearchParameter/DocumentReference-period"
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
* comparator[0] = #eq
* comparator[+] = #ne
* comparator[+] = #gt
* comparator[+] = #lt
* comparator[+] = #ge
* comparator[+] = #le
* comparator[+] = #sa
* comparator[+] = #eb
* comparator[+] = #ap