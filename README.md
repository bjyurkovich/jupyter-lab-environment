# Jupyter Lab Development Environment

You will need [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/).

## Get the environment

Open a terminal and clone the environment repository into your folder

```
git clone https://github.com/bjyurkovich/jupyter-lab-environment.git
```

or if `ssh`:

```
git clone git@github.com:bjyurkovich/jupyter-lab-environment.git
```

Then `cd` into the cloned directory:

```
cd jupyter-lab-environment
```

## Building and starting the container

Once you are in the directory, build the environment

```
docker-compose build
```

> it will take a while the first time!

Once it is built, you can start the container:

```
docker-compose up
```

> Now that is built, you can just run that command to start the container whenever you want. If you want to leave it running on your machine, simple add a `-d` to the command like: `docker-compose up -d`. You can then check on the container by typing `docker ps`.

Once the output from the container is done scrolling (it is installing your dependencies and getting JuptyerLab set up), you can open your browser of choice and visit [http://localhost:8080/lab](http://localhost:8080/lab).
