#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os

from flask import Flask

import config  # noqa: F401
from project import db


def create_app():
    app = Flask(__name__, static_folder='static')
    configure_app(app)

    db.init_app(app)

    with app.app_context():
        db.init_db()
        from project import routes  # noqa: F401

    return app


def configure_app(app):
    config_names = {
        "base": "config.BaseConfig",
    }

    try:
        app.config.from_object(config_names[os.getenv("CONF_NAME", 'base')])
    except LookupError:
        print("Invalid configuration name. Use 'base' instead.")
        app.config.from_object(config_names['base'])


