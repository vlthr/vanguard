SHELL:=/bin/bash
default: run

run:
	docker network ls | grep -w "vanguard-bridge" > /dev/null; if [[ "$$?" != 0 ]]; then docker network create -d bridge vanguard-bridge; fi
	docker-compose -f development.yml up -d

build:
	# cd client && npm run build
	docker build -t vanguard.image .

stop:
	docker-compose -f development.yml kill || true

clean:
	docker-compose -f development.yml kill || true
	docker-compose -f development.yml rm -f || true

refresh:
	make clean && make build . && make && docker logs -f vanguard_vanguard_1
