# NN DevOps Challenge – Azure AKS FastAPI Terraform – Infrastructure Demo

## 1. Project Overview

This repository shows how to deploy a small API to **Azure Kubernetes Service (AKS)** using:

- A **FastAPI** application in Python.
- A **Docker** image built from that app.
- **Terraform** to provision Azure resources (Resource Group, Azure Container Registry, AKS).
- **Kubernetes manifests** to run the container and expose it through a public LoadBalancer.

The application itself is intentionally simple: it simulates a prediction service so the focus stays on **infrastructure and deployment practices**.

## 2. Architecture Diagram

![Architecture overview for NN DevOps Challenge](./images/architecture_overview.png)

---

## 3. High-Level Architecture

1. **Application (FastAPI)**  
   - `GET /health`: basic health check.  
   - `POST /predict?symbol=BTC`: returns a fake “predicted” price (random integer).

2. **Containerization (Docker)**  
   - A Docker image is built from the FastAPI app and pushed to **Azure Container Registry (ACR)**.

3. **Infrastructure (Terraform)**  
   - Creates a **Resource Group**, **ACR**, and an **AKS** cluster.

4. **Orchestration (Kubernetes)**  
   - A **Deployment** runs the Docker image as a Pod in AKS.  
   - A **Service** of type `LoadBalancer` exposes the API on port **80** with a public IP.

---

## 3. Tech Stack

- **Backend**: Python 3.10, FastAPI, Uvicorn  
- **Containerization**: Docker  
- **Cloud**: Microsoft Azure (Resource Group, ACR, AKS)  
- **IaC**: Terraform (AzureRM provider)  
- **Orchestration**: Kubernetes (Deployment, Service)

---

## 4. Repository Structure

```text
NN-DEVOPS-CHALLENGE/
├── app/
│   ├── Dockerfile        # Docker image for the FastAPI app
│   ├── main.py           # FastAPI application (health + predict)
│   └── requirements.txt  # Python dependencies
│
├── images/               # Architecture diagram and screenshots
│   ├── architecture_overview.png       # High-level architecture (Terraform + ACR + AKS + FastAPI)
│   ├── resources_created.png           # Terraform apply output (resources created)
│   ├── azure_rg_overview.png           # Azure Resource Group overview (AKS + ACR)
│   ├── docker_images.png               # Docker Desktop: local + ACR-tagged images
│   ├── acr_repo_nn_predictor.png       # Azure Container Registry repo for nn-predictor
│   ├── aks_deployment_nn_predictor.png # AKS deployment with running pod
│   ├── fastapi_docs_health.png         # FastAPI docs – /health endpoint
│   └── fastapi_docs_predict.png        # FastAPI docs – /predict endpoint
│
├── infra/
│   ├── main.tf           # Resource Group + Azure Container Registry
│   ├── aks.tf            # Azure Kubernetes Service (AKS) cluster
│   ├── providers.tf      # Terraform provider configuration
│   ├── variables.tf      # Common variables (project_name, location)
│   └── outputs.tf        # Key outputs (RG, ACR login server, AKS name)
│
├── k8s/
│   ├── deployment.yaml   # Kubernetes Deployment (Pods and container config)
│   └── service.yaml      # Kubernetes Service (LoadBalancer, public IP)
│
├── .gitignore            # Ignore Python, Terraform and editor-specific files
└── README.md             # Project overview, architecture and documentation
```

## Screenshots

### Architecture overview
![Architecture overview](images/architecture_overview.png)

### Terraform-managed infrastructure
![Terraform apply outputs](images/resources_created.png)
![Azure resource group](images/azure_rg_overview.png)

### Docker image and Azure Container Registry
![Docker images](images/docker_images.png)
![ACR nn-predictor repository](images/acr_repo_nn_predictor.png)

### AKS deployment and FastAPI endpoints
![AKS deployment](images/aks_deployment_nn_predictor.png)
![FastAPI /health endpoint](images/fastapi_docs_health.png)
![FastAPI /predict endpoint](images/fastapi_docs_predict.png)
