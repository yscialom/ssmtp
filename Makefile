.PHONY: build publish

all: help
help:
	@echo "make build ......... build yankelscialom/ssmtp image"
	@echo "make publish ....... publish yankelscialom/ssmtp image to dockerhub"

build:
	docker build -t "yankelscialom/ssmtp:$(shell git describe)" .
	docker tag "yankelscialom/ssmtp:$(shell git describe)" yankelscialom/ssmtp:latest

publish:
	docker push "yankelscialom/ssmtp:$(shell git describe)" yankelscialom/ssmtp:latest
