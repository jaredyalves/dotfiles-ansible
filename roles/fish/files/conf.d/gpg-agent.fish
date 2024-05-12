# Check if gpg command exists
if command -v gpg >/dev/null
    # Set GPG_TTY environment variable to the current tty
    set -x GPG_TTY (tty)

    # Ensure SSH_AGENT_PID is set and update SSH_AUTH_SOCK if necessary
    if not set -q gnupg_SSH_AUTH_SOCK_by[1] || math $gnupg_SSH_AUTH_SOCK_by[1] -ne (pid)
        # Update SSH_AUTH_SOCK using gpgconf if necessary
        set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
    end

    # Update GPG agent's startup tty
    gpg-connect-agent updatestartuptty /bye >/dev/null
end
