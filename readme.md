# Docker instructions for app and apache2


````
- To build the container use "docker build .\app-apache\ -t abioluwade/app-apache-1"

- To run the container simply use "docker run -p 80:3000  -i -t abioluwade/app-apache-1"

````

This is the repo URL for this container: https://hub.docker.com/repository/docker/abioluwade/app-apache-2/general

And can be pulled with: docker pull abioluwade/app-apache-1:latest

This is the syntax to push it to my repo: docker login ; docker push abioluwade/app-apache-1

NOTE: It is important to start all tags with "abioluwade/" when building if I want
to push it to the repo later.


NOTE: provision script must be modified slightly as the paths in a docker container
are slightly different to the paths in my vagrant dev environment.
