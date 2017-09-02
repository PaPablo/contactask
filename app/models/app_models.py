# Modelos de AgendAT

from flask_user import UserMixin
from flask_user.forms import RegisterForm
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, validators
from app.application import db

# Client Model
class Cliente(db.Model):
    __tablename__ = 'clientes'
    cod_client= db.Column(db.Integer)
    cod_prov = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(150), nullable=False)
    contacto = db.Column(db.String(30))
    cuit_docum = db.Column(db.String(30))
    telefono = db.Column(db.String(30))
    cod_post = db.Column(db.String(8))
    domicilio = db.Column(db.String(40))
    localidad = db.Column(db.String(40))
    fax = db.Column(db.String(15))
    cat_contri = db.Column(db.Integer, nullable=False)
    nro_cuit = db.Column(db.String(14))
    banco = db.Column(db.String(26))
    sucursal = db.Column(db.String(13))
    nro_cta = db.Column(db.String(13))
    observaciones = db.Column(db.String(5000))
    es_proveedor = db.Column(db.Boolean)
    es_cliente = db.Column(db.Boolean)
    saldo_actual = db.Column(db.Float(precision=2))
    saldo_al_dia = db.Column(db.Float(precision=2))
    primer_ope = db.Column(db.String(13))
    tipo_activ = db.Column(db.String(13))
    fecha_sactl = db.Column(db.String(13))
    seguideuda = db.Column(db.String(13))
    email = db.Column(db.String(13))
    es_moroso = db.Column(db.String(13))
    nombre2 = db.Column(db.String(13))

    def __iter__(self):
        for attr, value in  self.__dict__.items():
            yield attr, value




# Define the Client search form
class ClienteSearchForm(FlaskForm):
    nombre = StringField(validators=[validators.DataRequired('Este campo no puede estar vacío')])
    submit = SubmitField('Search')