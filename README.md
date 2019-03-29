# ooni-sync in Docker

A Docker image with all dependencies required to use ooni-sync, jq and R.

## Installation

In order to use and build this Docker image you will need to Install the Docker
engine You can find installation instructions for your system
[here](https://docs.docker.com/engine/installation/#platform-support-matrix).


For further instructions on running Docker in Windows and Mac:
* [Docker for Windows documentation](https://docs.docker.com/docker-for-windows)
* [Docker for Mac documentation](https://docs.docker.com/docker-for-mac)

## Build the Docker image

* Create a directory (VOLUME) that you would like to store the OONI reports
* Clone this repository or use the Dockerfile provided in this repository

You can build the ooni-sync Docker image with the following command:

```
docker build -t ooni-sync:docker .
```

Upon successful completion of the Docker image (ooni-sync) build, you should
see something similar to: `Successfully built 32328a32da98`.
You may now start the Docker (ooni-sync) container with the following command,
replace `ooni-reports` with the directory that you want to use in order to save
the OONI reports

Run the ooni-sync Docker image in:

### Linux

Directory used to store ooni-reports: `$HOME/ooni-reports/`

```
docker run --rm --volume $HOME/ooni-reports/:/data -it ooni-sync:docker
```

### Windows

Directory used to store ooni-reports: `c:/Users/ooni-reports`

```
docker run --rm --volume c:/Users/ooni-reports:data -it ooni-sync:docker
```

### Mac

Directory used to store ooni-reports: `/Users/user/ooni-reports/`

```
docker run --rm --volume /Users/user/ooni-reports/:/data -it ooni-sync:docker
```

You should now be able to run commands inside the ooni-sync Docker container,
already build with the required dependencies to run ooni-sync, jq and R.
You should be seeing a prompt similar to: `root@32328a32da98:/data#`

**Warning**: Upon logout all changes made in the Docker container apart from
the data in the directory `/data` will be lost.

Logout (exit) from the ooni-sync Docker container by issuing the command: `exit`

## Remove ooni-sync Docker container and image

First, you need to find the ID of the ooni-sync Docker container:

```
docker ps -qa --filter ancestor=ooni-sync:docker
```

Copy the output of the previous command and use it in place of `CONTAINERID` in
the following commands:

```
docker stop CONTAINERID
docker rm CONTAINERID
docker rmi ooni-sync:docker
```

You can now uninstall the Docker engine.

### Docker (engine) uninstall instructions

* [Windows](https://docs.docker.com/toolbox/toolbox_install_windows/#how-to-uninstall-toolbox).
* [Ubuntu](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#uninstall-docker-ce)
* [Mac](https://docs.docker.com/toolbox/toolbox_install_mac/#how-to-uninstall-toolbox)


## References

* [ooni-sync](https://www.bamsoftware.com/software/ooni-sync/)
* [Docker Documentation](https://docs.docker.com/)
* [jq](https://stedolan.github.io/jq/)
* [R](https://www.r-project.org/)
