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
            include <abstractions/icons>
            # nix store
            /nix/store/** rm,

            # config, TODO: use XDG
            /home/christopher/.config/galculator/galculator.conf rw,

            owner @{run}/user/*/dconf/user rw,
          }'';
  };

  security.apparmor.policies."bin.firefox" = {
    enable = false;
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

  security.apparmor.policies."bin.vlc" = {
    enable = true;
    enforce = false;

    profile = ''  
    include <tunables/global>
    /nix/store/**/bin/vlc {
      include <abstractions/icons>

      ${pkgs.vlc}/bin/.vlc-wrapped ix,
      /nix/store/** rm,

      /dev/urandom r,

      # access and edit list of recently watched media
      owner @{HOME}/.local/share/recently-used.xbel rw,

      # from app armor gitlab repository (apparmor/profiles/apparmor.d/abstraction/qt5-settings-write)
      owner @{HOME}/.config/#[0-9]*[0-9] rw,
      owner @{HOME}/.config/QtProject.conf rwl -> @{HOME}/.config/#[0-9]*[0-9],
      # for temporary files like QtProject.conf.Aqrgeb
      owner @{HOME}/.config/QtProject.conf.?????? rwl -> @{HOME}/.config/#[0-9]*[0-9],
      owner @{HOME}/.config/QtProject.conf.lock rwk,

      # vlc files
      owner @{HOME}/.config/vlc/** rw,
      owner @{HOME}/.local/share/vlc/** rw,

      owner @{HOME}/.local/share/mime/mime.cache r,

      owner @{HOME}/.cache/mesa_shader_cache/** r,

      owner /**/*.webm r,

      # allow vlc to send and receive signals from itself
      signal (send, receive) peer=@{profile_name},
    }'';
  };

  security.apparmor.includes."abstractions/icons" = ''
    owner @{HOME}/.local/share/icons/ r,
    owner @{HOME}/.local/share/icons/hicolor/{16,24,32,48,256}x{16,24,32,48,256}/apps/ r,
  '';

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
