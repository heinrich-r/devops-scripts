# devops-scripts
Collection of bash scripts for setting up new environments

## 1. Add user to Sudo group

```
su
sudo adduser {username}
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

## 8. Set up Firewall

```
sudo apt update
sudo apt install ufw

sudo ufw app list

sudo ufw allow OpenSSH

sudo ufw enable
sudo ufw status
```

## 9. Install Nginx

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

## 10. Set up Nginx

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

## 11. Set up SSH Server

```
sudo apt update
sudo apt install openssh-server
sudo systemctl enable ssh
```

## 12. Set up RDP Server (Xrdp)

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

## 13. Install Visual Studio Code

```
sudo apt update
sudo apt install software-properties-common apt-transport-https curl
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code
```

## 14. Setting up workspace for Laravel project

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

## 15. Kubernetes

Basic kubectl commands to remember:
```
kubectl get nodes
kubectl get deployments
kubectl create deployment {name} --image={image-path}
kubectl proxy
```

```
kubectl describe - show detailed information about a resource

kubectl logs - print the logs from a container in a pod
kubectl logs k8-sandbox-5b9b64bf6c-mt78h -c super-api
journalctl

kubectl exec - execute a command on a container in a pod
kubectl exec <pod-name> <command>
kubectl exec -it <pod-name> /bin/bash
```

```
kubectl expose deployment/{deployment-name} --type="NodePort" --port 8080

export NODE_PORT=$(kubectl get services/{service-name} -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT
```

```
kubectl set image deployment/nginx-deployment nginx=nginx:1.16.1 --record
kubectl set image deployment/k8-sandbox super-api=heinrichr/super-api:22-09-2021 --record
```