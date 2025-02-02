# HomeLab Automation Repository

[![GitHub Super-Linter](https://github.com/Neilrw86/Nas-Automation/workflows/Lint%20Code%20Base/badge.svg)](https://github.com/marketplace/actions/super-linter)
![GitHub private repo](https://img.shields.io/badge/repo-private-green)
![MicroK8s](https://img.shields.io/badge/MicroK8s-v1.20-blue)
[![DeepSource](https://app.deepsource.com/gh/Neilrw86/Nas-Automation.svg/?label=active+issues&show_trend=true&token=_uQfCr6BJozslReU1uOTPLO5)](https://app.deepsource.com/gh/Neilrw86/Nas-Automation/)
[![DeepSource](https://app.deepsource.com/gh/Neilrw86/Nas-Automation.svg/?label=resolved+issues&show_trend=true&token=_uQfCr6BJozslReU1uOTPLO5)](https://app.deepsource.com/gh/Neilrw86/Nas-Automation/)

## Table of Contents
- [Goal](#goal)
- [Ansible Roles](#ansible-roles)
- [Ansible Playbooks](#ansible-playbooks)
- [Future Roles](#future-roles)
- [Continuous Integration](#continuous-integration)
- [Monitoring](#monitoring)
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

## Future Plans

In the future, this repository will be merged with the `homelab-configs` repository to consolidate automation and configuration tasks. This will streamline the management and deployment of configurations across the home lab environment.
