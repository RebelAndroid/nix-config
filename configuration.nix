{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "fighting-falcon";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  services.xserver.enable = true;

  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  services.printing.enable = true;

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
    bottom = "btm";
  };

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  fonts.fonts = with pkgs; [
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

  #${builtins.elemAt (builtins.filter (lib.strings.hasInfix "gcc") pkgs.firefox.buildInputs) 0}/** r,
  security.apparmor.enable = true;
  security.apparmor.policies."bin.firefox" = {
    enable = true;
    enforce = true;
    profile = ''profile ${pkgs.firefox}/bin/firefox ${pkgs.firefox}/bin/firefox {
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

  security.apparmor.policies."bin.galculator" = {
    enable = true;
    enforce = true;
    profile = ''profile ${pkgs.galculator}/bin/galculator ${pkgs.galculator}/bin/galculator {
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

  security.apparmor.packages = [pkgs.firefox];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
