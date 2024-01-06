{
  config,
  lib,
  pkgs,
  ...
}: {
  security.apparmor.policies."bin.galculator" = {
    enable = true;
    enforce = true;
    profile = ''
      include <tunables/global>
      profile galculator /nix/store/**/bin/galculator {
            include <abstractions/base>
            include <abstractions/gtk>
            include <abstractions/dconf>
            # nix store
            /nix/store/** rm,

            # config, TODO: use XDG
            /home/christopher/.config/galculator/galculator.conf rw,

            owner @{run}/user/*/dconf/user rw,

            # icons
            /home/christopher/.local/share/icons r,
            /home/christopher/.local/share/icons/hicolor/16x16/apps/ r,
            /home/christopher/.local/share/icons/hicolor/24x24/apps/ r,
            /home/christopher/.local/share/icons/hicolor/32x32/apps/ r,
            /home/christopher/.local/share/icons/hicolor/48x48/apps/ r,
            /home/christopher/.local/share/icons/hicolor/256x256/apps/ r,
          }'';
  };

  security.apparmor.policies."bin.firefox" = {
    enable = true;
    enforce = false;
    profile = ''      /nix/store/**/bin/firefox {
            # run bin/firefox with this profile
            ${pkgs.firefox}/bin/firefox ix,
            ${pkgs.firefox}/lib/firefox/firefox ix,
            #
            ${pkgs.firefox}/** rm,
            #glibc and locales
            /nix/store/** rm,

            # terminal files
            /dev/tty rw,
            /dev/pts/0 rw,

            /dev/null w,

            # list of filesystems supported by kernel
            /proc/filesystems r,

            # cpu info
            /proc/cpuinfo r,

          }'';
  };

  security.apparmor.includes."abstractions/gtk" = ''
    /usr/share/themes/{,**} r,

    /usr/share/gtksourceview-[0-9]*/{,**} r,

    /usr/share/gtk-2.0/ r,
    /usr/share/gtk-2.0/gtkrc r,

    /usr/share/gtk-{3,4}.0/ r,
    /usr/share/gtk-{3,4}.0/settings.ini r,

    /etc/gtk-2.0/ r,
    /etc/gtk-2.0/gtkrc r,

    /etc/gtk-{3,4}.0/ r,
    /etc/gtk-{3,4}.0/*.conf r,
    /etc/gtk-{3,4}.0/settings.ini r,

    /etc/gtk/gtkrc r,

    owner @{HOME}/.themes/{,**} r,
    owner @{HOME}/.local/share/themes/{,**} r,

    owner @{HOME}/.gtk r,
    owner @{HOME}/.gtkrc r,
    owner @{HOME}/.gtkrc-2.0 r,
    owner @{HOME}/.gtk-bookmarks r,
    owner @{HOME}/.config/gtkrc r,
    owner @{HOME}/.config/gtkrc-2.0 r,
    owner @{HOME}/.config/gtk-{3,4}.0/ rw,
    owner @{HOME}/.config/gtk-{3,4}.0/settings.ini r,
    owner @{HOME}/.config/gtk-{3,4}.0/bookmarks r,
    owner @{HOME}/.config/gtk-{3,4}.0/gtk.css r,
    owner @{HOME}/.config/gtk-{3,4}.0/colors.css r,
    owner @{HOME}/.config/gtk-{3,4}.0/servers r,

    # for gtk file dialog
    owner @{HOME}/.config/gtk-2.0/ rw,
    owner @{HOME}/.config/gtk-2.0/gtkfilechooser.ini* rw,

    # .Xauthority file required for X connections
    owner @{HOME}/.Xauthority r,

    # Xsession errors file
    owner @{HOME}/.xsession-errors w,

    # Include additions to the abstraction
    include if exists <abstractions/gtk.d>
  '';
}
