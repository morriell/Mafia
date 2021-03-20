#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from subprocess import Popen, PIPE

from flask import current_app as app
from flask import render_template, request, Response, send_from_directory, redirect, url_for
from project.db import get_db, get_players, set_new_logins


#import json
#import os
#import re


# Serve React App
@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def serve(path):
    if path != "" and os.path.exists(app.static_folder + '/' + path):
        return send_from_directory(app.static_folder, path)
    else:
        return send_from_directory(app.static_folder,'index.html')

@app.route('/admin/list_players')
def list_players():
    players = get_players()
    return render_template('players_list.html', players=players)

@app.route('/admin/update_logins')
def update_logins():
    set_new_logins()
    return redirect(url_for('list_players'))