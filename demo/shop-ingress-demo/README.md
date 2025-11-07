# Kubernetes Ingress Hands‑On  
This project demonstrates host‑based + path‑based routing using NGINX Ingress on Minikube with MetalLB.

## Prerequisites  
- Minikube installed and running  
- kubectl configured for your Minikube cluster  
- sudo access or ability to edit `/etc/hosts` on your host  

## Setup Steps  
1. Start Minikube  

minikube start -p flannel-cluster --nodes=3 --cpus=4 --memory=4096 --cni=flannel

2. Install MetalLB

kubectl apply ‑f metallb/metallb-ns.yaml  

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.15.2/config/manifests/metallb-native.yaml 

kubectl apply ‑f metallb/metallb-pool.yaml  


3. Install NGINX Ingress Controller

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.13.3/deploy/static/provider/cloud/deploy.yaml


4. Create your namespace for shop services

kubectl apply ‑f namespace/shop‑ns.yaml  


5. Deploy backend services

kubectl apply ‑f services/customer-frontend.yaml  
kubectl apply ‑f services/admin-frontend.yaml  
kubectl apply ‑f services/product‑service.yaml  
kubectl apply ‑f services/order‑service.yaml  
kubectl apply ‑f services/report‑service.yaml  


6. Deploy Ingress resource

kubectl apply ‑f ingress/ingress‑shop.yaml  


7. Identify the external IP assigned by MetalLB to the ingress controller service

kubectl get svc ‑n ingress‑nginx  


8. Suppose it is 192.168.49.240.

Edit your /etc/hosts file and add:

192.168.49.240   customer.myshop.local admin.myshop.local


9. Test routing

curl http://customer.myshop.local/  
curl http://customer.myshop.local/products  
curl http://customer.myshop.local/orders  
curl http://admin.myshop.local/  
curl http://admin.myshop.local/reports  
curl http://admin.myshop.local/users 


## Next Steps

Create helm chart
