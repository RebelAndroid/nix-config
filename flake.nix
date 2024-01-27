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
        ./dconf
        ({...}: {
          home.stateVersion = "22.11";
          home.username = "christopher";
          home.homeDirectory = "/home/christopher";
          programs.direnv.enable = true;
        })
      ];
    };

    homeConfigurations."admin" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = inputs;
      modules = [
        ./system/XDG.nix
        ./applications/CLI-TUI
        ({...}: {
          home.stateVersion = "22.11";
          home.username = "admin";
          home.homeDirectory = "/home/admin";
          programs.direnv.enable = true;
        })
      ];
    };

    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      inherit pkgs;
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        ./gnome.nix
        ({...}: {
          networking.hostName = "desktop";
        })
      ];
    };

    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      inherit pkgs;
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./laptop-hardware-configuration.nix
        ./gnome.nix
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
