# Odin-edt

## Hypothèse

Comment récupérer l'edt:

    - cas login page -> input value
    - login + input value -> requete ticket
    - requete ticket -> phpsessid
    - phpsessid + data -> edt

## CURL

Requête pour avoir le value super long:
```sh
curl 'https://ent.uca.fr/cas/login?service=https%3A%2F%2Fodin.iut.uca.fr%2Fportail%2F' --stderr - | grep -oP "[a-zA-Z0-9]{8}[-]{1}[a-zA-Z0-9]{4}[a-zA-Z0-9\-\_\=]+"
```

Requête pour avoir l'html de l'emploi du temps:
```sh
curl 'https://odin.iut.uca.fr/etudiants/index.php' -X POST -H 'Cookie: PHPSESSID=eaef138d679oi7ea3d84ec96121413471b93ee15e6b599b596e2daf6a7030065' --data-raw 'bind=doing&edt=lazy'
```
_ceci n'est pas un vrai PHPSESSID :)_
