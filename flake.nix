{
  description = "NixOS";

  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest"; # Declare flatpaks
    # nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    nixpkgs.url = "nixpkgs/nixos-24.11";
  };

  outputs = {
    home-manager,
    nix-flatpak,
    nixpkgs,
    # nixpkgs-unstable,
    ...
  }: let
    # ----- SYSTEM SETTINGS ----- #
    systemSettings = {
      hostname = "beelzebub";
      timezone = "America/Sao_Paulo";
      locale = "en_US.UTF-8";
      extra_locale = "pt_BR.UTF-8"; # ${systemSettings.locale} # if single locale
      keyboard = "us";
      cups = "false"; # Use Cups
    };
    # ----- USER SETTINGS ----- #
    # This user is in wheel group
    userSettings = {
      username = "janpstrunn";
      name = "Janpstrunn";
      email = "janpstrunn@disroot.org";
      profile = "desktop"; # laptop
      homeDir = "/home/${userSettings.username}";
      editor = "neovide";
      themeName = "rose-pine";
      iconName = "oomox-rose-pine";
      iconTheme = pkgs.rose-pine-icon-theme;
      gtkTheme = pkgs.rose-pine-gtk-theme;
      displayManager = "ly"; # any
      wm = "hyprland"; # hyprland, gnome, plasma
      term = "alacritty"; # any
    };
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
    # pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      janpstrunn = lib.nixosSystem {
        system = "${system}";
        modules = [
          (./. + "/profiles/" + ("/" + userSettings.profile) + "/configuration.nix")
          nix-flatpak.nixosModules.nix-flatpak
        ];
        specialArgs = {
          # inherit pkgs-unstable;
          inherit system;
          inherit systemSettings;
          inherit userSettings;
        };
      };
    };
    homeConfigurations = {
      janpstrunn = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          (./. + "/profiles/" + ("/" + userSettings.profile) + "/home.nix")
        ];
        extraSpecialArgs = {
          # inherit pkgs-unstable;
          inherit system;
          inherit systemSettings;
          inherit userSettings;
        };
      };
    };
  };
}
