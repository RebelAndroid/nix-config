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

  services.xserver.enable = true;
  services.xserver.excludePackages = [pkgs.xterm];

  services.syncthing = {
    enable = true;
    user = "christopher";
    dataDir = "/home/christopher/.data/syncthing";
    configDir = "/home/christopher/.config/syncthing";
    overrideDevices = true; # overrides any devices added or deleted through the WebUI
    overrideFolders = true; # overrides any folders added or deleted through the WebUI
    settings = {
      devices = {
        "fighting-falcon" = {id = "YJQVJ2A-MAB6VYC-NHNIQF5-I6WX5NX-V6URDYS-OKV2Q4J-UGTFIDG-N5WYJAB";};
        "laptop" = {id = "FEIWANR-HOROKFN-JD3SRTM-QMZ3DS2-447O5VD-4VET64D-QRYSHJG-6DNN3QD";};
      };
      folders = {
        "home-directory" = {
          # Name of folder in Syncthing, also the folder ID
          path = "/home/christopher"; # Which folder to add to Syncthing
          devices = ["fighting-falcon" "laptop"]; # Which devices to share the folder with
          versioning = {
            type = "simple";
            params = {
              keep = "10";
            };
          };
        };
      };
    };
  };

  services.printing.enable = true;

  services.tailscale.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support
  services.xserver.libinput.enable = true;

  virtualisation.docker.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.christopher = {
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

  fonts.packages = with pkgs; [
    jetbrains-mono
  ];

  users.users.christopher = {
    packages = with pkgs; [
      git
      home-manager
    ];

    shell = pkgs.fish;
  };
  programs.fish.enable = true;
  environment.pathsToLink = ["/share/fish"];
  programs.thunar.enable = false;
  programs.steam.enable = true;

  # enable auto upgrade
  system.autoUpgrade = {
    enable = true;
    dates = "4:00";
    flake = "~/nix";
    flags = ["--update-input" "nixpkgs"];
    allowReboot = true;
  };
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  security.apparmor.enable = true;

  security.apparmor.packages = [pkgs.firefox];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
