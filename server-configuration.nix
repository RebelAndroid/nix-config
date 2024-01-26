{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./apparmor-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  services.tailscale.enable = true;

  # prevent laptop from suspending when closed
  # maybe put this in craptop-hardware-configuration?
  services.logind.lidSwitch = "ignore";

  virtualisation.docker.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.admin = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker"]; # Enable ‘sudo’ for the user.
    password = "password";
  };

  environment.systemPackages = with pkgs; [
    git
    micro
  ];

  programs.nano.enable = false;

  environment.shellAliases = {
    btm = "btm --mem_as_value";
  };

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  users.users.admin = {
    packages = with pkgs; [
      git
      home-manager
    ];

    shell = pkgs.fish;
  };
  programs.fish.enable = true;
  environment.pathsToLink = ["/share/fish"];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  security.apparmor.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
