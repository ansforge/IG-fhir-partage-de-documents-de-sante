Instance: ExampleFolder
InstanceOf: PDSm_FolderComprehensive
Title: "Exemple de Classeur PDSm"
Description: "Exemple d’une instance conforme au profil PDSm_FolderComprehensive regroupant des fiches de documents."
Usage: #example

* status = #current
* mode = #working
* title = "Classeur de suivi diabète"
* code = https://profiles.ihe.net/ITI/MHD/CodeSystem/MHDlistTypes#folder "Folder"
* date = "2025-04-28T10:30:00+01:00"

* subject = Reference(fr-patient-123)

* identifier[uniqueId].system = "urn:ietf:rfc:3986"
* identifier[uniqueId].value = "urn:uuid:55555555-aaaa-bbbb-cccc-666666666666"

* identifier[entryUUID].system = "urn:ietf:rfc:3986"
* identifier[entryUUID].value = "urn:uuid:77777777-dddd-eeee-ffff-888888888888"

* extension[designationType].valueCodeableConcept = http://snomed.info/sct#80146002 "Appendectomy (procedure)"

* note.text = "Classeur regroupant les documents liés à l’intervention chirurgicale d’appendicectomie et au suivi post-opératoire du patient."

* entry[0].item = Reference(exemple-pdsm-documentreference)
