Instance: PDSm-DocumentReference-PatientAsSubject
InstanceOf: SearchParameter
Usage: #definition
* name = "PDSmDocumentReferencePatientAsSubject"
* derivedFrom = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* status = #active
// * date = "2021-10-21T14:07:55.2305535+00:00"
* publisher = "ANS"
* description = "Paramètre de recherche chaîné créé pour le volet PDSm de manière à pouvoir utiliser comme critère de recherche l'élément patient.identifier"
* code = #patient
* base = #DocumentReference
* type = #reference
* expression = "DocumentReference.subject.where(resolve() is Patient)"
* xpath = "f:DocumentReference/f:subject"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true
* modifier[0] = #missing
* modifier[+] = #type
* modifier[+] = #identifier
* chain = "identifier"