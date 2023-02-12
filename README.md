# HomeLab Automation Repository
[![GitHub Super-Linter](https://github.com/Neilrw86/Nas-Automation/workflows/Lint%20Code%20Base/badge.svg)](https://github.com/marketplace/actions/super-linter)
![GitHub commit activity](https://img.shields.io/github/commit-activity/w/Neilrw86/Nas-Automation)


**Goal is to be a self-contained repository configuring home lab.

That involves

- Base packages for all
 - workstations setup
 - one dedicated media server (merge docker-compose from homelab repo)
 - one dedicated hyp
  - VM definitions
  - Vm management
- kubernetes bootstrap 
- kubernetes deployments

## flow
 1. Bare metal ->  Ansible for role definition
 2. Roles defined:
  2.1. TF/Packer for Hypervisor
 3. k8s bootstrap for k8s host
 
## TODO

**pre-req**
- create baseline k8s deployment (use homer)
- plan storage for the cluster
- map needed PV's for home media migration

- create runner




