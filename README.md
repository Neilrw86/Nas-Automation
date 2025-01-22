# HomeLab Automation Repository

[![GitHub Super-Linter](https://github.com/Neilrw86/Nas-Automation/workflows/Lint%20Code%20Base/badge.svg)](https://github.com/marketplace/actions/super-linter)
![GitHub private repo](https://img.shields.io/badge/repo-private-green)
![CI](https://github.com/Neilrw86/Nas-Automation/actions/workflows/ci.yml/badge.svg)
![MicroK8s](https://img.shields.io/badge/MicroK8s-v1.20-blue)


## Table of Contents
- [Goal](#goal)
- [Ansible Roles](#ansible-roles)
- [Ansible Playbooks](#ansible-playbooks)
- [Future Roles](#future-roles)
- [Continuous Integration](#continuous-integration)
- [Usage](#usage)
- [Prerequisites](#prerequisites)
- [Contribution Guidelines](#contribution-guidelines)
- [License](#license)

## Goal

The goal is to create a self-contained repository for configuring a home lab.

## Ansible **Roles**

Ansible handles all configurations via the following **roles**:

- **common**: Shared by all devices.
- **workstations**: For personal endpoints.
- **Microk8s**: Provisioning of Microk8s via snap, not cluster enrollment.
- **monitoring**: Installs node-exporter, promtail, and telegraf on all devices to be monitored with InfluxDB targets.
- **turing**: ARM64 & Turing specific role.

## Ansible **Playbooks**

Ansible playbooks included in this repository:

- **site.yml**: Main playbook to run all roles.
- **update.yml**: Playbook to patch all devices.
- **microk8-remove.yml**: Playbook to purge Microk8s.

### Future **Roles**

- **media server**: To combine the homelab docker repository.
- **storage**: For storage arrays to be exported.

## Continuous Integration

This repository uses GitHub Actions for continuous integration. The CI pipeline includes the following workflows:

- **Lint Code Base**: Uses [GitHub Super-Linter](https://github.com/marketplace/actions/super-linter) to ensure code quality and consistency.
- **Run Ansible Playbooks**: Executes Ansible playbooks to validate configurations and roles.
- **Test Roles**: Runs automated tests for each Ansible role to ensure they work as expected.

These workflows are defined in the `.github/workflows` directory and are triggered on push and pull request events.

The CI pipeline relies on **self-hosted** runners within the homelab to execute the workflows. This allows for testing and validation in an environment that closely mirrors the production setup.

## Usage

To run the main playbook:
```sh
ansible-playbook site.yml
```

## TODO

- [ ] Define and implement media server role.
- [ ] remove telegraph key and place in actions
- [ ] Define and implement storage role.
- [ ] Document each role in detail.
- [ ] Create automated tests for each role.
- [ ] Set up continuous integration for the repository.
