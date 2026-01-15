.PHONY: build run stop remove migrate createsuperuser shell clean

CONTAINER_NAME=django-login-app
IMAGE_NAME=django-login-app

build:
	docker build -t $(IMAGE_NAME) .

run:
	-docker stop $(CONTAINER_NAME)
	-docker rm $(CONTAINER_NAME)
	docker run -d --name $(CONTAINER_NAME) -p 8000:8000 $(IMAGE_NAME)

stop:
	-docker stop $(CONTAINER_NAME)

remove:
	-docker rm $(CONTAINER_NAME)

migrate:
	docker run --rm $(IMAGE_NAME) python manage.py migrate

createsuperuser:
	docker run -it --rm $(IMAGE_NAME) python manage.py createsuperuser

shell:
	docker run -it --rm $(IMAGE_NAME) python manage.py shell

clean:
	-docker stop $(CONTAINER_NAME)
	-docker rm $(CONTAINER_NAME)
	-docker rmi $(IMAGE_NAME)
