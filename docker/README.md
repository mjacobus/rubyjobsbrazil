Learn docker
--------------

## Docker commands



- `docker build -t image/name .` - Creates an image

- `docker run -d -p 80:80 image/name` Run a new "instance" of the image exposing local port 80 with container port 80

- `docker run -d -p 80:80` --name alias image/name

- `docker exec` - can run a command inside of an existing container


## Volumes

- Assign volumes with -v
- Can be shared amongst containers
- can mount data from the host file system


## Mac installation

boot2docker up
$(boot2docker shellinit)
boot2docker ip

- [tutorial](https://www.youtube.com/watch?v=pGYAg7TMmp0&list=PLoYCgNOIyGAAzevEST2qm2Xbe3aeLFvLc)
- [video](https://www.youtube.com/watch?v=K6WER0oI-qs)
- [Dockerize all things](http://www.slideshare.net/ctankersley/dockerize-all-the-things)
- [rails example](https://docs.docker.com/compose/rails/)
- [compose](https://docs.docker.com/compose/compose-file/)
- [cli](https://docs.docker.com/compose/reference/)

Or

[Docker beta](https://beta.docker.com/)
