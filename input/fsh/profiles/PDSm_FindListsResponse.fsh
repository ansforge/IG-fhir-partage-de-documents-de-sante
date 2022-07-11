Profile: PDSm_FindListsResponse
Parent: IHE.MHD.FindDocumentListsResponseMessage
Id: PDSmFindListsResponse
Description: "Réponse de la transaction IHE \"Find Document Lists [ITI-66]\" basée sur le bundle MHD http://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.FindDocumentListsResponseMessage et profilé pour le volet PDSm"
* ^date = "2021-07-30"
* ^publisher = "ANS"
* entry[SubmissionSet] ^sliceName = "SubmissionSet"
* entry[SubmissionSet].resource only PDSm_SubmissionSetComprehensive
* entry[Folder] ^sliceName = "Folder"
* entry[Folder].resource only PDSm_FolderComprehensive