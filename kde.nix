{
  config,
  pkgs,
  lib,
  ...
}: {
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
}
