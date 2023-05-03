.PHONY: build publish

all: help
help:
	@echo "make build ......... build yankelscialom/ssmtp image"
	@echo "make publish ....... publish yankelscialom/ssmtp image to dockerhub"

build:
	docker build -t "yankelscialom/ssmtp:$(shell git describe --tags)" .
	docker tag "yankelscialom/ssmtp:$(shell git describe --tags)" yankelscialom/ssmtp:latest

publish: build
	docker push "yankelscialom/ssmtp:$(shell git describe --tags)"
	docker push yankelscialom/ssmtp:latest
