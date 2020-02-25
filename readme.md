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


================================================================================

First things first lets Download the 'cloudbees build and publish' plugin which will allow us the run the image within
a docker container on the slave node specified that has the testing environment.

````
docker login;
````
first step is to do this and give the docker hub credentials

Using Jenkins master and slave nodes I will try to test the repo using webhooks
and then proceed to deploy the image to that it can be accessed publicly.

````
docker run -it -p 80:3000 -v /var/run/docker.sock:/var/run/docker.sock abioluwade/app-apache-1
````
- This command will run the image with port 80 on the machine mapped to port 3000 within the container which
the app is running on. (-d can run it in detached mode and allow the user to perform other tasks on the computer while
  the container continues to run)

````
sudo chown jenkinsslave:jenkinsslave /home/jenkinsslave/.docker -R
sudo chmod g+rwx "/home/jenkinsslave/.docker" -R

````
Login and logout for the above to take effect. (jenkinsslave is the name of the user in this instance)

````
sudo chmod 777 /var/run/docker.sock
````

to change the permissions so docker daemon can be accessed via Jenkins


So the CI pipeline will listen to the repo, and then test any changes by building from the Dockerfile in the repo
if this successfully builds, the next step which is CD will start and deploy the image onto the production server.
