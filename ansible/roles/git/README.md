# Ansible role: Install git

An Ansible Role that:
1. Installs `git` on your unix system.
2. Sets global `git` name to `{{ user_name }}` variable.
3. Sets global `git` email to `{{ user_email }}` variable.

# Requirements

1. ["create_user" ansible role](../create_user).

# Currently supported Ansible os families

- `RedHat`
- `Debian`
- `Archlinux`

# Useful links

Info about `ansible` modules used in this role:
1. Install packages using [apt](https://docs.ansible.com/ansible/latest/modules/apt_module.html) for Debian.
2. Install packages using [yum](https://docs.ansible.com/ansible/latest/modules/yum_module.html) for CentOS.
3. Install packages using [pacman](https://docs.ansible.com/ansible/latest/modules/pacman_module.html) for Arch and Manjaro.
4. Global `git` settings have been set using [shell](https://docs.ansible.com/ansible/latest/modules/shell_module.html) module.

Info about `ansible` roles:
1. Official [documentation page](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html)
