proof
=====

Caml project which recognize proof in human language and verify it in caml.

<<<<<<< HEAD
			---===<<< Structure du projet >>>===---

3 dossiers principaux : Examples, Code, Doc

-- Examples:
Dans ce dossier se trouvent plusieurs fichiers de règle et de preuve permettant de mettre à l'oeuvre le programme checker. Les fichiers de règles comportent l'extension .rls tandis que les fichiers de preuve sont nommés en .prf.

-- Code:
ci sont regroupés les fichiers sources de notre projet, ainsi qu'un fichier de configuration Makefile permettant la bonne compilation de notre code ainsi qu'un fichier use.ml lançant les fichiers les uns après les autres.


	--- lang.ml
Ce fichier permet l'analyse syntaxique des fichiers textuels. Il définit ainsi les entités qu'il rencontre suivant des définitions de types que nous avons renseigné. Sans s'assurer de leur bonne utilisation dans le fichier.

	--- lexer.mll 
Ce fichier analyse les données transmises par lang.ml et indique si leur utilisation est correcte dans un contexte donné en soumettant chaque entité transmise par land.ml à une batterie de test auquel il doit trouver une correspondance. S'il n'y en a pas, un message d'erreur apparait.

	--- parser.mly
Ce fichier transmet les informations dans un langage codé pour l'affichage LaTeX.

-- Doc:
Ce dossier contient un premier exemple d'un document LaTeX à générer. Nous utiliserons un fichier main.tex statique qui contiendra des informations classiques de présentation ainsi qu'un fichier proof.tex qui contiendra la preuve générée via CAML dans un format compréhensible pour LaTeX.


			---===<<< PLANNING >>>===---
Semaine 1 (10/11/14) 
	--> Compréhension du sujet
	--> Ajout de la reconnaissance de l'équivalence et de l'implication dans le fichier parser.mly
	--> Mise à jour du README (Composition du projet, Planning)
	--> Mise en place du Github du projet (choix du gestionnaire de version Git)
	--> Apprentissage des bases de LaTeX (et installation des outils relatifs)

Questions :
	--> mini.prf est-il juste ? (Non ..)
	--> mini.rls, que représente le C ? Une expression peut elle exister dans la règle sans qu'elle figure sur la liste des séquents ?

Semaine 2 (17/11/14)
	-->
=======
>>>>>>> 6c376b383ed966e8dee9c6ebe8e2630d4f0f8af3
