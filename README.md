docker-rails
============

Dockerfile for rails application with rvm and capistrano


## Usage

Fill files/authorized_keys and add key for deployer in files/deployer.
Edit variables in Makefile and run:

```
make
```

When finish building image run:
```
make run
```



### Requirements
* make
* docker
