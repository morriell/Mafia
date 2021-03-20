
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import mysql.connector

from flask import current_app as app, g
from random import choice
from string import ascii_lowercase


def get_db():
    if 'db' not in g:
        g.connector = mysql.connector.connect(
            user = app.config['MYSQL_USER'],
            password = app.config['MYSQL_PASS'],
            host = app.config['MYSQL_HOST'],
            database = app.config['MYSQL_DB']
            )
        g.db = g.connector.cursor()

    return g.db


def close_db(e=None):
    db = g.pop('db', None)

    if db is not None:
        db.close()


def init_db():
    get_db()

def init_app(app):
    app.teardown_appcontext(close_db)

def execute_update_query(query):
    db = get_db()
    db.execute(query)
    g.connector.commit()
    return

def execute_query(query):
    db = get_db()
    db.execute(query)
    row_headers = [i[0] for i in db.description]
    results = db.fetchall()

    result_arr = []
    for result in results:
        result_arr.append(dict(zip(row_headers, result)))
    return result_arr



def get_players():
    query = ('''SELECT * FROM Players''')
    return execute_query(query)

# TODO: replace it with a name generator
def generate_login(length):
    letters = ascii_lowercase
    result_str = ''.join(choice(letters) for i in range(length))
    return result_str

def set_new_logins():
    players = get_players()

    # TODO use a single query
    # TODO add check of logins is uniq
    for player in players:
        login = generate_login(5)
        query = 'UPDATE Players SET login="' + login + '" WHERE id=' + str(player['id']) + ';'
        # TODO add error processing here
        execute_update_query(query)
    return
