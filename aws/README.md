# AWS Linux 2 DevOps Scripts
Collection of Debian scripts for setting up new environments

## Install docker

```
sudo yum install docker
sudo usermod -a -G docker ec2-user
id ec2-user
newgrp docker

wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)
sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
sudo chmod -v +x /usr/local/bin/docker-compose

sudo systemctl enable docker.service
sudo systemctl start docker.service
```
