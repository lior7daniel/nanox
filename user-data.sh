#!/bin/bash

handle_error() {
    local exit_code=$?
    local lineno=$1
    echo "Error on line $lineno: Exiting with status $exit_code"
    cleanup
    exit $exit_code
}

cleanup() {
    echo "Cleaning up..."
}

trap 'handle_error $LINENO' ERR

# Docker
sudo apt update
sudo apt upgrade -y
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

# K3s
sudo curl -sfL https://get.k3s.io | INSTALL_K3S_SYMLINK="no" sh -s -
export KUBECONFIG=~/.kube/config
mkdir ~/.kube
sudo k3s kubectl config view --raw > "$KUBECONFIG"
sudo chmod 600 "$KUBECONFIG"
echo 'export KUBECONFIG=/etc/rancher/k3s/k3s.yaml' >> ~/.bashrc

# Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# kube-prometheus-stack
#sudo apt install git

sudo helm repo add nanox-monitoring https://lior7daniel.github.io/nanox-monitoring-chart
sudo helm repo update
sudo helm install nanox nanox-monitoring/nanox


#git clone https://github.com/lior7daniel/nanox.git
#cd nanox
#sudo helm dependency update
#sudo helm install nanox . # -n monitoring --create-namespace


echo "installation successfully completed"