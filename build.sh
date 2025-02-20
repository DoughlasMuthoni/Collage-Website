
#!/bin/sh

#exits an error
set -o errexit 

echo "Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

echo "Applying migrations..."
python manage.py migrate --noinput

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Build process completed!"
