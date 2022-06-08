# Zoomapper
A server that can return custom mbtiles for Zooniverse projects. This repo runs [Tileserver-GL](https://github.com/maptiler/tileserver-gl) under the hood via a [Docker container](https://hub.docker.com/r/klokantech/tileserver-gl).

Production @ [zoomapper.zooniverse.org](https://zoomapper.zooniverse.org/)

(No staging deploy; keeping strategy is simple, single-dploy config.)

Please visit the [wiki](https://github.com/zooniverse/zoomapper/wiki) for more info.

## To Run:

### docker-compose build
To build the container

### docker-compose up
To launch an instance at `localhost:8080`

### docker-compose down
To bring down the container

## What's the deal with tiles?
The app serves data in two ways: makes data from local vector tiles files (in `mbtiles` format) available, and provides styling for externally hosted vector tiles.

#### Local
Local mbtile files are contained within the "mbtiles" folder.

Consider a `falklands.mbtiles` file contained in the `mbtiles` directory of this repo. That, alongside the `falklands` definition in the [`config.json`](https://github.com/zooniverse/zoomapper/blob/05d641d22e94f5555a135b153b43c52adfe698c6/config.json) file:

```
{
  "options": {
    "paths": {
      "root": "",
      "mbtiles": "mbtiles"
    }
  },
  "data": {
    "falklands": {
      "mbtiles": "falklands.mbtiles" // file location here
    }
  }
}
```

Causes the `falklands.mbtiles` tileset to deploy to the appropriate route (https://zoomapper-staging.zooniverse.org/data/falklands/#8/-52/-59). Note the 'data' inclusion in the route.

Should you need to upload new tiles, place the tileset in the `mbtiles` folder, then add the route name into the `config.json` "data" key, which also includes the name of the relevant "mbtiles" file.

#### Remote

Styled versions of remote vector tiles are accessible via `styles` endpoint (e.g., https://zoomapper.zooniverse.org/styles/basic/{z}/{x}/{y}.jpg) where styles are configured in `config.json` and defined in `styles/<StyleName>/<style.json>` file.

## Deployment

There is intentionally only a production deploy of this service. Deployment occurs via chatops (`lita deploy zoomapper`) to https://zoomapper.zooniverse.org.
