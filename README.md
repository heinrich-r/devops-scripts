# devops-scripts
Collection of bash scripts for setting up new environments

## 1. Add user to Sudo group

```
su
sudo usermod -aG sudo {username}
shutdown -r now
```

## 2. Install Git

```
sudo apt update
sudo apt install git
```

## 3. Virtual Box Additions 

> **_WIP:_** Need to fix the run command  

```
sudo apt install build-essential dkms linux-headers-$(uname -r)
sudo mkdir -p /mnt/cdrom
sudo mount /dev/cdrom /mnt/cdrom
sudo /mnt/cdrom/VBoxLinuxAdditions.run --nox11
sudo shutdown -r now
```

## 4. Insall ohmyzsh

```
sudo apt-get install zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```
## 5. Install docker & docker-engine

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

## 6. Generate Git SSH key
```
ssh-keygen -t ed25519 -C "youremail@mail.com"
eval `ssh-agent -s`
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519
```

## 7. Format new drive
```
sudo fdisk -l
mkfs.ext4 /dev/sdXY
```

## 8. Set up Firewall

```
sudo apt update
sudo apt install ufw
```

```
sudo ufw app list
```
 
```
sudo ufw allow OpenSSH
```

```
sudo ufw enable
sudo ufw status
```