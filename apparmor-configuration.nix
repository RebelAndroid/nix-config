{
  config,
  lib,
  pkgs,
  ...
}: {
  security.apparmor.policies."bin.galculator" = {
    enable = true;
    enforce = true;
    profile = ''      /nix/store/**/bin/galculator {
            # nix store
            /nix/store/** rm,

            # config, TODO: use XDG
            /home/christopher/.config/galculator/galculator.conf rw,

            # gtk settings
            /home/christopher/.config/gtk-3.0/settings.ini r,
            /home/christopher/.config/gtk-3.0/gtk.css r,
            /home/christopher/.config/gtk-3.0/colors.css r,

            # random number generator
            /dev/urandom r,

            # icons
            /home/christopher/.local/share/icons r,
            /home/christopher/.local/share/icons/hicolor/16x16/apps/ r,
            /home/christopher/.local/share/icons/hicolor/24x24/apps/ r,
            /home/christopher/.local/share/icons/hicolor/32x32/apps/ r,
            /home/christopher/.local/share/icons/hicolor/48x48/apps/ r,
            /home/christopher/.local/share/icons/hicolor/256x256/apps/ r,

            # filesystems supported by the kernel
            /proc/filesystems r,
          }'';
  };

  security.apparmor.policies."bin.firefox" = {
    enable = true;
    enforce = true;
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
}
