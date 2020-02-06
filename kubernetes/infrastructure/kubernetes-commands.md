# Using Microk8s

## Installing Microk8s kubernetes reference cluster
sudo snap install microk8s --classic --channel=1.17/stable
sudo usermod -a -G microk8s $USER
su - $USER
microk8s.status --wait-ready
microk8s.enable dns
microk8s.enable cilium

## Deployment
microk8s.kubectl get nodes
microk8s.kubectl create secret generic guybrush-env --from-literal=guybrush-env-toothrot='Herman Toothrot'
microk8s.kubectl apply -f guybrush.yaml
microk8s.kubectl apply -f rincewind.yaml
microk8s.kubectl get pods
microk8s.kubectl get all --all-namespaces

## Testing
curl -i http://localhost:30001/
curl -i http://localhost:30002/