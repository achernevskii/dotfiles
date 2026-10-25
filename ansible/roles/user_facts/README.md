# Ansible role: user_facts

A read-only role that looks up the account named by `user_login` on the target
host and exposes everything about it as a single `user` dict. It never creates
or modifies the user; a login that doesn't exist fails the play.

## Usage

List it as a dependency in the `meta/main.yaml` of any role that needs the
data. Ansible runs it once per play, however many roles depend on it:

```yaml
dependencies:
  - user_facts
```

The lookups run on the target, so the values are correct even when the play
uses `become: true` (unlike `ansible_env.HOME` or `ansible_user_uid`, which
then describe root).

## Variables

Inputs, set in [`group_vars/all.yaml`](../../group_vars/all.yaml):

| Variable | Purpose |
|---|---|
| `user_login` | Login of the existing account to look up. |
| `user_fullname` | Display name, copied into `user.fullname`. |

Output:

| Key | Source |
|---|---|
| `user.login` | `user_login` |
| `user.fullname` | `user_fullname` |
| `user.uid` | `UniqueID` / passwd uid |
| `user.gid` | `PrimaryGroupID` / passwd gid |
| `user.group` | name of the primary group |
| `user.home` | `NFSHomeDirectory` / passwd home |
| `user.shell` | `UserShell` / passwd shell |

## Supported systems

- **Linux**: `getent passwd` and `getent group`.
- **macOS**: `dscl . -read /Users/<login>` and `id -gn`, since macOS doesn't
  ship `getent`.

Any other system fails the play with a clear message.
