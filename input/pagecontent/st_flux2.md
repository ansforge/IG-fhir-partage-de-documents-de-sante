### Flux 02 : Résultat de l'ajout d'un lot de documents

Ce flux retourne le résultat de demande de modification du dossier. La demande peut être un succès ou un échec.

Il doit être indiqué dans la réponse, le statut (succès ou échec) de chaque élément mentionné dans la requête. Le contenu qui a été créé ou modifié est aussi retourné.

Bundle [ProvideDocumentBundleResponse](StructureDefinition-PDSmComprehensiveProvideDocumentBundle.html) contenant le statut de chacune des différentes ressources qu'il est possible d'importer, dans le champs entry.response.status :
* [LotDeSoumission](StructureDefinition-PDSmSubmissionSetComprehensive.html)
* [Fiche](StructureDefinition-PDSmComprehensiveDocumentReference.html)
* [Classeur](StructureDefinition-PDSmFolderComprehensive.html)

### Construction du flux 

Ce flux se base sur la réponse de la transaction IHE "Provide Document Bundle [ITI-65](https://profiles.ihe.net/ITI/MHD/ITI-65.html)" du profil MHD.

Le gestionnaire de partage de documents de santé retourne un "HTTP Status code" approprié au résultat de la demande comme indiqué dans la spécification du profil MHD. Le corps de la réponse doit être un Bundle de type transaction-response avec un élément [entry](StructureDefinition-PDSmComprehensiveProvideDocumentBundle-definitions.html#Bundle.entry) pour chaque ressource reçue dans le Bundle de la requête, dans le même ordre, avec le résultat du traitement de l'élément.


Ci-dessous un exemple de contenu d'un payload :

```json
{
    "resourceType":"Bundle","id":"a9c10f8a-882d-4000-a280-7150e0aeb478",
    "type":"transaction-response",
    "link":[{"relation":"self","url":"http://exemple.com/fhir"}],
    "entry":[
        {
            "response":{
                "id":"urn:uuid:a9a16511-43ad-11e8-afb2-4107535a99ef",
                "status":"201",
                "location":"List/1"
            }
        },
        {
            "response":{
                "id":"urn:uuid:a9a16512-43ad-11e8-afb2-4107535a99ef",
                "status":"201",
                "location":"DocumentReference/1"
            }
        },
        {
            "response":{
                "id":"urn:uuid:8da1cfcc-05db-4aca-86ad82aa756a64bb",
                "status":"201",
                "location":"Binary/1"
            }
        }
    ]
}
```

Ce flux sert à communiquer un succès ou un échec. Un succès n'est indiqué que lorsque le ou les documents sont reçus, complètement traités et conservés selon les besoins de la configuration du gestionnaire de partage de documents.

Les messages de warning concernant le traitement des associations entre fiches, l’élément [DocumentReference.relatesTo](StructureDefinition-PDSmComprehensiveDocumentReference-definitions.html#DocumentReference.relatesTo), ou le traitement des classeurs sont définis par le profil MHD.