# Docker instructions for app and apache2


````
- To build the container use "docker build .\app-apache\ -t app-apache-2"

- To run the container simply use "docker container  run -i -t app-apache-2"
````

NOTE: provision script must be modified slightly as the paths in a docker container
are slightly different to the paths in my vagrant dev environment.
