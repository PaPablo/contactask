# Copyright 2014 SolidBuilds.com. All rights reserved
#
# Authors: Ling Thio <ling.thio@gmail.com>


from flask import redirect, render_template
from flask import request, url_for
from flask_user import current_user, login_required, roles_accepted

from flask.ext.wtf import Form
from wtforms.ext.sqlalchemy.orm import model_form
from sqlalchemy import func
from app.application import app, db
from app.models.user_models import UserProfileForm
from app.models.app_models import Contacto, ContactoSearchForm

# The Home page is accessible to anyone
@app.route('/')
def home_page():
    return render_template('pages/home_page.html')


# The User page is accessible to authenticated users (users that have logged in)
@app.route('/user')
@login_required  # Limits access to authenticated users
def user_page():
    return render_template('pages/user_page.html')


# The Admin page is accessible to users with the 'admin' role
@app.route('/admin')
@roles_accepted('admin')  # Limits access to users with the 'admin' role
def admin_page():
    return render_template('pages/admin_page.html')

@app.route('/contactos', methods=['GET', 'POST'])
@login_required
def contactos_page():

    form = ContactoSearchForm(request.form, current_user)
    resultados = None
    busqueda=None
    cantidad=None

    if request.method == 'POST' and form.validate():
        form.populate_obj(current_user)
        buscar='%' + form.nombre.data.lower() +'%'
        resultados = Contacto.query.filter(Contacto.nombre.ilike(buscar) ).all()
        cantidad = len(resultados)
    # GET o invalid input
    return render_template('pages/contactos.html', 
                                form=form, 
                                contactos=resultados,
                                busqueda=form.nombre.data,
                                cantidad=cantidad)




@app.route('/pages/profile', methods=['GET', 'POST'])
@login_required
def user_profile_page():
    # Initialize form
    form = UserProfileForm(request.form, current_user)

    # Process valid POST
    if request.method == 'POST' and form.validate():
        # Copy form fields to user_profile fields
        form.populate_obj(current_user)

        # Save user_profile
        db.session.commit()

        # Redirect to home page
        return redirect(url_for('home_page'))

    # Process GET or invalid POST
    return render_template('pages/user_profile_page.html',
                           form=form)


@app.route('/contactos/<id_contacto>')
@login_required
def contacto_detail_page(id_contacto):
    
    query = Contacto.query.filter(Contacto.id == id_contacto).all()
    
    if query:
        contacto = query[0] 
    else:
        datos = None
    return render_template('pages/contacto_detail.html',contacto=contacto)

@app.route('/contacto/crear')
@login_required
def contacto_crear():
    CreateFormContacto = model_form(Contacto, Form)
    form = CreateFormContacto(request.form, None)

    print(form)

    return render_template("pages/contacto_crear.html", form=form) 