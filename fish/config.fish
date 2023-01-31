if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x GPG_TTY (tty)
    echo UPDATESTARTUPTTY | gpg-connect-agent
end

set -x PATH $HOME/.local/bin:$PATH
set -x GPGKEY 96A4DA12
set -x EDITOR nvim

starship init fish | source
