# If running from tty1 start sway
set TTY1 (tty)
[ "$TTY1" = "/dev/tty1" ] && exec sway --debug 2>> ~/sway-log.txt

starship init fish | source
zoxide init fish | source