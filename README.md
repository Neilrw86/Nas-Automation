# HomeLab Automation Repository

[![GitHub Super-Linter](https://github.com/Neilrw86/Nas-Automation/workflows/Lint%20Code%20Base/badge.svg)](https://github.com/marketplace/actions/super-linter)
![GitHub private repo](https://img.shields.io/badge/repo-private-green)
![CI](https://github.com/Neilrw86/Nas-Automation/actions/workflows/ci.yml/badge.svg)
![MicroK8s](https://img.shields.io/badge/MicroK8s-v1.20-blue)
[![DeepSource](https://app.deepsource.com/gh/Neilrw86/Nas-Automation.svg/?label=active+issues&show_trend=true&token=_uQfCr6BJozslReU1uOTPLO5)](https://app.deepsource.com/gh/Neilrw86/Nas-Automation/)
[![DeepSource](https://app.deepsource.com/gh/Neilrw86/Nas-Automation.svg/?label=resolved+issues&show_trend=true&token=_uQfCr6BJozslReU1uOTPLO5)](https://app.deepsource.com/gh/Neilrw86/Nas-Automation/)

## Table of Contents
- [Goal](#goal)
- [Folders](#folders)
    - [Ansible](#ansible)
    - [Kubernetes](#kubernetes)
- [Continuous Integration and Testing](#continuous-integration-and-testing)
- [Monitoring](#monitoring)
- [Usage](#usage)
- [Future Plans](#future-plans)
- [Contribution Guidelines](#contribution-guidelines)
- [License](#license)

## Goal

The goal is to create a self-contained repository for configuring a home lab.

## Folders

### Ansible

Ansible handles all configurations via the following **roles**:

- **common**: Shared by all devices.
- **workstations**: For personal endpoints.
- **Microk8s**: Provisioning of Microk8s via snap, not cluster enrollment.
- **monitoring**: Installs node-exporter, promtail, and telegraf on all devices to be monitored with InfluxDB targets.
- **turing**: ARM64 & Turing specific role.

Ansible playbooks included in this repository:

- **site.yml**: Main playbook to run all roles.
- **update.yml**: Playbook to patch all devices.
- **microk8-remove.yml**: Playbook to purge Microk8s.

### Kubernetes

The kubernetes folder contains configuration files and manifests for deploying and managing various applications and services within a Kubernetes cluster. This includes Ingress resources, service definitions, deployments, and other Kubernetes objects necessary for the operation of the home lab environment.

#### Structure

- **apps**: Contains application-specific Kubernetes manifests.
- **argocd**: Configuration files for deploying Argo CD.
- **grafana**: Configuration files for deploying Grafana.
- **prometheus**: Configuration files for deploying Prometheus.
- **influxdb**: Configuration files for deploying InfluxDB.
- **base**: Contains base configurations and common resources used across multiple applications.
- **ingress**: Contains Ingress resources for routing external traffic to the services within the cluster.

#### Purpose

The purpose of the kubernetes folder is to provide a centralized location for all Kubernetes-related configurations, making it easier to manage and deploy applications within the home lab Kubernetes cluster. By organizing the configurations in this manner, it ensures consistency and simplifies the deployment process.

## Continuous Integration and Testing

This repository uses GitHub Actions for continuous integration. The CI pipeline includes the following workflows:

- **Lint Code Base**: Uses [GitHub Super-Linter](https://github.com/marketplace/actions/super-linter) to ensure code quality and consistency.
- **Run Ansible Playbooks**: Executes Ansible playbooks to validate configurations and roles.
- **Test Roles**: Runs automated tests for each Ansible role to ensure they work as expected.

These workflows are defined in the `.github/workflows` directory and are triggered on push and pull request events.

The CI pipeline relies on **self-hosted** runners within the homelab to execute the workflows. This allows for testing and validation in an environment that closely mirrors the production setup.

## Monitoring

The monitoring setup in the home lab includes the following components:

- **Grafana**: Running on `desktop`.
- **InfluxDB**: Running on `nas5`.

All lab hosts have the following monitoring tools installed via the `monitoring` role:

- **Telegraf**
- **Prometheus**
- **Node Exporter**
- **Promtail**    git push --set-upstream origin March

These tools are used to collect and visualize metrics and logs from all devices in the home lab.

## Usage

To run the main playbook:
```sh
ansible-playbook site.yml
```
## Branching Strategy

The repository follows a monthly branching strategy to manage changes and updates efficiently. The key points of this strategy are:

- **Monthly Branches**: All main changes and feature developments are performed in branches named after the current month (e.g., `2023-10` for October 2023).
- **Merging/Rebasing**: Throughout the month, these branches may be merged or rebased as needed to incorporate updates and resolve conflicts.
- **Main Branch**: The `main` branch remains the stable branch from which the CI/CD runner operates. It is not directly used for development but is updated with tested and stable changes from the monthly branches.

This strategy ensures that the `main` branch is always in a deployable state, while allowing for organized and manageable development cycles.

## Release Process

At the end of each month, changes merged into the `main` branch undergo a thorough testing and deployment process. This ensures that all updates are stable and functional before being marked as a release. The key steps in this process are:

1. **Testing**: All changes are rigorously tested in a staging environment that mirrors the production setup. This includes running all CI workflows, automated tests, and manual validation steps.
2. **Deployment**: Once testing is complete, the changes are deployed to the production environment within the home lab.
3. **Release Tagging**: After successful deployment, the changes are tagged with a release version in the repository. This versioning helps in tracking and managing releases over time.

This process ensures that the `main` branch remains stable and that each release is reliable and well-documented.
## Future Plans

In the future, this repository will be merged with the `homelab-configs` repository to consolidate automation and configuration tasks. This will streamline the management and deployment of configurations across the home lab environment.

## Contribution Guidelines

[Contribution Guidelines](#contribution-guidelines)

## License

[License](#license)
