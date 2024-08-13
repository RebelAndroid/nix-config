{
  description = "Christopher's Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfreePredicate = pkg:
        builtins.elem (pkgs.lib.getName pkg) [
          "steam"
          "steam-original"
          "steam-runtime"
          "steam-run"
          "obsidian"
        ];
    };
  in {
    homeConfigurations."christopher" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = inputs;
      modules = [
        ./system/XDG.nix
        ./applications/GUI
        ./applications/CLI-TUI
        ./sway.nix
        ./gammastep.nix
        ({...}: {
          home.stateVersion = "22.11";
          home.username = "christopher";
          home.homeDirectory = "/home/christopher";
          programs.direnv.enable = true;

          home.shellAliases = {
            btm = "btm --mem_as_value";
            z = "zoxide";
            ls = "eza -l";
            mv = "mv -i";
          };
        })
      ];
    };

    homeConfigurations."admin" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = inputs;
      modules = [
        ({...}: {
          home.stateVersion = "22.11";
          home.username = "admin";
          home.homeDirectory = "/home/admin";

          home.shellAliases = {
            mv = "mv -i";
          };

          home.packages = with pkgs; [
            smartmontools # get information about drives
          ];
        })
      ];
    };

  homeConfigurations."game" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = inputs;
      modules = [
        ./sway.nix
        ./gammastep.nix
        ({...}: {
          home.stateVersion = "22.11";
          home.username = "game";
          home.homeDirectory = "/home/game";

          home.shellAliases = {
            mv = "mv -i";
          };
        })
      ];
    };

    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      inherit pkgs;
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        # ./gnome.nix
        ./smart-log.nix
        ({...}: {
          networking.hostName = "desktop";
          security.polkit.enable = true;
          # services.getty.autologinUser = "christopher";
        })
      ];
    };

    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      inherit pkgs;
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./laptop-hardware-configuration.nix
        # ./gnome.nix
        ./kde.nix
      ];
    };

    nixosConfigurations.craptop = nixpkgs.lib.nixosSystem {
      inherit pkgs;
      system = "x86_64-linux";
      modules = [
        ./server-configuration.nix
        ./craptop-hardware-configuration.nix
        ({...}: {
          networking.hostName = "craptop";
        })
      ];
    };
  };
}
