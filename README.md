# postgis

PostGIS snippets & coursework

## Usage

See `Makefile` for useful commands.

```
# run database
make docker-up

# install requirements
make setup

# build static files
make build

# clean up builds
make book-clean

# load data / databases
make load-dvd
make create-restaurants-db

# publish to gh-pages
make publish
```

## Credits

This project is created using the excellent open source [Jupyter Book project](https://jupyterbook.org/) and the [executablebooks/cookiecutter-jupyter-book template](https://github.com/executablebooks/cookiecutter-jupyter-book).
