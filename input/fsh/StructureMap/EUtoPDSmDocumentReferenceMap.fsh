Instance: EUtoPDSmDocumentReferenceMap
InstanceOf: StructureMap
Usage: #definition

* name = "EUtoPDSmDocumentReference"

* status = #draft

* experimental = true

* description = "Mapping EU EehrxfMhdDocumentReference vers PDSm DocumentReference"

* url = "http://example.org/fhir/StructureMap/EUtoPDSmDocumentReference"

* group[0].name = "EUtoPDSm"

* group[0].typeMode = #none

* group[0].input[0].name = "src"

* group[0].input[0].type = "DocumentReference"

* group[0].input[0].mode = #source

* group[0].input[1].name = "tgt"

* group[0].input[1].type = "DocumentReference"

* group[0].input[1].mode = #target

// règle simple exemple

* group[0].rule[0].name = "mapId"
* group[0].rule[0].source[0].context = "src"
* group[0].rule[0].source[0].element = "id"
* group[0].rule[0].target[0].context = "tgt"
* group[0].rule[0].target[0].element = "id"

// mapping status

* group[0].rule[1].name = "mapStatus"
* group[0].rule[1].source[0].context = "src"
* group[0].rule[1].source[0].element = "status"
* group[0].rule[1].target[0].context = "tgt"
* group[0].rule[1].target[0].element = "status"
