# CentOS 7 Docker Image for Ansible Testing

[![latest](https://github.com/glillico/docker-centos7-ansible/workflows/latest/badge.svg)](https://github.com/glillico/docker-centos7-ansible/actions?query=workflow%3Alatest) [![python3](https://github.com/glillico/docker-centos7-ansible/workflows/python3/badge.svg)](https://github.com/glillico/docker-centos7-ansible/actions?query=workflow%3Apython3)

A docker container using CentOS 7 with Ansible installed for playbook and role testing.

## Tags

  - 'latest'  : Python 2.7.x and the latest stable version of Ansible.
  - 'python3' : Python 3.6.x and the latest stable version of Ansible.

## How To Build

To build this docker container you can do the following.

  - Install Docker Engine, see [here](https://docs.docker.com/engine/install/) for details.
  - Clone this repository.
    - `$ git clone https://github.com/glillico/docker-centos7-ansible.git`
  - Change to the repositories directory.
    - `$ cd docker-centos7-ansible`
  - Run the command
    - `$ docker build -t centos7-ansible .`

## How To Use

  - Install Docker Engine, see [here](https://docs.docker.com/engine/install/) for details.
  - To create a containter from the image you created in the `How To Build` section run the command.
    - `$ docker run --detach --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:rw --cgroupns=host centos7-ansible:latest`
  - To confirm Ansible is working within the container run the command.
    - `$ docker exec --tty <CONTAINER ID> env TERM=xterm ansible --version`

## Notes

This image is used for testing purposes only and is not intended to be used to provide live services of any sort.

## systemd

systemd has been updated to provide cgroupv2 support.  Please see https://maciej.lasyk.info/2016/Dec/16/systemd-231-latest-in-centos-7-thx-to-facebook for further details.

## License

MIT

## Author Information

Created in 2020 by Graham Lillico.
