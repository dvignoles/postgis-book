publish:
	ghp-import -n -p -f postgis/_build/html

setup: requirements.txt
	mamba install -c conda-forge -c pyviz --file requirements.txt

docker-up: docker-compose.yaml
	docker compose up -d

build:
	jupyter-book build postgis/

build-all:
	jupyter-book build --all postgis/

load-dvd:
	docker exec -t postgis-book-db-1 /bin/bash -c "psql -h localhost -U docker -p 5432 -d gis -c \"DROP DATABASE IF EXISTS dvdrental;\""
	docker exec -t postgis-book-db-1 /bin/bash -c "createdb -h localhost -U docker -p 5432 --owner docker dvdrental"
	docker exec -t postgis-book-db-1 /bin/bash -c "pg_restore -h localhost -U docker -p 5432 -d dvdrental -w --clean --if-exists /opt/data/dvdrental.tar"

create-restauraunts-db:
	docker exec -t postgis-book-db-1 /bin/bash -c "psql -h localhost -U docker -p 5432 -d gis -c \"DROP DATABASE IF EXISTS restaurants;\""
	docker exec -t postgis-book-db-1 /bin/bash -c "createdb -h localhost -U docker -p 5432 --owner docker restaurants"