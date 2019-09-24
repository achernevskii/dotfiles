# Ansible role: Install vim

An Ansible Role that:

1. Installs `vim` on your unix system.
2. Installs `vim-plug` and all plugins specified in [.vimrc](files/.vimrc).
3. Sets `vim` as default `git` editor.

# Requirements

1. ["git" ansible role](../git).
2. ["create_user" ansible role](../create_user).

# Currently supported Ansible os families

- `RedHat`
- `Debian`
- `Archlinux`

# Useful links

Info about `ansible` modules used in this role:
1. Install packages using [apt](https://docs.ansible.com/ansible/latest/modules/apt_module.html) for Debian.
2. Install packages using [yum](https://docs.ansible.com/ansible/latest/modules/yum_module.html) for CentOS.
3. Install packages using [pacman](https://docs.ansible.com/ansible/latest/modules/pacman_module.html) for Arch and Manjaro.

Info about `ansible` roles:
1. Official [documentation page](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html)
