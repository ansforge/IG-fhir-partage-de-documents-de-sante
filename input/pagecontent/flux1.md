
### Ajout d’un lot de documents

Ce flux permet l’ajout ou le remplacement d’un document au dossier patient. Cette demande de modification est faite par le producteur de documents.

### Construction du flux

Ce flux se base sur la requête de la transaction IHE "Provide Document Bundle [ITI-65]" du profil MHD.

La première étape de la construction du flux 01 de la demande de modification du dossier patient consiste à organiser son contenu dans une ressource Bundle. Un profil spécifique dérivé du profil IHE MHD v4.0.1 « ComprehensiveProvideDocumentBundle » est créé pour ce volet et nommé [PDSm_ComprehensiveProvideDocumentBundle](StructureDefinition-PDSmComprehensiveProvideDocumentBundle.html).

Le flux doit contenir :
* une ressource de type « List » représentant le lot de soumission (profil [PDSm_SubmissionsSetComprehensive](StructureDefinition-pdsmsubmissionsetcomprehensive.html))
* une à plusieurs ressources de type « DocumentReference », représentant les fiches de documents (profil [PDSm_ComprehensiveDocumentReference](StructureDefinition-PDSmComprehensiveDocumentReference.html)),
* zero à plusieurs ressources « Binary » représentant les documents envoyés dans le flux,
* zero à plusieurs ressources de type « List » représentant les classeurs.

Dans le cas d’un dépôt d’un nouveau document, l’élément DocumentReference.content.attachment.url doit pointer vers une ressource Binary, représentant le document, présente dans le flux.

Dans le cas d’une demande de mise à jour d’un document par remplacement, l’élément DocumentReference.relatesTo doit être renseigné afin d’indiquer le lien avec un DocumentReference existant et de préciser la nature de la mise à jour. L’élément DocumentReference.content.attachment.url doit pointer vers une ressource Binary, représentant le document qui remplace l’ancien, présente dans le flux.

Dans le cas d’une mise à jour d’un [classeur](StructureDefinition-PDSmFolderComprehensive.html), comme List.status ou List.entry pour reclasser des documents, une nouvelle version de la ressource List est envoyée.

Le corps du flux 01 est une ressource "Bundle" de type "transaction" encapsulant toutes les ressources listées précédemment. Cet objet de type JSON ou XML sera envoyé dans le contenu de la requête HTTP POST.

A la réception de la demande, le gestionnaire de partage de documents doit valider les ressources et répondre avec un HTTP Code statut