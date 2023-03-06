!#/bin/bash
python manage.py migrate --noinput
python manage.py createsuperuser --noinput --username $DJANGO_SUPERUSER_USERNAME --email $DJANGO_SUPERUSER_EMAIL
python manage.py collectstatic --noinput
gunicorn UpTraderTZ.wsgi:application --bind 0.0.0.0:8000 -w 4