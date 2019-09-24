# Ansible role: Create user

An Ansible Role that:
1. Creates group `wheel`.
2. Creates new user.
3. Adds user to group `wheel`.
3. Creates home folder for created user.
3. Generates `ssh` key for created user.

# Useful links

Info about `ansible` modules used in this role:
1. User created using [user](https://docs.ansible.com/ansible/latest/modules/user_module.html) module.
2. Group created using [group](https://docs.ansible.com/ansible/latest/modules/group_module.html) module.

Info about `ansible` roles:
1. Official [documentation page](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html)
