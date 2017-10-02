# Modelos de AgendAT

from flask_user import UserMixin
from flask_user.forms import RegisterForm
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, validators
from app.application import db

# Client Model
class Contacto(db.Model):
    __tablename__ = 'contacto'
    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(150), nullable=False)
    apellido = db.Column(db.String(150), nullable=False)
    telefono = db.Column(db.String(30))
    domicilio = db.Column(db.String(120))


# Define the Contacto search form
class ContactoSearchForm(FlaskForm):
    nombre = StringField(validators=[validators.DataRequired('Este campo no puede estar vacío')])
    submit = SubmitField('Search')
