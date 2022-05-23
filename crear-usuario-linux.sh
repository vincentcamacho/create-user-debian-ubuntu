#!/bin/bash
usuario=vincent; contrasena=123;
sudo useradd -U $usuario -m -s /bin/bash
sudo usermod -a -G sudo,docker,buildkit,podman $usuario
echo "$usuario:$contrasena" | sudo chpasswd
