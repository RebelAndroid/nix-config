{
  config,
  pkgs,
  lib,
  ...
}: {
  wayland.windowManager.sway = {
    enable = true;
  };

  xdg.configFile."sway/config".source = lib.mkForce ./sway-config;
  xdg.configFile."sway/sway-bar-script.sh".source = lib.mkForce ./sway-bar-script.sh;
  xdg.configFile."unova-map-background.png".source = ./unova-map-background.png;

  xdg.configFile."tofi/config".source = ./tofi-config;
}
