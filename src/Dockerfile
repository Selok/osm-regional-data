FROM postgis/postgis:14-3.1

# Set password for user postgres
ENV POSTGRES_PASSWORD postgres

RUN mkdir -p /var/osmosis/data

RUN apt-get update && \
    apt-get install osm2pgsql default-jre -y

COPY osmosis-latest.tgz /var/osmosis/
COPY hk.poly /var/osmosis/data/
COPY china-latest.osm.pbf /var/osmosis/data/

RUN cd /var/osmosis
RUN tar xzf /var/osmosis/osmosis-latest.tgz -C /var/osmosis
RUN rm /var/osmosis/osmosis-latest.tgz
RUN chmod a+x /var/osmosis/bin/osmosis

# extract Hong Kong data bounded by the shapefile
RUN /var/osmosis/bin/osmosis --read-pbf-fast workers=2 "/var/osmosis/data/china-latest.osm.pbf" --bounding-polygon file="/var/osmosis/data/hk.poly"  --write-pbf file="/var/osmosis/data/hongkong.osm.pbf"

# load all data
COPY init-db.sh /docker-entrypoint-initdb.d/init-db.sh

USER postgres
