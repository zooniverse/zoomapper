# Zoomapper
A server that can return custom mbtiles for Zooniverse projects. This repo runs [Tileserver-GL](https://github.com/maptiler/tileserver-gl) under the hood via a [Docker container](https://hub.docker.com/r/klokantech/tileserver-gl).

Currently, mbtiles are contained within the repo under the "mbtiles" folder.

Please visit the [wiki](https://github.com/zooniverse/zoomapper/wiki) for more info.

## To Run:

### docker-compose build
To build the container

### docker-compose up
To launch an instance at `localhost:8080`

### docker-compose down
To bring down the container
