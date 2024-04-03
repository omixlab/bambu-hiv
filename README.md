# Bambu-HIV

## Requirements

- [redis](https://redis.io/). The port used by Redis must be specified in the environment variable `BAMBU_REDIS_URI`.

## Setup

Installation requires a Conda distribution/implementation, such as [Anaconda]([https://zenodo.org/records/10406050](https://anaconda.org/)), [Miniconda](https://docs.conda.io/projects/miniconda/en/latest/) or [Mamba](https://github.com/mamba-org/mamba). In most cases, the installation might be performed using the command bellow:

```
$ make setup
```

Under the hood, `make` will call the conda (or mamba) `env create` or `env update` commands. A `bambu-server-hiv` 
Conda environment will be created.

## Activating the conda environment

To run the tool, activate the conda environment and use the `make deploy` command. It will start the
web application, which by default will run on port 8085.

```
$ conda activate caramel
$ make deploy
```

![](assets/caramel.png)
