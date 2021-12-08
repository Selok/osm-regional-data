# osm-regional-data

Example for import OSM data with boundary filtering

## Prerequistie

### Raw data

Raw data can be exported directly from [OpenStreetMap](https://www.openstreetmap.org/#map=10/22.1664/114.3938), or downloaded from [Geofabrik Download Server](https://download.geofabrik.de/)

In this case, [china-latest.osm.pbf](https://download.geofabrik.de/asia/china-latest.osm.pbf) is used.

### OpenStreetMap data reading tools

Download [osmosis](https://github.com/openstreetmap/osmosis/releases/latest)

## Build the container

copy the content of source directory to your working directory

```sh
[your/working/directory/]
  ├─── china-latest.osm.pbf # latest open street map file of China
  ├─── osmosis-latest.tgz # osmosis binary package for import open street map data file
  ├─── hk.poly # poly file of Hong Kong SAR boundary
  └─── Dockerfile # docker setup file
```

run following script to build images

```sh
docker build -t osm-regional-data .
```

create your container

```sh
docker run -d --name osmdb -e POSTGRES_PASSWORD=password -p 45432:5432 osm-regional-data
```

Now database is setup with Hong Kong data imported.

Connection information as following:
| Hostname  | Port  | Password |
| --------- | ----- | -------- |
| localhost | 45432 | password |
