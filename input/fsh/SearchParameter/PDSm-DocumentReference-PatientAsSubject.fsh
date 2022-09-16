Instance: PDSm-DocumentReference-PatientAsSubject
InstanceOf: SearchParameter
Usage: #definition
* meta.lastUpdated = "2021-10-21T14:07:56.765+00:00"
* url = "http://esante.gouv.fr/ci-sis/fhir/SearchParameter/PDSm_DocumentReference_PatientAsSubject"
* version = "1.0"
* name = "PDSm_DocumentReference_PatientAsSubject"
* derivedFrom = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* status = #active
* date = "2021-10-21T14:07:55.2305535+00:00"
* publisher = "ANS"
* description = "Paramètre de recherche chaîné créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément patient.identifier"
* code = #patient
* base = #DocumentReference
* type = #reference
* expression = "DocumentReference.patient"
* xpath = "f:DocumentReference/f:patient"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true
* modifier[0] = #missing
* modifier[+] = #type
* modifier[+] = #identifier
* chain = "identifier"