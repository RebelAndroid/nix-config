{
  config,
  pkgs,
  lib,
  ...
}: {
  services.gammastep.enable = true;
  services.gammastep.latitude = 40.0;
  services.gammastep.longitude = -83.0;
}
