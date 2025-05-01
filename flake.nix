{
  description = "NixOS";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    # nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    # nixpkgs-unstable,
    home-manager,
    ...
  }: let
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
      editor = "emacsclient -c";
      themeName = "rose-pine";
      iconName = "oomox-rose-pine";
      iconTheme = pkgs.rose-pine-icon-theme;
      gtkTheme = pkgs.rose-pine-gtk-theme;
      displayManager = "ly"; # any
      wm = "hyprland"; # hyprland, gnome, plasma
      term = "alacritty";
    };

    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    # pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
  in {
    nixosConfigurations = {
      janpstrunn = lib.nixosSystem {
        system = "${system}";
        modules = [
          (./. + "/profiles/" + ("/" + userSettings.profile) + "/configuration.nix")
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
