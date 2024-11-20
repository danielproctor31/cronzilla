# cronzilla

tldr;

Create a shell script, mount and run the container.

`docker run -v ./run.sh:/cron/run.sh -d ghcr.io/danielproctor31/cronzilla:main`

Runs every 5 mins.


## Configuration

### Interval

Specify the cron interval with the build arg `CRON_INTERVAL`

```
docker build -t ghcr.io/danielproctor31/cronzilla:main --build-arg CRON_INTERVAL="*/5 * * * *"
```

### Packages

To install additional packages, mount a file called `packages.txt` with the package names separated by a new line at `/packages.txt`

packages.txt
```
curl
python3
```

`docker run -v ./packages.txt:/packages.txt -v ./run.sh:/cron/run.sh -d ghcr.io/danielproctor31/cronzilla:main`