#!/usr/bin/env bash
# Salir si ocurre algún error
set -o errexit

# Instalar dependencias
pip install -r requirements.txt

# Recopilar archivos estáticos
python manage.py collectstatic --no-input

# Aplicar migraciones a la base de datos
python manage.py migrate

# Crear superusuario automáticamente si se definen las variables de entorno
if [[ $CREATE_SUPERUSER ]]; then
  python manage.py createsuperuser --no-input || true
fi
