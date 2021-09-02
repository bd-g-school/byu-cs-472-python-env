## Overview

This is a repo to set up a docker image to run a python environment with scikit-learn installed for machine learning development. 

Disclaimer: I am running on a Linux machine, and the file paths may need to be slightly adjusted if you are running on Windows or Mac. Feel free to reach out if you need help setting things up!

## Steps to use this environment

### Install Docker

The official [Docker Website](https://docs.docker.com/get-docker/) has documentation on installation for your specific platform.

### Building a new Docker image

Clone this repo to your local machine and navigate to the cloned directory. Then run the below, substituting in a repository name and tagname of your choice. Typically, the tag is a version number.

    $ docker build -t {any-repo-name}/cs472-python-env:{tag-name} .

### Running a local Docker image

When the image builds successfully, you can run your environment and access a bash shell with the below command. Note the `--volume` argument. This mounts the docker working directory to your local machine's file system, so that you can use a local IDE to edit your files, and these changes will appear in the container for you to build and run.

    $ docker run -it --rm --volume {/path/to/where/you/want/your/code}:{/path/to/where/you/want/your/code} {any-repo-name}/cs472-env:{tag-name} /bin/bash

The container will remain active as long as you have the bash shell open. When you exit the shell with `Ctrl+D`, the container will automatically be removed.

The bash session created when you execute the `docker run` command will allow you to run your python code and have access to the needed packages. You can test this by running the below commands inside the bash session.

    $ python -m pip show scikit-learn  # to see which version and where scikit-learn is installed
    $ python -m pip freeze  # to see all installed packages  
    $ python -c "import sklearn; sklearn.show_versions()" # simple test python program

### Adding packages

If you need additional python packages at any point, you can add them to `requirements.txt` and rebuild your docker image. Put each package on a new line in the format

    {package-name}=={version-number}

Make sure to select a version number that compatible with Python 3.8. (Note: We use Python 3.8 and not 3.9 because scikit-learn does not yet support Python 3.9 as of September 2021).

You will need to rebuild your docker image with a new tag name and run your new image with that new tag name to access the added packages.