{
description = "Elegant Vagrant";

  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11"
    nixpkgs.url = "nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages."${system}";
    in {
      nixosConfigurations = {
          janpstrunn = lib.nixosSystem {
              system = "${system}";
              modules = [ ./configuration.nix ];
            };
        };
      homeConfigurations = {
          janpstrunn = home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              modules = [ ./home.nix ];
            };
        };
    };
}

# sudo nixos-rebuild switch --flake .#janpstrunn
