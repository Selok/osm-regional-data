psql -U postgres -c "CREATE DATABASE osm WITH OWNER = postgres ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8' TABLESPACE = pg_default CONNECTION LIMIT = -1;"
psql -U postgres osm -c "CREATE EXTENSION postgis;CREATE EXTENSION fuzzystrmatch;CREATE EXTENSION pg_trgm;"
osm2pgsql -d osm --number-processes 4 /var/traffic-news/osmosis/data/hongkong.osm.pbf -U postgres -s -l -c
