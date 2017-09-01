# This file defines command line commands for manage.py
#
# Copyright 2014 SolidBuilds.com. All rights reserved
#
# Authors: Ling Thio <ling.thio@gmail.com>

import datetime

from app.application import app, db
from app.models.user_models import User, Role
from app.models.app_models import Cliente

# @manager.command
def init_db():
    """ Initialize the database."""
    # Create all tables
    db.create_all()

    create_users()


def create_users():
    """ Create users """

    # Adding roles
    admin_role = find_or_create_role('admin', u'Admin')

    # Add users
    user = find_or_create_user(u'Admin', u'Example', u'admin', 'Password1', admin_role)
    user = find_or_create_user(u'User', u'Example', u'user', 'Password1')

    # Save to DB
    db.session.commit()

def find_or_create_role(name, label):
    """ Find existing role or create new role """
    role = Role.query.filter(Role.name == name).first()
    if not role:
        role = Role(name=name, label=label)
        db.session.add(role)
    return role


def find_or_create_user(first_name, last_name, username, password, role=None):
    """ Find existing user or create new user """
    user = User.query.filter(User.username == username).first()
    if not user:
        user = User(username=username,
                    first_name=first_name,
                    last_name=last_name,
                    password=app.user_manager.hash_password(password),
                    active=True)
        if role:
            user.roles.append(role)
        db.session.add(user)
    return user



