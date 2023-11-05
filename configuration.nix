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

  services.syncthing = {    
      enable = true;
      user = "christopher";
      dataDir = "/home/christopher/.data/syncthing";
      configDir = "/home/myusername/.config/syncthing";
      overrideDevices = true;     # overrides any devices added or deleted through the WebUI
      overrideFolders = true;     # overrides any folders added or deleted through the WebUI
      settings = {
        devices = {
          "fighting-falcon" = { id = "YJQVJ2A-MAB6VYC-NHNIQF5-I6WX5NX-V6URDYS-OKV2Q4J-UGTFIDG-N5WYJAB"; };
          "laptop" = { id = "FEIWANR-HOROKFN-JD3SRTM-QMZ3DS2-447O5VD-4VET64D-QRYSHJG-6DNN3QD"; };
        };
        folders = {
          "home-directory" = {        # Name of folder in Syncthing, also the folder ID
            path = "/home/christopher";    # Which folder to add to Syncthing
            devices = [ "fighting-falcon" "laptop" ];      # Which devices to share the folder with
          };
        };
      };
    };


  # Enable gnome
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # enable autologin
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "christopher";
  # workaround to fix autologin
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  environment.gnome.excludePackages =
    (with pkgs; [
      gnome-photos
      gnome-tour
    ])
    ++ (with pkgs.gnome; [
      cheese # webcam tool
      gnome-music
      gnome-terminal
      gedit # text editor
      epiphany # web browser
      geary # email reader
      #evince # document viewer
      gnome-characters
      totem # video player
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
      gnome-calendar
    ]);

  services.printing.enable = true;

  services.tailscale.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.christopher = {
    isNormalUser = true;
    extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
    password = "password";
  };

  environment.systemPackages = with pkgs; [
    git
    nano
  ];
  environment.shellAliases = {
    #bottom = "btm";
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
