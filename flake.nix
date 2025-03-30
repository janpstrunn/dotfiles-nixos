{
description = "Elegant Vagrant";

  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11"
    nixpkgs.url = "nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
          janpstrunn = lib.nixosSystem {
              system = "x86_64-linux";
              modules = [ ./configuration.nix ];
            };
        };
    };
}

# sudo nixos-rebuild switch --flake .#janpstrunn
