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
      # ----- SYSTEM SETTINGS ----- #
      systemSettings = {
        hostname = "beelzebub";
        timezone = "America/Sao_Paulo";
        locale = "en_US.UTF-8";
        extra_locale = "pt_BR.UTF-8";
        keyboard = "us";
        cups = "false";
      };
      # ----- USER SETTINGS ----- #
      # This user is in wheel group
      userSettings = {
        username = "janpstrunn";
        name = "Janpstrunn";
        email = "janpstrunn@disroot.org";
        homeDir = "/home/${userSettings.username}";
      };
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages."${system}";
    in {
      nixosConfigurations = {
          janpstrunn = lib.nixosSystem {
              system = "${system}";
              modules = [ ./configuration.nix ];
              specialArgs = {
                 inherit username
              };
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
