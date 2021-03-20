
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import mysql.connector

from flask import current_app as app, g


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
