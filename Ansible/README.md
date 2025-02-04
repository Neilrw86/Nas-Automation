# Ansible 

Designed for configuration of baremetal and various roles.

## Roles

- **common**: Shared by all devices.
- **workstations**: For personal endpoints.
- **update**: Handles package updates and upgrades.
- **monitoring**: Installs and configures monitoring tools like Prometheus, Node Exporter, and Telegraf.
- **plex**: Installs Plex as a service running in Docker.
- **microk8s**: Installs and configures MicroK8s.
- **turing**: Installs and configures MicroK8s on Turing nodes.

## CI Tasks

Continuous Integration tasks are defined in the `.github/workflows` directory. These tasks include:

- **Lint & Apply**: Lints the codebase and applies Ansible playbooks ([playbook-apply.yaml](.github/workflows/playbook-apply.yaml)).
- **Prettier**: Runs Prettier to format the code ([prettier.yaml](.github/workflows/prettier.yaml)).
- **JIT Security**: Runs security checks using JIT ([jit-security.yml](.github/workflows/jit-security.yml)).

## TODO

- Add the following as a package on nas role:
  - cifs-utils
  - docker-compose
- Place fstab entries in files in nas role
