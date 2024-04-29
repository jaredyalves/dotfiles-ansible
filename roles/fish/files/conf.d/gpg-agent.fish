set -x GPG_TTY (tty)

set -e SSH_AGENT_PID
if not set -q gnupg_SSH_AUTH_SOCK_by[1] || math $gnupg_SSH_AUTH_SOCK_by[1] -ne (pid)
    set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
end

gpg-connect-agent updatestartuptty /bye >/dev/null
