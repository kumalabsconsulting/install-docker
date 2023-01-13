

##############################################################################
# DOCKER BUILD
##############################################################################


docker build -t friendlyname .                      # Create image using this directory's Dockerfile
docker build -t friendlyname -f /tmp/MYDOCKERFILE   # Create image using full path to another Dockerfile
docker tag <image> username/repository:tag          # Tag <image> for upload to registry
docker push username/repository:tag                 # Upload tagged image to registry - Don't forget to Login 1st ^^
docker login                                        # Log in this CLI session using your Docker credentials


##############################################################################
# DOCKER CONTAINERS
##############################################################################


docker container run -p 4000:80 friendlyname    # Run "friendlyname" mapping port 4000 to 80
docker container run -d -p 4000:80 friendlyname # Same thing, but in detached mode
docker exec -it [container-id] bash             # Enter a running container
docker container ls                             # See a list of all running containers
docker stop <hash>                              # Gracefully stop the specified container
docker ps -a                                    # See a list of all containers, even the ones not running (old cmd version)
docker container start <Co­­nt­a­i­ne­­r>              # Démarre le conteneur
docker container stop <Co­­nt­a­ine­r>               # Arrête un conteneur en cours d'exéc­ution
docker container restart <Co­­nt­a­i­ne­­r>            # Redémarre le conteneur
docker pause <Co­­nt­a­i­ne­­r>                        # Suspend tous les processus du conteneur
docker unpause <Co­nta­ine­r>                      # Dé-suspens de tous les processus du conteneur
docker container kill <hash>                    # Force shutdown of the specified container
docker container rm <hash>                      # Remove the specified container from this machine
docker container rm <hash>                      # Remove the specified container from this machine
docker container rm -f <hash>                   # Remove force specified container from this machine
docker container rm $(docker ps -a -q)          # Remove all containers from this machine
docker container logs <container-id> -f         # Live tail a container's logs
docker container run username/repository:tag    # Run image from a registry
docker container port <container-id>            # List All port used by the container 
docker system prune                             # Remove all unused containers, networks, images (both dangling and unreferenced), and optionally, volumes. (Docker 17.06.1-ce and superior)
docker system prune -a                          # Remove all unused containers, networks, images not just dangling ones (Docker 17.06.1-ce and superior)
docker volume prune                             # Remove all unused local volumes
docker network prune                            # Remove all unused networks
docker inspect <container-id>                   # Show informations about the container-id


##############################################################################
# DOCKER IMAGE
##############################################################################


docker images -a                                # Show all images on this machine
docker rmi <imagename>                          # Remove the specified image from this machine
docker rmi $(docker images -q)                  # Remove all images from this machine

##############################################################################
# DOCKER VOLUMES
##############################################################################


docker volume prune                         # Remove all unused local volumes
docker volume ls                            # Liste les volumes
docker volume inspect <Vo­­lu­m­e>              # Contrôle le volume
docker volume create <Vo­­lu­m­e>               # Create volume
docker volume rm <Vo­­lu­m­e>                   # Remove volume
    => <Vo­lum­e> replace by ID or volume's NAME


##############################################################################
# DOCKER SYSTEM CMD 
##############################################################################


docker system df                            # Montre l'espace disque utilisé par le docker
docker system info                          # Affiche les inform­ations sur le système Docker
docker diff <co­nta­ine­r>                     # Affiche tous les fichiers qui ont été modifiés depuis le démarrage
docker top <co­nta­ine­r>                      # Afficher le résultat de la commande "­top­" des processus en cours d'exéc­ution dans un conteneur
docker stats                                # Affiche le résultat de la commande "­top­" de tous les conteneurs Docker

##############################################################################
# DOCKER USEFULL CMD 
##############################################################################


docker cp <Co­­nt­a­i­ne­­r>:­­<s­o­u­rc­­e_p­­at­h> <de­­st­_­p­at­­h>     # Copie du conteneur vers l'hôte
docker cp <so­urc­e_p­ath> <Co­nta­ine­r>:­<de­st_­pat­h>     # Copie de l'hôte au conteneur
docker exec -ti <Co­­nt­a­i­ne­­r> <En­­tr­y­p­oi­­nt>            # Exécute le terminal d'un conteneur vivant


##############################################################################
# DOCKER NETWORK 
##############################################################################


docker network ls                                      # Liste des réseaux
docker network inspect <Ne­­tw­o­r­k>                       # Contrôle les inform­ations d'un réseau
docker network create <Ne­­tw­o­r­k>                        # Crée un réseau
docker network rm <Ne­­tw­o­r­k>                            # Supprime un réseau
docker network connect <Ne­­tw­o­r­k> <Co­­nt­a­i­ne­­r>           # Connecte un conteneur au réseau
docker network connect --ip <IP> <Ne­­tw­o­r­k> <Co­­nt­a­i­ne­­r> # Spécifie l'adresse IP de l'inte­rface du conteneur
docker network disconnect <Ne­­tw­o­r­k_­­Nam­­e> <Co­­nt­a­i­ne­­r>   # Déconnecte le conteneur du réseau
    => <Ré­sea­u> peut être remplacé par l'ID ou le NOM du réseau




##############################################################################
# DOCKER COMPOSE 
##############################################################################


docker compose up                               # Create and start containers
docker compose up -d                            # Create and start containers in detached mode
docker compose up -d --force-recreate           # Create and start containers in detached mode and force recreate it
docker compose down                             # Stop and remove containers, networks, images, and volumes
docker compose logs                             # View output from containers
docker compose restart                          # Restart all service
docker compose pull                             # Pull all image service 
docker compose build                            # Build all image service
docker compose config                           # Validate and view the Compose file
docker compose scale <service_name>=<replica>   # Scale special service(s)
docker compose top                              # Display the running processes
docker compose run -rm -p 2022:22 web bash      # Start web service and runs bash as its command, remove old container.


##############################################################################
# DOCKER SERVICES 
##############################################################################


docker service create <options> <image> <command>   # Create new service
docker service inspect --pretty <service_name>      # Display detailed information Service(s)
docker service ls                                   # List Services
docker service ps                                   # List the tasks of Services
docker service scale <service_name>=<replica>       # Scale special service(s)
docker service update <options> <service_name>      # Update Service options


##############################################################################
# DOCKER STACK 
##############################################################################


docker stack ls                                 # List all running applications on this Docker host
docker stack deploy -c <composefile> <appname>  # Run the specified Compose file
docker stack services <appname>                 # List the services associated with an app
docker stack ps <appname>                       # List the running containers associated with an app
docker stack rm <appname>                       # Tear down an application

