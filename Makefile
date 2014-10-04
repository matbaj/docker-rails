IMAGE_NAME="container"
APP_NAME='container_example'
APP_REPO=https://github.com/matbaj/container_example.git
ROOT_PASSWORD=password


all: image

image:
	cpp -x c -std=c90 -DAPP_NAME=$(APP_NAME) -DAPP_REPO=$(APP_REPO) -DROOT_PASSWORD=$(ROOT_PASSWORD) Dockerfile.in | docker build -t $(IMAGE_NAME) - 
