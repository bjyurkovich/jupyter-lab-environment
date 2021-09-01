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

## Some tips

#### Virtual Environment

The environment runs Juptyer inside of a virtual environment, so any `pip` installs you do will be saved to the `venv` folder. That means anytime you boot up your docker container, all your dependencies will still be there! Remember - if you want to save your dependencies for others to use fresh, you will want to make sure to do a `pip freeze > requirements.txt` to save your dependency list.

#### Using with your project

Since the virtual environment is used with Jupyter, it is recommend taking this code (everything in this repo) and put it into your project and distribute that way, using the same `venv` folder as your virtualenv. Also, it will be easier to share your project environment with others.

#### Using command line

Do you need to get into your docker container to do stuff? You can run `source dev/dev.sh` which will `exec` into the docker container and give you a prompt. Remember, this will not have the virtualenvironment running (located in the `/workspace` folder on the root of the path). You should not need to do this. Instead, use the terminal inside Jupyter Lab!
