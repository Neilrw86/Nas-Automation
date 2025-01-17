# HomeLab Automation Repository

[![GitHub Super-Linter](https://github.com/Neilrw86/Nas-Automation/workflows/Lint%20Code%20Base/badge.svg)](https://github.com/marketplace/actions/super-linter)
![GitHub commit activity](https://img.shields.io/github/commit-activity/w/Neilrw86/Nas-Automation)
![GitHub private repo](https://img.shields.io/badge/repo-private-green)
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
- **update.yml**: Playbook to patch all
- **microk8-remove.yml**: Playbook to purge Microk8s.

### Future **Roles**

- **media server**: To combine the homelab docker repository.
- **storage**: For storage arrays to be exported.

## TODO

- [ ] Define and implement media server role.
- [ ] Define and implement storage role.
- [ ] Document each role in detail.
- [ ] Create automated tests for each role.
- [ ] Set up continuous integration for the repository.
