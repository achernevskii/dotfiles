# Ansible role: podman

Installs [Podman](https://podman.io). On RedHat it can also enable the
`podman-auto-update` timer for the user from [`user_facts`](../user_facts), so
rootless containers labelled with `AutoUpdate=` pull newer images on their own.

Dependencies: [`homebrew`](../homebrew) (Darwin only), [`user_facts`](../user_facts).

## Variables

| Variable | Default | Purpose |
|---|---|---|
| `podman_auto_update` | `false` | Enable the user `podman-auto-update.timer`. |
| `podman_auto_update_schedule` | `*-*-* 03:00:00` | When the timer runs, in `OnCalendar` syntax. |

See `defaults/main.yaml` for the rest.

```yaml
vars:
  podman_auto_update: true
```

The schedule is set by a drop-in over the stock timer, which keeps its
`RandomizedDelaySec=900`, so the run starts up to 15 minutes after the
scheduled time. The timer only fires while the user is logged out if lingering
is enabled for them.

## Usage

```sh
systemctl --user list-timers podman-auto-update.timer
podman auto-update --dry-run
journalctl --user -u podman-auto-update -f
```

## Currently supported Ansible os families

- `RedHat` (Fedora / RHEL)
- `Darwin` (install only)
