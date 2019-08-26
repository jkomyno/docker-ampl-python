# Docker image with AMPL and Python 3.6

[![docker pulls](https://img.shields.io/docker/pulls/jkomyno/ampl-python.svg)](https://hub.docker.com/r/jkomyno/ampl-python/) [![docker stars](https://img.shields.io/docker/stars/jkomyno/ampl-python.svg)](https://hub.docker.com/r/jkomyno/ampl-python/) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> Docker image based on Ubuntu 18.04 containing the minimum amount of utilities needed to run [AMPL](http://ampl.com/) models and Python 3.6 programs.

## How to Install

You can get this image from Docker Hub:

`docker pull jkomyno/ampl-python`

You can also build it locally from this repository:

- `git clone git@github.com:jkomyno/ampl-python-docker.git`
- `cd ampl-python-docker`
- `docker build -t jkomyno/ampl-python .`

## Note on AMPL

Since AMPL is a commercial product, the `jkomyno/ampl-python` Docker image only incluees the free demo of AMPL by default.
It's automatically downloaded from [ampl.com](http://ampl.com/), and contains many commercial optimization solvers, like
CPLEX and BARON.

## Customization

In case you need it, you can build your own custom Docker image based on this one.
A number of dynamic build arguments are available:

* **UBUNTU** [18.04]: change it if you'd rather use a different version of Ubuntu;
* **PYTHON** [3.6]: change it if you'd rather use a different version of Python;
* **AMPL** [[Free demo for Linux 64bit](http://ampl.com/demo/ampl.linux64.tgz)]: change it if you wish to use another AMPL version available in the Docker context.

For instance, if you have a custom AMPL archive named `ampl.tgz` in the current folder and you wish to configure the Docker image to use it,
you can run the following:

`docker build --build-args AMPL=ampl.tgz -t ampl-python-custom .`

## 👤 Author

**Alberto Schiabel**

* Github: [@jkomyno](https://github.com/jkomyno)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/jkomyno/docker-ampl-python/issues).
The code is short, throughly commented and well tested, so you should feel quite comfortable working on it.
If you have any doubt or suggestion, please open an issue.

## 🦄 Show your support

Give a ⭐️ if this project helped or inspired you!

## 📝 License

Built with ❤️ by [Alberto Schiabel](https://github.com/jkomyno).<br />
This project is [MIT](https://github.com/jkomyno/docker-ampl-python/blob/master/LICENSE) licensed.

## Related repositories

* [`amplrestapi`](https://github.com/jkomyno/amplrestapi): Asynchorous AMPL REST Interface written in Python 3.6
