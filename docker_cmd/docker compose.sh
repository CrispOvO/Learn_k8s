# build the images
docker compose build

# start the containers
docker compose start

# stop the containers
docker compose stop

# build and start
docker compose up -d

# list what's running
docker compose ps

# remove from memory
docker compose rm

# stop and remove
docker compose down

# get the logs
docker compose exec [container] [shell]

# run an instance as a project
docker compose --project-name [name] up -d

# shortcut of ⬆
docker compose -p [name] up -d

# list running projects
docker compose ls

# copy files from the container
docker compose cp [containerID]:[src_path] [dest_path]

# copy files to the container
docker compose cp [dest_path] [containerID]:[src_path]
