## Use the base image for fastest install

FROM jupyter/base-notebook

## Switch to ROOT for intial settings

USER root

## Edgecase: set display port to avoid crash

ENV DISPLAY=:99

## Set folder for repo import of files

WORKDIR ${HOME}

## Only needed when sharing via Github
## And deploying via MyBinder.org
## Copy repo files over

COPY . ${HOME}

## Set ownership permisions for notebook user
RUN chown -R ${NB_USER} ${HOME}

## Reset the container user back to the notebook user

USER ${NB_UID}