Dans le dossier Projet, on a :
- Le dossier BDD de depart contenant tous les fichiers de base à traiter 
- Le dossier GRAPHIQUE contenant les graphiques générés
- Le dossier KTR contenant toutes les transformations effectuées
	- Le dossier Fact contenant la construction des schémas en étoile sur mysql
	- Le dossier Jointure contenant les jointures entre crime et chacun des autres faits pour faire nos ratios
	- Le dossier Region contenant tous les groupements des departements par regions et le fichier principal lié 		  aux crimes allRegions
- Le dossier CSV contenant tous les csv créés 
- Le dossier SCRAP contenant les codes pythons pour scrapper les données

Pour tester les transformations, ne pas oublier de mettre à jour le chemin des extract. (Parfois, il faut peut-être aussi rechercher le fichier dans un autre répertoire car on a parfois réarranger les dossiers pour plus de clarté)
