# A collection of Dockerfiles for a headless VDR

A collection of Dockerfiles for a VDR appliance

  - VDR 2.2.0 yaVDR
  - data-only image for persistance
  - preconfigured mariadb:5.5 with epglv UDF's
  - epgd http branch
  - a debstrap based Ubuntu 14.04 baseimage with german locales
  - crane file to lift up the whole thing

### Installation

You need docker.io installed correctly, clone this GIT repository or use the ones from hub.docker.io
To use the crane.yml file you need [crane](https://github.com/michaelsauter/crane) installed.
Configure the vdr.data image with your local and build it locally. If you don't use the vdr.data image your changes will not survive a container upgrade!
Make sure you have a vdr user and a vdr group, both with id '666' (same as in yaVDR) and ensure the user/group have R/W access to the folders you specified.

```sh
$ crane provision -v vdr.data
$ crane provision -v vdr epdg database
```
Create the containers and start them

```sh
$ crane create -v vdr.config
$ crane create -v vdr epgd database
$ crane start
```

To edit your config stop the container first

```sh
$ docker stop vdr
$ docker stop epgd
```
Edit the files, e.g. copy your own channels.conf, modify svdrphosts.conf... Start the container after you are finished

```sh
$ docker start vdr
```

### Logs

```sh
$ crane logs -f
```
