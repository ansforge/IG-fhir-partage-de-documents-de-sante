Ce flux permet l'ajout ou le remplacement d'un document au dossier patient. Cette demande de modification est faite par le producteur de documents.

Ces flux se basent sur la requête et la réponse de la transaction IHE "Provide Document Bundle [ITI-65](https://profiles.ihe.net/ITI/MHD/ITI-65.html)" du profil MHD.

### Flux 01 : Ajout d'un lot de documents

La première étape de la construction du flux 01 de la demande de modification du dossier patient consiste à organiser son contenu dans une ressource Bundle. Un profil spécifique dérivé du profil IHE MHD v4.0.1 « ComprehensiveProvideDocumentBundle » est créé pour ce volet et nommé [PDSm Comprehensive Provide Document Bundle](StructureDefinition-pdsm-comprehensive-provide-document-bundle.html).

Le flux doit contenir :
* une ressource de type « List » représentant le lot de soumission (profil [PDSm_SubmissionsSetComprehensive](StructureDefinition-pdsm-submissionset-comprehensive.html))
* une à plusieurs ressources de type « DocumentReference », représentant les fiches de documents (profil [PDSm_ComprehensiveDocumentReference](StructureDefinition-pdsm-comprehensive-document-reference.html))
* zéro à plusieurs ressources « Binary » représentant les documents envoyés dans le flux (ressource [Binary](https://www.hl7.org/fhir/binary.html))
* zéro à plusieurs ressources de type « List » représentant les classeurs (profil PDSm_FolderComprehensive)

Le corps de la requête est une ressource « Bundle » de type `transaction` encapsulant toutes les ressources listées précédemment. Cet objet de type JSON ou XML sera envoyé dans le contenu de la requête HTTP POST.

#### Cas 1 : Ajout d'un nouveau document

Dans le cas d'un dépôt d'un nouveau document, l'élément `DocumentReference.content.attachment.url` doit pointer vers une ressource `Binary`, représentant le document, présente dans le flux.

Le patient (`DocumentReference.subject` et `List.subject`) peut être référencé de deux manières :
* par une référence logique vers un patient déjà enregistré sur le serveur (`Patient/[id]`),
* ou en incluant la ressource Patient dans le bundle (requête HTTP POST), notamment lorsque le serveur destinataire ne dispose pas encore du patient avec son identité INS qualifiée.

Dans le cas d'une mise à jour d'un classeur, comme `List.status` ou `List.entry` pour reclasser des documents, une nouvelle version de la ressource List est envoyée.

#### Cas 2 : Remplacement d'un document existant

Le remplacement consiste à publier un nouveau document qui se substitue à un document existant, dont la fiche est marquée comme remplacée (`superseded`). Cette opération est atomique : elle est réalisée en une seule transaction ITI-65.

##### Pré-conditions

* Le document à remplacer (`DocumentReference/[id-ancien]`) est déjà persisté sur le serveur avec le statut `current`.
* Le patient est déjà enregistré sur le serveur avec une identité INS qualifiée. Il **ne doit pas** être inclus dans le bundle de remplacement.

##### Contenu du bundle

Le bundle de remplacement contient les entrées suivantes, dans l'ordre recommandé :

| Entrée | Type | Méthode | Rôle |
|---|---|---|---|
| Nouveau contenu documentaire | `Binary` | `POST` | Contenu binaire du document de remplacement |
| Nouvelle fiche | `DocumentReference` | `POST` | Fiche du nouveau document, avec `relatesTo` pointant vers l'ancien |
| Passage de l'ancien document en superseded | `Parameters` (PATCH) | `PATCH` | Mise à jour du statut de l'ancien document à `superseded` |
| Lot de soumission | `List` | `POST` | SubmissionSet contenant uniquement la nouvelle fiche |

Le patient n'est **pas** inclus dans le bundle : ses références (`subject`, `context.sourcePatientInfo`) pointent directement vers `Patient/[id]` sur le serveur.

##### Nouvelle fiche (DocumentReference)

La nouvelle fiche doit comporter l'élément `relatesTo` renseigné comme suit :

```
DocumentReference.relatesTo[0].code    = #replaces
DocumentReference.relatesTo[0].target  = Reference(DocumentReference/[id-ancien])
DocumentReference.status               = #current
```

L'élément `content.attachment.url` doit pointer vers la ressource `Binary` du nouveau document, présente dans le même bundle.

Conformément au profil [PDSm_ComprehensiveDocumentReference](StructureDefinition-pdsm-comprehensive-document-reference.html), l'élément `relatesTo` est obligatoire (`[1..1]`) dans le contexte d'un remplacement.

##### Passage de l'ancien document en superseded

Le producteur de documents inclut dans le bundle une entrée de type `PATCH` afin de mettre à jour le statut de l'ancienne fiche. Cette entrée utilise la ressource `Parameters` conforme au profil [IHE.MHD.Patch.Parameters](https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Patch.Parameters) :

```json
{
  "resourceType": "Parameters",
  "parameter": [{
    "name": "operation",
    "part": [
      { "name": "path",  "valueString": "DocumentReference.status" },
      { "name": "type",  "valueCode": "replace" },
      { "name": "value", "valueCode": "superseded" }
    ]
  }]
}
```

La requête associée dans le bundle est :

```
request.method = PATCH
request.url    = DocumentReference/[id-ancien]
```

> **Note :** L'ancienne fiche ne doit **pas** être incluse comme entrée `PUT` dans le bundle. Le `PATCH` seul suffit à mettre à jour son statut. Inclure simultanément un `PUT` avec `status = current` et un `PATCH` vers `superseded` créerait un conflit dans la transaction.

##### Lot de soumission (SubmissionSet)

Le lot de soumission ne doit référencer que la **nouvelle** fiche. L'ancienne fiche n'est pas listée dans `List.entry`.

##### Comportement du gestionnaire (Document Recipient)

À réception du bundle de remplacement, le gestionnaire de partage de documents :

1. crée la nouvelle ressource `Binary` et lui affecte un identifiant logique,
2. crée la nouvelle `DocumentReference` avec `status = current` et enregistre le lien `relatesTo`,
3. applique le `PATCH` sur l'ancienne `DocumentReference` et positionne son statut à `superseded`,
4. crée le lot de soumission (`List`).

Ces quatre opérations sont traitées de manière atomique (succès ou échec global de la transaction).

##### Exemple

Un exemple complet de bundle de remplacement conforme au profil PDSm est disponible : [bundle-exemple-comprehensiveprovidedocument-replace](Bundle-bundle-exemple-comprehensiveprovidedocument-replace.html).

---

### Flux 02 : Résultat de l'ajout d'un lot de documents

Ce flux retourne le résultat de demande de modification du dossier. La demande peut être un succès ou un échec.

Il doit être indiqué dans la réponse, le statut (succès ou échec) de chaque élément mentionné dans la requête. Le contenu qui a été créé ou modifié est aussi retourné.

Le gestionnaire de partage de documents de santé retourne un « HTTP Status code » approprié au résultat de la demande comme indiqué dans la spécification du profil MHD. Le corps de la réponse doit être un Bundle de type `transaction-response` avec un élément `entry` pour chaque ressource reçue dans le Bundle de la requête, dans le même ordre, avec le résultat du traitement de l'élément.

Le corps de la réponse doit être conforme au profil [ProvideDocumentBundleResponse]({{site.data.fhir.ver.iheitimhd}}/IHE.MHD.ProvideDocumentBundleResponse) ([exemple de contenu d'un payload](Bundle-a9c10f8a-882d-4000-a280-7150e0aeb478.json.html)).

Ce flux sert à communiquer un succès ou un échec.
Un succès n'est indiqué que lorsque le ou les documents sont reçus, complètement traités et conservés selon les besoins de la configuration du gestionnaire de partage de documents.

Dans le cas d'un **remplacement**, la réponse contient une entrée pour chaque ressource soumise, y compris le résultat de l'opération `PATCH` sur l'ancienne fiche. Si l'une des opérations échoue (par exemple si l'ancienne fiche est introuvable ou déjà `superseded`), l'ensemble de la transaction est rejeté.

Les messages de warning concernant le traitement des associations entre fiches, l'élément `DocumentReference.relatesTo`, ou le traitement des classeurs sont définis par le profil MHD.
