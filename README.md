# simple-webpage
Visualize Avengers Heroes Data


Nume: Trifu Loredana

Proiect: Visualize Avengers Heroes Data este o pagina web simpla care afiseaza eroii din Avengers, detalii despre fiecare erou care pot fi accesate prin adresa URL cu ID erou si prin cautare in formularul search din pagina. Codul si tehnologiile utilizate sunt descrise mai jos.

Tehnologiile utilizate sunt: Python/Flask, HTML, JavaScript, CSS, Postgresql.
Pasii urmati pentru crearea paginii web:
Am creat tabelele in baza de date utilizand PostgreSQL cu id primary key si constraints pentru ca id-ul sa fie unic, sa fie numar si sa se genereze automat. De asemenea, prin foreign_key am creat o legatura intre cele doua tabele. La pasul 2 am importat baza de date prin conexiunea psycopg2. Am importat framework-ul flask si am creat aplicatia in fisierul avengers_heroes.py. In acest fisier am creat toate rutele cu functiile aferente, unele cu rolul de a selecta informatii din baza de date si a returna template-ul html, altele doar cu rol de returnare template. Am creat layout.html care se va aplica la toate fisierele html prin inserare extindere layout.html in cod jinja. In fisiere HTML s-a folosit cod jinja pentru preluare date sub forma de variabila inserata la render_template. Aceste variabile s-au folosit in cod jinja si s-au accesat prin conditional statement (if...else) sau for loop. Pozele petru fiecare erou au fost preluate de asemenea din baza de date. Textului din fisierele HTML am aplicat difertie stiluri in CSS prin fisierul static style.css. De asemenea, formularul din pagina 'Contact' a fost validat in Javascript prin fisierul static script.js.

Pentru initializarea proiectului trebuie rulat scriptul queries.sql pe baza de date.

