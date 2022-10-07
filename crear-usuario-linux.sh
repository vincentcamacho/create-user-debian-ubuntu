#!/bin/bash
usuario=vincent; contrasena=123;
sudo useradd -U $usuario -m -s /bin/bash
sudo usermod -a -G sudo,docker,buildkit,podman $usuario
echo "$usuario:$contrasena" | sudo chpasswd


# FORMA 2
#-----------------------------------------------------
sudo cat /etc/group | egrep 'sudo|users|wheel|sshusers'
sudo cat /etc/group | egrep 'vcamacho|fperdriat'
#-----------------------------------------------------

usuario=vcamacho
sudo useradd -U $usuario -m -s /bin/bash
sudo usermod -aG sudo,users,wheel,sshusers $usuario

sudo mkdir -p /home/$usuario/.ssh/
echo "una_llave_ssh_publica" | sudo tee /home/$usuario/.ssh/authorized_keys

sudo chmod 755 /home/$usuario/.ssh/
sudo chmod 644 /home/$usuario/.ssh/authorized_keys

sudo chown -R $usuario:$usuario /home/$usuario/.ssh/

#-----------------------------------------------------
sudo ls -la /home/$usuario/ && echo && sudo ls -la /home/$usuario/.ssh/ && echo && sudo cat /home/$usuario/.ssh/authorized_keys
#-----------------------------------------------------

