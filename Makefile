## publish build to gh-pages branch
publish:
	ghp-import -n -p -f postgis/_build/html

## install requirements into conda environment
setup: requirements.txt
	mamba install -c conda-forge -c pyviz --file requirements.txt

## start database docker
docker-up: docker-compose.yaml
	docker compose up -d

## build static files for new/changed
build:
	jupyter-book build postgis/

## build static files for everything
build-all:
	jupyter-book build --all postgis/

## clean up any builds
book-clean:
	jupyter-book clean postgis/

## load dvd database into running docker database
load-dvd:
	docker exec -t postgis-book-db-1 /bin/bash -c "psql -h localhost -U docker -p 5432 -d gis -c \"DROP DATABASE IF EXISTS dvdrental;\""
	docker exec -t postgis-book-db-1 /bin/bash -c "createdb -h localhost -U docker -p 5432 --owner docker dvdrental"
	docker exec -t postgis-book-db-1 /bin/bash -c "pg_restore -h localhost -U docker -p 5432 -d dvdrental -w --clean --if-exists /opt/data/dvdrental.tar"

## create restaurants database in running docker database
create-restauraunts-db:
	docker exec -t postgis-book-db-1 /bin/bash -c "psql -h localhost -U docker -p 5432 -d gis -c \"DROP DATABASE IF EXISTS restaurants;\""
	docker exec -t postgis-book-db-1 /bin/bash -c "createdb -h localhost -U docker -p 5432 --owner docker restaurants"
