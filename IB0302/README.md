## Setup

### Requirements
You need `docker`, `docker-compose`, `git` and `make`

### Make targets
```
start:
    start the DB container (with docker compose)

stop:
    teardown and delete the volume associated with the image

split:
    split the large .sql files into 40MB chunks and move into multipart/
    so they can be committed to github without resorting to lfs

assemble:
    recombine the above split files into the originals

connect:
    opens an interactive connection to the DB in the container where
    you can select which database to connect to

connect-empty:
    same as the above but with no pre-configured database
```