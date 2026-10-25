# Ansible role: Cockpit (localhost-only)

An Ansible Role that installs [Cockpit](https://cockpit-project.org/) as a
web dashboard for Podman containers/pods, SELinux denials and system
CPU/memory usage, and binds it to loopback so it is not exposed on the network.

## What it does

1. Installs `cockpit`, `cockpit-podman` and `cockpit-selinux`.
2. Writes the `/etc/systemd/system/cockpit.socket.d/listen.conf` drop-in, which
   clears the vendor `ListenStream=9090` (all interfaces) and listens on
   `127.0.0.1:cockpit_port` only.

## Variables

See `defaults/main.yaml`:

- `cockpit_port` — loopback port the socket listens on (default `9090`).

## Accessing Cockpit

Cockpit is reachable only from the host itself, so open an SSH tunnel:

```bash
ssh -L 9090:localhost:9090 <user>@<server>
```

Then browse `http://localhost:9090`. Log in as the user that owns the rootless
Podman containers so `cockpit-podman` shows them.

## Verify after applying

```bash
# should show only 127.0.0.1:9090
ss -ltn | grep 9090

# vendor unit followed by the listen.conf drop-in
systemctl cat cockpit.socket
```

## Currently supported Ansible os families

- `RedHat` (Fedora / RHEL)

## Notes

- The role does not touch the firewall. Fedora Server allows the `cockpit`
  service in its default zone, but with Cockpit on loopback only that rule has
  no effect, so it can be left in place or removed manually.
