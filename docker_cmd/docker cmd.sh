# build image
docker image build --pull --file "D:\APOvO\workspace\python_workspace\docker\handson/handson/Dockerfile" --tag "handson:latest" --label "com.microsoft.created-by=visual-studio-code" "D:\APOvO\workspace\python_workspace\docker\handson/handson"

# docker run
docker run --rm -d -p 8080:8080/tcp handson:latest 

# enter the container
docker exec -it [containerName] /bin/bash 

# stop container
docker stop [containerName]

# remove stopped container
docker rm [containerName]

# create volume
docker volume create [volumeName]

# inspect the volume
docker volume inspect [volumeName]

# list the volumes
docker volume ls

# remove volume 
docker volume rm [volumeName]
 
# run a container with a volume 
docker run -d --name devtest -v [volumeName]:/app [imageName]:latest