# Odin-edt

## WARNING 🚧

Script actuellement en cours de développement.  
Ne pas suivre le `README` pour l'instant.  

## Note

Ces script sont fait à l'arrache, n'en attendez pas trop d'eux.  
Il n'y a pour l'instant aucune gestion des erreurs.  
Et si vous ne rentrez pas bien vos identifiants rien ne vous le dira.

## Installation

```sh
cd ~/
git clone https://github.com/LSDeia/Odin-edt.git
mv Odin-edt .odin-edt
```

Ajouter cette ligne à votre .bashrc ou .zshrc ` export PATH=~/.odin-edt:$PATH`

## Configuration

Il est possible de créer un fichier `edt.conf` et d'ajouter son login dans la première ligne pour eviter d'avoir à le renseigner à chaque téléchargement de l'emploi du temps. 
Ce fichier doit se trouver dans `~/.odin-edt/config/edt.conf`.  
Votre mot de passe vous sera toujours demandé par soucis de sécurité.

## To Do List

- [ ] Revoir l'achitecture des fichiers
- [ ] Check mot de passe et identifiant bon
- [ ] Option pour afficher l'emploi du temps de demain
- [ ] Check erreur 'pas de cours sur les semaines à venir'
