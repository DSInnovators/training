#!/bin/bash 

sudo apt update && sudo apt upgrade -y
sudo swapoff -a
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo ufw allow 6443/tcp
sudo ufw allow 2379:2380/tcp
sudo ufw allow 10250:10252/tcp
sudo ufw allow 30000:32767/tcp
sudo apt-get install -y lvm2
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

sudo bash -c 'cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF'

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo chmod -R 777 /usr/libexec/kubernetes/kubelet-plugins/volume/exec/
sudo chmod -R 777 /var/lib/kubelet/
sudo mkdir -p /var/lib/rook
sudo chmod -R 777 /var/lib/rook