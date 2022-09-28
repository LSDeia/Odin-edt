# Odin-edt

## Hypothèse

Comment récupérer l'edt:

    - cas login page -> input value
    - login + input value -> requete ticket
    - requete ticket -> phpsessid
    - phpsessid + data -> edt

## CURL

Requête pour avoir l'html de l'emploi du temps:
```sh
curl 'https://odin.iut.uca.fr/etudiants/index.php' -X POST -H 'Cookie: PHPSESSID=eaef138d679oi7ea3d84ec96121413471b93ee15e6b599b596e2daf6a7030065' --data-raw 'bind=doing&edt=lazy'
```
_ceci n'est pas un vrai PHPSESSID :)_
