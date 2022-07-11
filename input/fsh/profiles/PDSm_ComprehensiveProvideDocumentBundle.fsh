Profile: PDSm_ComprehensiveProvideDocumentBundle
Parent: IHE.MHD.Comprehensive.ProvideBundle
Id: PDSmComprehensiveProvideDocumentBundle
Description: """Profil basé sur la transaction IHE "Provide Document Bundle [ITI-65]" du profil MHD ; le bundle est de type transaction et contient : 
- une ressource de type « List » représentant le lot de soumission,
- une à plusieurs ressources de type « DocumentReference », représentant les fiches de documents,
- zero à plusieurs ressources « Binary » représentant les documents envoyés dans le flux,
- zero à plusieurs ressources de type « List » représentant les classeurs.
Dans le cas d’un dépôt d’un nouveau document, l’élément DocumentReference.content.attachment.url doit pointer vers une ressource Binary, représentant le document, présente dans le bundle.
Dans le cas d’une demande de mise à jour d’un document par remplacement, l’élément DocumentReference.relatesTo doit être renseigné afin d’indiquer le lien avec un DocumentReference existant et de préciser la nature de la mise à jour. L’élément DocumentReference.content.attachment.url doit pointer vers une ressource Binary, représentant le document qui remplace l’ancien, présente dans le bundle.
Dans le cas d’une mise à jour d’un classeur, comme List.status ou List.entry pour reclasser des documents, une nouvelle version de la ressource List est envoyée."""
* ^meta.lastUpdated = "2021-10-21T13:35:55.450+00:00"
* ^date = "2021-07-30"
* entry[SubmissionSet] ^sliceName = "SubmissionSet"
* entry[SubmissionSet].resource 1..
* entry[SubmissionSet].resource only PDSm_SubmissionSetComprehensive
* entry[DocumentRefs] ^sliceName = "DocumentRefs"
* entry[DocumentRefs].resource 1..
* entry[DocumentRefs].resource only PDSm_ComprehensiveDocumentReference
* entry[Folders] ^sliceName = "Folders"
* entry[Folders].resource only PDSm_FolderComprehensive
* entry[Patient] 0..0