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
```

## set up ssh for access using github keys
```
mkdir .ssh
chmod 700 .ssh
curl -s https://github.com/{github-username}.keys >> ~/.ssh/authorized_keys
chmod 600 .ssh/authorized_keys
```
