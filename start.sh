#!/bin/sh

echo "Pulling postgres image..."
docker pull postgres

if [ ! -d "$HOME/docker/volumes/postgres" ]; then
  echo "Creating directory for persistence..."
  mkdir -p $HOME/docker/volumes/postgres
fi

echo "Starting Postgres container..."
docker run --rm --name pg-docker -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data postgres

