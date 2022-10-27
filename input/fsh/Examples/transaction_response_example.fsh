Instance:  transaction-response-bundle
InstanceOf: IHE.MHD.ProvideDocumentBundleResponse
Title:   "Exemple de bundle de type transaction-response du flux 2"
Usage:  #example
* id = "a9c10f8a-882d-4000-a280-7150e0aeb478"
* type = #transaction-response
* link[0].relation = "self"
* link[0].url = "http://exemple.com/fhir"

* entry[0].response.id = "urn:uuid:a9a16511-43ad-11e8-afb2-4107535a99ef"
* entry[0].response.status = "201"
* entry[0].response.location = "List/1"

* entry[1].response.id = "urn:uuid:a9a16512-43ad-11e8-afb2-4107535a99ef"
* entry[1].response.status = "201"
* entry[1].response.location = "DocumentReference/1"

* entry[2].response.id = "urn:uuid:8da1cfcc-05db-4aca-86ad82aa756a64bb"
* entry[2].response.status = "201"
* entry[2].response.location = "Binary/1"
