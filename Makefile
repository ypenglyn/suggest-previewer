
.PHONY:
	help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build:	## build docker image
	@docker build -t test/suggest:20170903 .

run:	## test docker images
	@docker run -itd --rm --name suggest  -p 80:80 test/suggest:20170903

login:	## login to docker container with bash
	@docker exec -it suggest bash

clean:	## clean docker containers
	@docker rm -f suggest
@docker rmi -f test/suggest:20170903
