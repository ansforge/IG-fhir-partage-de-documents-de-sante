Extension: PDSm_intendedRecipient
Id: pdsm-ext-intended-recipient
Description: "Représente le destinataire du lot de soumission"
* ^context.type = #element
* ^context.expression = "List"
* . ^short = "Représente le destinataire du lot de soumission"
* value[x] only Reference(AsPractitionerProfile or AsPractitionerRoleProfile or AsOrganizationProfile)