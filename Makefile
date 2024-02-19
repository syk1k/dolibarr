build-app:
	docker build -t dolibarr-app . 

run:
	docker run -d -p 8088:80 dolibarr-app

build-dev:
	docker compose -f dev.yml build