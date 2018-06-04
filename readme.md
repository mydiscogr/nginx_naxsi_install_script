# install nginx with naxsi on ubuntu 18.04


## motivation

I've found good and bad articles about how to install ubuntu with naxsi from source code.

No one have a simple install script that just works on ubuntu 18.04 LTS
so here's a simple script sequence to install.

## abstract

Download and compile nginx with naxsi and all modules, then install service.
This installation was tested on fresh ubuntu 18.04 (Vanilla installation).

## install nginx and naxsi in pratiche

Before start download in your own home directory and create src dir then,
copy all files, then to make executable files

	sudo chmod +x install_library.sh nginx_naxi_inst.sh nginx_service/setup_service.sh extra_module.sh

- `sudo apt update`
- `sudo apt upgrade`

- `sudo ./install_library.sh`
- `./extra_module.sh`	(download extra modules)
- `./nginx_naxi_inst.sh`
- `make` (be sure to be in nginx directory)
- `sudo make install`
- `cd nginx_service`	(install service)
- `sudo setup_service.sh`


Feedbacks and suggets are welcome.




