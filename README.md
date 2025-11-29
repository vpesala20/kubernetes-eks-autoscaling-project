# Kubernetes EKS Autoscaling Project

This project demonstrates deploying an Nginx web application on AWS EKS using Terraform and configuring Kubernetes Horizontal Pod Autoscaling (HPA).

## 🚀 Components

### 1. Terraform (EKS Creation)

- Creates an Amazon EKS cluster
- Deploys managed node group (t3.small)
- Outputs kubeconfig details

### 2. Kubernetes Deployment

Deploys an Nginx application:
nginx-deployment.yaml
nginx-service.yaml
The service type is `LoadBalancer` so AWS ELB exposes it publicly.

### 3. Autoscaling (HPA)

Configures CPU-based auto-scaling:
min pods: 2
max pods: 10
target CPU: 50%


### 4. Load Generator (for testing)

kubectl run load-generator
--image=busybox --rm -it
-- /bin/sh -c "while true; do wget -q -O- http://nginx-service; done"

## ✔ Results

- Deployment scales based on CPU usage
- Load balancer exposes service publicly
- Terraform manages cluster lifecycle
