# DEBIAN DevOps Scripts
Collection of Debian scripts for setting up new environments

## Add user to Sudo group

```
su
sudo adduser {username}
sudo usermod -aG sudo {username}
shutdown -r now
```

## Install Git

```
sudo apt update
sudo apt install git
```

## Insall ohmyzsh

```
sudo apt install zsh
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

## Generate Git SSH key
```
ssh-keygen -t ed25519 -C "youremail@mail.com"
cat ~/.ssh/id_ed25519
```

## Format new drive
```
sudo fdisk -l
mkfs.ext4 /dev/sdXY

OR

sudo apt install parted
parted /dev/sdb mklabel gpt
parted -a opt /dev/sdb mkpart primary ext4 0% 100%
mkfs.ext4 -L storageprox /dev/sdb1
lsblk -fs
```

Mounting the drive:
```
mkdir -p /mnt/data
nano /etc/fstab
LABEL=storageprox /mnt/data ext4 defaults 0 2
mount -a
```

## Set up Firewall

```
sudo apt update
sudo apt install ufw

sudo ufw app list

sudo ufw allow OpenSSH

sudo ufw enable
sudo ufw status
```

## Install Nginx

```
sudo apt install nginx
sudo ufw app list
sudo ufw allow 'Nginx HTTP'
sudo systemctl status nginx
```

http://your_server_ip >> should display Welcome to nginx!

```
sudo systemctl restart nginx
sudo systemctl disable nginx
```

## Set up Nginx

```
sudo mkdir -p /var/www/your_domain/html
sudo chown -R $USER:$USER /var/www/your_domain/html
sudo chmod -R 755 /var/www/your_domain
nano /var/www/your_domain/html/index.html
sudo nano /etc/nginx/sites-available/your_domain
sudo ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/
sudo nano /etc/nginx/nginx.conf  ## {server_names_hash_bucket_size 64;}
sudo nginx -t
sudo systemctl restart nginx
```

## Set up SSH Server

```
sudo apt update
sudo apt install openssh-server
sudo systemctl enable ssh
```

## Set up RDP Server (Xrdp)

```
sudo apt update
sudo apt install xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils
sudo apt install xrdp
sudo adduser xrdp ssl-cert
```

```
sudo ufw allow from 192.168.1.0/24 to any port 3389
sudo nano /etc/xrdp/xrdp.ini
sudo systemctl restart xrdp
```

## Install Visual Studio Code

```
sudo apt update
sudo apt install software-properties-common apt-transport-https curl
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code
```

## Setting up workspace for Laravel project

Install PHP
```
sudo apt -y install lsb-release apt-transport-https ca-certificates 
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
sudo apt -y install php7.4
```

Install MYSQL 
```
sudo apt install gnupg
cd /tmp
wget https://dev.mysql.com/get/mysql-apt-config_0.8.17-1_all.deb
sudo dpkg -i mysql-apt-config*
sudo apt update
sudo apt install mysql-server
sudo systemctl status mysql
mysql_secure_installation
```

Install PEAR
```
sudo apt-get install php-xml
curl -O http://pear.php.net/go-pear.phar
sudo php -d detect_unicode=0 go-pear.phar
rm go-pear.phar
pear version
```

Install Composer and dependencies
```
sudo apt-get install php7.4-{bcmath,bz2,intl,gd,mbstring,mysql,zip,curl,dom}
sudo apt install composer
```

