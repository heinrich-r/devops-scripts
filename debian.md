# Debian set up

## set up sudo for normal user
```
su

apt install sudo

usermod -aG sudo {username}
```

## install zsh and oh-my-zsh for terminal
```
apt install git

apt install zsh

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

nano ~/.zshrc ##Change theme to 'candy'
```

## generate ssh key for host & upload to github

## set up ssh for access using github keys
```
mkdir .ssh

chmod 700 .ssh

curl -s https://github.com/{github-username}.keys >> ~/.ssh/authorized_keys

chmod 600 .ssh/authorized_keys
```

## set up docker & docker-compose
```
sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update

sudo apt install docker-ce docker-ce-cli containerd.io

sudo docker run hello-world

sudo usermod -aG docker ${USER}
```

## install nvm for node
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

source ~/.zshrc
```
