# Cloud-Native FastAPI on Azure: AKS, Terraform, Helm, and Observability

[![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/Cloud-Azure-0089D6?logo=microsoftazure)](https://azure.microsoft.com/)
[![Kubernetes](https://img.shields.io/badge/Orchestration-Kubernetes-326CE5?logo=kubernetes)](https://kubernetes.io/)
[![FastAPI](https://img.shields.io/badge/Framework-FastAPI-009688?logo=fastapi)](https://fastapi.tiangolo.com/)

## Overview

`NN Predictor` is a complete DevOps project that shows how to move an API from local code to a cloud environment on Azure.

The main focus is not building a real Machine Learning model, but demonstrating good practices in:

- infrastructure as code,
- Kubernetes deployment,
- observability,
- and continuous quality checks with CI.

The API returns simulated predictions to keep the application layer simple and highlight platform and operations work.

## What the Project Does

The project implements this end-to-end flow:

1. A FastAPI service is developed with health and prediction endpoints.
2. The application is packaged as a Docker image.
3. Terraform provisions Azure infrastructure (Resource Group, ACR, and AKS).
4. Kubernetes deploys the app with replicas, a public Service, and autoscaling.
5. Helm provides a parameterized deployment alternative.
6. Prometheus and Grafana provide platform observability.
7. GitHub Actions validates IaC and manifests before integration.

## Architecture

![Architecture overview](./images/architecture_overview.png)

## API and Functional Behavior

The API is implemented in `app/main.py` and exposes two endpoints:

- `GET /health`
  - health endpoint for Kubernetes probes, monitoring, and diagnostics.
- `POST /predict?symbol=BTC`
  - returns a simulated price for a market symbol.

Even though the project name suggests prediction, the current logic uses random values to keep the app simple and prioritize the DevOps architecture.

## Technical Layers

### 1) Application Layer

- Framework: FastAPI.
- ASGI server: Uvicorn.
- Minimal dependencies defined in `app/requirements.txt`.
- Simple and easy-to-audit codebase.

### 2) Container Layer

`app/Dockerfile` includes practical decisions:

- lightweight Python base image,
- dependency installation,
- non-root runtime user,
- internal API port exposure.

These choices improve portability, basic security, and consistency across environments.

### 3) Infrastructure Layer (Terraform)

`infra/` defines Azure infrastructure:

- `providers.tf`: `azurerm` provider.
- `variables.tf`: project-level variables.
- `main.tf`: Resource Group + Azure Container Registry.
- `aks.tf`: AKS cluster.
- `outputs.tf`: key outputs (resource names and ACR login server).
- `backend.tf`: remote Terraform state in Azure Blob Storage.

Remote state enables safer collaboration and avoids relying on a local `terraform.tfstate`.

### 4) Kubernetes Layer (Raw Manifests)

`k8s/` defines runtime behavior:

- `deployment.yaml`: pods, resources, probes, and security context.
- `service.yaml`: public exposure through LoadBalancer.
- `hpa.yaml`: CPU-based horizontal autoscaling.

This covers core production-style operation for an API service.

### 5) Helm Layer (Parameterized Deployment)

`helm/nn-predictor/` mirrors the same deployment model using templates:

- centralized values in `values.yaml`,
- templates for Deployment, Service, and HPA,
- chart metadata in `Chart.yaml`.

Helm allows environment-specific adjustments without editing raw manifests.

### 6) Observability Layer

`observability/` contains values for:

- Prometheus (metrics collection),
- Grafana (metrics visualization).

The current profile is optimized for demo/lab usage (lightweight settings).

### 7) Continuous Quality Layer (CI)

`.github/workflows/terraform-checks.yml` defines quality gates:

- Terraform validation (`fmt`, `validate`),
- Kubernetes schema validation with `kubeconform`,
- Helm lint/render/schema validation.

The goal is early detection of issues before deployment.

## Repository Structure

```text
app/                # FastAPI app + Dockerfile
infra/              # Terraform (backend, provider, RG, ACR, AKS)
k8s/                # Kubernetes manifests (Deployment, Service, HPA)
helm/nn-predictor/  # Service Helm chart
observability/      # Prometheus and Grafana values
.github/workflows/  # CI validation pipeline
images/             # Project screenshots and architecture diagram
```

## Relevant Security Decisions

The project includes practical baseline security controls:

- container runs as non-root user,
- restricted pod/container privileges,
- health probes for resilience,
- resource requests/limits for capacity control.

## Project Value

This repository demonstrates the ability to:

- design a coherent cloud-native architecture,
- automate infrastructure with Terraform,
- operate workloads in Kubernetes with solid practices,
- implement a technical quality gate workflow before production.

## Screenshots

![Terraform apply outputs](images/resources_created.png)
![AKS deployment](images/aks_workload_nn_predictor_deploy.png)
![FastAPI health endpoint](images/status_health_ok.png)

## Author

**Alexandre Vidal**  
Email: alexvidaldepalol@gmail.com  
[LinkedIn](https://www.linkedin.com/in/alexandre-vidal-de-palol-a18538155/)  
[GitHub](https://github.com/alexvidi)
