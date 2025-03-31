{
  description = "NixOS";

  inputs = {
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
        cups = "false"; # Use Cups
      };
      # ----- USER SETTINGS ----- #
      # This user is in wheel group
      userSettings = {
        username = "janpstrunn";
        name = "Janpstrunn";
        email = "janpstrunn@disroot.org";
        profile = "desktop";
        homeDir = "/home/${userSettings.username}";
        editor = "emacsclient -a -c 'emacs'";
        cusorTheme = pkgs.rose-pine-icon-theme;
        gtkTheme = pkgs.rose-pine-gtk-theme;
        displayManager = "ly";
        wm = "hyprland";
        term = "kitty";
      };

      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages."${system}";

    in {
      nixosConfigurations = {
          janpstrunn = lib.nixosSystem {
              system = "${system}";
              modules = [ ./modules/core.nix ];
              specialArgs = {
                 inherit userSettings;
                 inherit systemSettings;
                 inherit system;
              };
            };
        };
      homeConfigurations = {
          janpstrunn = home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              modules = [ ./modules/users.nix ];
              extraSpecialArgs = {
                 inherit userSettings;
                 inherit systemSettings;
                 inherit system;
              };
            };
        };
    };
}
