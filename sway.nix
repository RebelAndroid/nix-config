{
  config,
  pkgs,
  lib,
  ...
}: {
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      startup = [{command="firefox";}];
    };
  };

  xdg.configFile."sway/config".source = lib.mkForce ./sway-config;
  xdg.configFile."unova-map-background.png".source = ./unova-map-background.png;
}