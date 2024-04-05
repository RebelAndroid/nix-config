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

  # services.xserver.enable = true;
  # services.xserver.excludePackages = [pkgs.xterm];
  # # Enable touchpad support
  # services.xserver.libinput.enable = true;

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.tailscale.enable = true;

  virtualisation.docker.enable = true;

  services.syncthing = {
    enable = true;
    user = "christopher";
    dataDir = "/home/christopher/.data/syncthing";
    configDir = "/home/christopher/.config/syncthing";
  };

  time.timeZone = "America/New_York";

  environment.systemPackages = with pkgs; [
    git
    micro
  ];
  programs.nano.enable = false;

  environment.shellAliases = {
    btm = "btm --mem_as_value";
    z = "zoxide";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.christopher = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker"]; # Enable ‘sudo’ for the user.
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
  ];

  security.apparmor.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
