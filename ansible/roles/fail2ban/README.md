# Ansible role: fail2ban

An Ansible Role that installs and configures
[fail2ban](https://github.com/fail2ban/fail2ban) to protect SSH from
brute-force attempts.

## What it does

1. Installs `fail2ban` and `fail2ban-firewalld` (bans are applied through
   firewalld, the native backend on Fedora).
2. Writes `/etc/fail2ban/jail.d/sshd.local` enabling the `sshd` jail:
   ban after 4 failed attempts within 1 hour, reading the systemd journal.
   The base ban is 30 minutes, escalates for repeat offenders
   (`bantime.increment`), and is jittered by up to 5 minutes
   (`bantime.rndtime`) so ban expiry isn't predictable.
3. Enables and starts the `fail2ban` service, restarting it on config change.

## Verify after applying

```bash
# lists active jails
sudo fail2ban-client status

# banned IPs, failure counts
sudo fail2ban-client status sshd
```

## Currently supported Ansible os families

- `RedHat` (Fedora / RHEL)
