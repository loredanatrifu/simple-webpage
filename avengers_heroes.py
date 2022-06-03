import psycopg2
from flask import Flask, render_template, request

app = Flask('My first webapp')

conn = psycopg2.connect(
    host="localhost",
    database="mydb",
    user="postgres",
    password="postgres")


@app.route('/')
@app.route('/home/')
def home():
    """Shows the home page"""

    return render_template('home.html', title='Avengers Heroes')


@app.route('/avengers/')
def show_heroes():
    """Shows the avengers heroes"""

    with conn:
        query = """
            select
                d.id, d.strengths, d.eyes_color,
                h.id, h.hero_name
                from description d
                join "heroes" h on d.heroes_id = h.id;
        """
        c = conn.cursor()
        c.execute(query)
        records = c.fetchall()
    return render_template('avengers.html', heroes=records)


@app.route('/hero/<int:hero_id>/')
def show_hero(hero_id):
    """For searching the hero after id"""

    with conn:
        query = """
            select
                d.id, d.strengths, d.date_of_birth, d.eyes_color, d.height, d.greatest_enemies, d.image,
                h.id, h.hero_name
                from description d
                join "heroes" h on d.heroes_id = h.id
                where h.id = %s::integer;
        """
        c = conn.cursor()
        c.execute(query, (hero_id,))
        record = c.fetchone()
        # print(record)
    return render_template('hero.html', hero=record)


@app.route('/movies/')
def show_gallery():
    """Shows the avengers heroes pictures"""

    with conn:
        query = """
               select
                   m.id, m.movie_name, m.launching_year, m.images
                   from movies m;
           """

        c = conn.cursor()
        c.execute(query)
        records = c.fetchall()
        # print(records)
    return render_template('movies.html', movies=records)


@app.route('/search/', methods=['GET', 'POST'])
def search():
    """Searching the heroes after parts of their name or full name"""

    if request.method == 'POST':
        srch = request.form
    else:
        srch = request.args

    with conn:
        query = """
            select
                h.id, h.hero_name
                from heroes h;
        """
        c = conn.cursor()
        c.execute(query)
        records = c.fetchall()
        # print(records, type(records))
        name = srch.get('name').lower()
        temp_hero = {}

        for h in records:
            if name in h[1].lower():
                temp_hero[h[0]] = h[1]
            else:
                'There is no Avenger with that name!'
        return render_template('search.html', heroes=temp_hero)


@app.route('/contact/')
def contact():
    """Shows the contact information and contain a form for sending message"""

    return render_template('contact.html')


@app.errorhandler(404)
def page_not_found(r):
    """For catching routes errors"""
    return render_template('catch_error.html'), 404, r


if __name__ == '__main__':
    app.run(debug=True)
