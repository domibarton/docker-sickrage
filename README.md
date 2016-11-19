## About

This is a Docker image for [SickRage](https://sickrage.github.io/) - the Internet PVR for your TV shows.

The Docker image currently supports:

* running SickRage under its __own user__ (not `root`)
* changing of the __UID and GID__ for the SickRage user
* support for OpenSSL / HTTPS encryption

## Run

### Run via Docker CLI client

To run the SickRage container you can execute:

```bash
docker run --name sickrage -v <datadir path>:/datadir -v <media path>:/media -p 8081:8081 sickrage/sickrage
```

Open a browser and point it to [http://my-docker-host:8081](http://my-docker-host:8081)

### Run via Docker Compose

You can also run the SickRage container by using [Docker Compose](https://www.docker.com/docker-compose).

If you've cloned the [git repository](https://github.com/domibarton/docker-sickrage) you can build and run the Docker container locally (without the Docker Hub):

```bash
docker-compose up -d
```

If you want to use the Docker Hub image within your existing Docker Compose file you can use the following YAML snippet:

```yaml
sickrage:
    image: "sickrage/sickrage"
    container_name: "sickrage"
    volumes:
        - "<datadir path>:/datadir"
        - "<media path>:/media"
    ports:
        - "8081:8081"
    restart: always
```

## Configuration

### Volumes

Please mount the following volumes inside your SickRage container:

* `/datadir`: Holds all the SickRage data files (e.g. config, postProcessing)
* `/media`: Directory for TV shows

### Configuration file

By default the SickRage configuration is located on `/datadir/config.ini`.
If you want to change this you've to set the `CONFIG` environment variable, for example:

```
CONFIG=/datadir/sickrage.ini
```

### UID and GID

By default SickRage runs with user ID and group ID `666`.
If you want to run SickRage with different ID's you've to set the `SICKRAGE_UID` and/or `SICKRAGE_GID` environment variables, for example:

```
SICKRAGE_UID=1234
SICKRAGE_GID=1234
```
