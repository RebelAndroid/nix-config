{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  services.printing.enable = true;

  hardware.pulseaudio.enable = true;

  services.tailscale.enable = true;

  virtualisation.docker.enable = true;

  time.timeZone = "America/New_York";

  environment.systemPackages = with pkgs; [
    git
    micro
    adwaita-icon-theme # needed for Xournal++ (and probably other applications)
  ];
  programs.nano.enable = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.christopher = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker" "video"]; # wheel - sudo, video - light
    password = "password";
    packages = with pkgs; [
      git
      home-manager
    ];

    shell = pkgs.fish;
  };

  programs.fish.enable = true;
  environment.pathsToLink = ["/share/fish"];

  programs.steam.enable = true;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    liberation_ttf
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
