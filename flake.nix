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
    homeConfigurations."christopher@fighting-falcon" = home-manager.lib.homeManagerConfiguration {
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

    homeConfigurations."christopher@laptop" = home-manager.lib.homeManagerConfiguration {
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
    nixosConfigurations.fighting-falcon = nixpkgs.lib.nixosSystem {
      inherit pkgs;
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        ({...}: {
          networking.hostName = "fighting-falcon";
        })
      ];
    };

    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      inherit pkgs;
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./laptop-hardware-configuration.nix
      ];
    };
  };
}
