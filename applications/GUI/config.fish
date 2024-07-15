# If running from tty1 start sway
set TTY1 (tty)
[ "$TTY1" = "/dev/tty1" ] && exec sway

starship init fish | source
zoxide init fish | source

export RESTIC_REPOSITORY="/hard_drive/restic-repo"