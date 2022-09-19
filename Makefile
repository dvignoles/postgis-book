setup: requirements.txt
	pip install -r requirements.txt

docker-up: docker-compose.yaml
	docker compose up -d

load-dvd:
	docker exec -t postgis-book-db-1 /bin/bash -c "createdb -h localhost -U docker -p 5432 --owner docker dvdrental"
	docker exec -t postgis-book-db-1 /bin/bash -c "/usr/bin/pg_restore -h localhost -U docker -p 5432 -d dvdrental -w --clean --if-exists /opt/data/dvdrental.tar"