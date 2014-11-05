IMAGE_NAME="ruby_app"
CONTAINER_NAME="test_app"
PORT_OUT=3100
all: image

image:
	docker build --rm -t $(IMAGE_NAME) .
run:
	docker run \
	-p 127.0.0.1:$(PORT_OUT):3000 \
	--hostname=$(CONTAINER_NAME) \
	--name=$(CONTAINER_NAME) \
	-d -t $(IMAGE_NAME)
