# Terraform AWS Kubernetes Deployment with Monitoring

This Terraform project automates the deployment of an EC2 instance on AWS and installs Kubernetes (K3s) along with a monitoring stack using Helm charts.

## Overview

The project uses Terraform to provision AWS resources and configure the EC2 instance. The monitoring stack includes essential components for observing the cluster's health and performance, as well as monitoring the CPU, memory, disk, and network traffic of the cluster nodes.

## Prerequisites

Before running the Terraform script, ensure you have the following prerequisites installed:

- Terraform
- AWS CLI configured with appropriate permissions
- Docker (for building custom images, if necessary)
- Helm 3

## Usage

To deploy the Kubernetes cluster and monitoring stack, execute the following command:

```sh
terraform apply
```

This command will trigger Terraform to create the AWS resources defined in the `main.tf` file, including an EC2 instance. The instance will be provisioned with Kubernetes and the monitoring stack automatically.

## Customization

- **AWS Configuration**: Modify the `main.tf` file to customize the AWS region, instance type, and other parameters as needed.
- **User Data Script**: Adjust the `user-data.sh` script to include additional setup steps or configuration changes for your environment.

## Monitoring Stack

The monitoring stack is installed using Helm, with the monitoring charts available at [nanox-monitoring](https://lior7daniel.github.io/nanox-monitoring-chart). The stack includes essential monitoring tools for Kubernetes clusters.

## Cleanup

To tear down the resources created by Terraform, run:


This command will trigger Terraform to create the AWS resources defined in the `main.tf` file, including an EC2 instance. The instance will be provisioned with Kubernetes and the monitoring stack automatically.

## Customization

- **AWS Configuration**: Modify the `main.tf` file to customize the AWS region, instance type, and other parameters as needed.
- **User Data Script**: Adjust the `user-data.sh` script to include additional setup steps or configuration changes for your environment.

## Monitoring Stack

The monitoring stack is installed using Helm, with the monitoring charts available at [nanox-monitoring](https://lior7daniel.github.io/nanox-monitoring-chart). The stack includes essential monitoring tools for Kubernetes clusters.

## Cleanup

To tear down the resources created by Terraform, run:

```sh
terraform destroy
```

This command will remove all resources provisioned by Terraform, including the EC2 instance and associated components.


