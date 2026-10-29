# Podaci o utrkama Formule 1 2026

Otvoreni skup podataka o utrkama Formule 1 u sezoni 2026. Stvoren je za predmet Otvoreno računarstvo na FER-u. Svaku utrku opisuju datum, broj krugova i staza te rezultati s podija. Podaci su spremljeni u PostgreSQL bazi podataka te izvezeni putem shell skripte.

## Metapodaci

| Svojstvo | Vrijednost |
|---|---|
| Naslov | Podaci o utrkama Formule 1 2026 |
| Opis | Rezultati utrka Formule 1 u sezoni 2026. |
| Autor | Dominik Lovrić |
| Licencija | Creative Commons Attribution 4.0 International (CC BY 4.0) |
| Verzija | 1.0 |
| Jezik podataka | engleski |
| Baza podataka | PostgreSQL |
| Character encoding | UTF-8 |
| Formati | CSV, JSON, PostgreSQL dump |
| Datum | 2026-10-28 |
| Ključne riječi | Formula 1, F1, utrke, staze, vozači |

## Podaci

Skup podataka ima 15 atributa. Nazivi stupaca u CSV datoteci i ključevi u JSON datoteci su identični.

Skup sadrži vezu roditelj–dijete između utrka i rezultata: jedna utrka ima više rezultata (po jedan za svakog vozača s podija). U JSON datoteci je to prikazano poljem `results` unutar svake utrke, a u CSV datoteci se podaci o utrci ponavljaju u svakom retku rezultata.

| Atribut | Tip | Opis |
|---|---|---|
| race_name | string | Naziv utrke, npr. "Australian Grand Prix" |
| season | integer | Godina sezone prvenstva u kojoj se održala utrka |
| round | integer | Redni broj utrke u prvenstvu |
| race_date | date | Datum održavanja utrke |
| laps | integer | Broj krugova utrke |
| circuit_name | string | Naziv staze |
| circuit_country | string | Država u kojoj se staza nalazi |
| circuit_length_km | decimal | Duljina jednog kruga staze u kilometrima |
| driver_name | string | Ime vozača |
| driver_surname | string | Prezime vozača |
| driver_nationality | string | Nacionalnost vozača |
| constructor | string | Naziv momčadi za koju je vozač vozio u utrci |
| position | integer | Plasman vozača, prazno ako vozač nije završio utrku |
| points | decimal | Bodovi prvenstva koje je vozač osvojio zbog plasmana |
| status | string | Status završetka utrke, npr. "Finished" |

## Napomene

- Uključena su samo tri prva vozača svake utrke.
- Rezultate imaju samo utrke koje su bile održane do objave ove verzije; baza sadrži i utrke bez rezultata te vozače i staze koji nisu u izvezenim datotekama.
- Podaci su uneseni ručno i mogu sadržavati pogreške. Ispravci su dobrodošli kao issue u ovom repozitoriju.
- Ovaj skup podataka nije služben i nije povezan s Formulom 1 niti s FIA-om. Nazivi i oznake Formule 1 vlasništvo su njihovih vlasnika.

## Licencija

Ovaj skup podataka objavljen je pod licencijom Creative Commons Attribution 4.0 International (CC BY 4.0). Podatke je dopušteno dijeliti i prilagođavati u bilo koju svrhu, uključujući komercijalnu, uz navođenje autora. Cjeloviti tekst licencije nalazi se u datoteci `LICENSE`.
