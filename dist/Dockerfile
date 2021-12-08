FROM postgis/postgis:10-2.5

# Set password for user postgres
ENV POSTGRES_PASSWORD postgres

RUN mkdir -p /var/traffic-news/osmosis/data

RUN apt-get update && \
    apt-get install osm2pgsql default-jre -y

COPY osmosis-latest.tgz /var/traffic-news/osmosis/
COPY hk.poly /var/traffic-news/osmosis/data/
COPY china-latest.osm.pbf /var/traffic-news/osmosis/data/
COPY traffic_news_store_schema.sql /var/traffic-news/

RUN cd /var/traffic-news/osmosis
RUN tar xzf /var/traffic-news/osmosis/osmosis-latest.tgz -C /var/traffic-news/osmosis
RUN rm /var/traffic-news/osmosis/osmosis-latest.tgz
RUN chmod a+x /var/traffic-news/osmosis/bin/osmosis

RUN /var/traffic-news/osmosis/bin/osmosis --read-pbf-fast workers=2 "/var/traffic-news/osmosis/data/china-latest.osm.pbf" --bounding-polygon file="/var/traffic-news/osmosis/data/hk.poly"  --write-pbf file="/var/traffic-news/osmosis/data/hongkong.osm.pbf"

COPY init-db.sh /docker-entrypoint-initdb.d/init-db.sh

USER postgres
