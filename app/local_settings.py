# Copiar y pegar esto en un local_settings.py
import os

# *****************************
# Environment specific settings
# *****************************

# DO NOT use "DEBUG = True" in production environments
DEBUG = True

# DO NOT use Unsecure Secrets in production environments
# Generate a safe one with:
#     python -c "import os; print repr(os.urandom(24));"
SECRET_KEY = '1a2s3d4f'

# SQLAlchemy settings
SQLALCHEMY_DATABASE_URI = 'postgresql+psycopg2://postgres:postgres@db/contactask'
SQLALCHEMY_TRACK_MODIFICATIONS = False    # Avoids a SQLAlchemy Warning

