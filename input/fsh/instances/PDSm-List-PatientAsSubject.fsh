Instance: PDSm-List-PatientAsSubject
InstanceOf: SearchParameter
Usage: #definition
* url = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_List_PatientAsSubject"
* version = "1.0"
* name = "PDSm_List_PatientAsSubject"
* derivedFrom = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* status = #active
* date = "2021-07-30"
* publisher = "ANS"
* description = "Paramètre de recherche chaîné créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément subject:Patient.identifier"
* code = #patient
* base = #List
* type = #reference
* expression = "List.subject.where(resolve() is Patient)"
* multipleOr = true
* multipleAnd = true
* modifier[0] = #missing
* modifier[+] = #type
* modifier[+] = #identifier
* chain = "identifier"