#!/bin/bash

phpsessidnul=""
value=""
ticket=""
phpsessid=""

read user
read password

odin(){
curl 'https://odin.iut.uca.fr/' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Accept-Language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'Connection: keep-alive' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua: "Chromium";v="105", "Not)A;Brand";v="8"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  --compressed
echo "🟢 [[Odin request]]"
}

portail(){
curl 'https://odin.iut.uca.fr/portail' --compressed
echo "🟢 [[Portail request]]"
}

portail2(){
phpsessidnul=$(curl 'https://odin.iut.uca.fr/portail/' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Accept-Language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'Connection: keep-alive' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua: "Chromium";v="105", "Not)A;Brand";v="8"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  --compressed -v --stderr - | grep -P 'PHPSESSID' | cut -d ' ' -f 3 | cut -d ';' -f 1)
echo "🟢 [[Portail2 request]]"
}

loginservice(){
value=$(curl 'https://ent.uca.fr/cas/login?service=https%3A%2F%2Fodin.iut.uca.fr%2Fportail%2F' \
  -H 'authority: ent.uca.fr' \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'sec-ch-ua: "Chromium";v="105", "Not)A;Brand";v="8"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  -H 'sec-fetch-dest: document' \
  -H 'sec-fetch-mode: navigate' \
  -H 'sec-fetch-site: none' \
  -H 'sec-fetch-user: ?1' \
  -H 'upgrade-insecure-requests: 1' \
  -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36' \
  --compressed --stderr - | grep -oP "[a-zA-Z0-9]{8}[-]{1}[a-zA-Z0-9\-\_]+")
echo "🟢 [[Login Service]]"
}

login(){
ticket=$(curl 'https://ent.uca.fr/cas/login' \
  -H 'authority: ent.uca.fr' \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'cache-control: max-age=0' \
  -H 'content-type: application/x-www-form-urlencoded' \
  -H 'cookie: org.springframework.web.servlet.i18n.CookieLocaleResolver.LOCALE=fr-FR' \
  -H 'origin: https://ent.uca.fr' \
  -H 'referer: https://ent.uca.fr/cas/login?service=https%3A%2F%2Fodin.iut.uca.fr%2Fportail%2F' \
  -H 'sec-ch-ua: "Chromium";v="105", "Not)A;Brand";v="8"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  -H 'sec-fetch-dest: document' \
  -H 'sec-fetch-mode: navigate' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-user: ?1' \
  -H 'upgrade-insecure-requests: 1' \
  -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36' \
  --data-raw "username=$user&password=$password&execution=$value%3D&_eventId=submit&geolocation=&submit=SE+CONNECTER" \
  --compressed -v --stderr - | grep -P 'ST-' | cut -d ' ' -f 3)
echo "🟢 [[Login Request]]"
}

ticket(){
phpsessid=$(curl "$ticket" \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Accept-Language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'Cache-Control: max-age=0' \
  -H 'Connection: keep-alive' \
  -H "Cookie: $phpsessidnul" \
  -H 'Referer: https://ent.uca.fr/' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: same-site' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua: "Chromium";v="105", "Not)A;Brand";v="8"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  --compressed -v --stderr - | grep -oP 'PHPSESSID\=[a-zA-Z0-9]{40,200}')
echo "🟢 [[Ticket Request]]"
}

edt(){
curl 'https://odin.iut.uca.fr/etudiants/index.php' -X POST -H "Cookie: $phpsessid" --data-raw 'bind=doing&edt=lazy' -v
echo "🟢 [[Edt Request]]"
}

summary(){
echo '--------------- SUMMARY ---------------'
echo $phpsessidnul
echo $value
echo $ticket
echo $phpsessid
echo '---------------------------------------'
}

odin
portail
portail2
loginservice
login $user $password $value
ticket=$(echo $ticket | sed 's/\r$//')
ticket $ticket $phpsessidnul
edt $phpsessid