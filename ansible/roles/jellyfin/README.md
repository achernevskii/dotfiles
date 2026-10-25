# Ansible role: jellyfin

Runs [Jellyfin](https://jellyfin.org) as a rootless Podman Quadlet container,
owned by the user from [`user_facts`](../user_facts).

Dependencies: [`podman`](../podman), [`user_facts`](../user_facts).

## Variables

| Variable | Default | Purpose |
|---|---|---|
| `jellyfin_media_mounts` | **required** | Read-only media mounts: list of `source` / `destination`. |
| `jellyfin_render_devices` | `[]` | Devices for hardware transcoding. |
| `jellyfin_port` | `8096` | Published web port. |
| `jellyfin_image` | `docker.io/jellyfin/jellyfin:latest` | Container image. |

See `defaults/main.yaml` for the rest.

```yaml
vars:
  jellyfin_render_devices:
    - "/dev/dri/renderD128"
  jellyfin_media_mounts:
    - source: "/srv/media/Movies"
      destination: "/media/Movies"
```

## Usage

```sh
systemctl --user status jellyfin
journalctl --user -u jellyfin -f
```
