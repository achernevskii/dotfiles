# Ansible role: Install snapd

An Ansible Role that:
1. Installs and prepares `snapd` on your unix system.
2. Reboots your system if `snapd` is installed

# Currently supported Ansible os families

- `RedHat`
- `Debian`
- `Archlinux`

# Useful links

Info about `ansible` modules used in this role:
1. Install packages using [apt](https://docs.ansible.com/ansible/latest/modules/apt_module.html) for Debian.
2. Install packages using [yum](https://docs.ansible.com/ansible/latest/modules/yum_module.html) for CentOS.
3. On `Arch` `AUR` repository is cloned using [git](https://docs.ansible.com/ansible/latest/modules/git_module.html) module.
4. On `Arch` package is built using [command](https://docs.ansible.com/ansible/latest/modules/command_module.html) module.

Info about `ansible` roles:
1. Official [documentation page](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html)
