{
  description = "NixOS";

  inputs = {
    disko.inputs.nixpkgs.follows = "nixpkgs";
    disko.url = "github:nix-community/disko";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest"; # Declare flatpaks
    # nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    nixpkgs.url = "nixpkgs/nixos-25.05";
  };

  outputs = {
    home-manager,
    nix-flatpak,
    nixpkgs,
    disko,
    # nixpkgs-unstable,
    ...
  }: let
    # ----- SYSTEM SETTINGS ----- #
    systemSettings = {
      hostname = "beelzebub"; # desktop,nixos,home
      timezone = "America/Sao_Paulo"; # America/Sao_Paulo,Asia/Tokyo,America/Chicago
      locale = "en_US.UTF-8"; #en_US.UTF-8
      extra_locale = "pt_BR.UTF-8"; # en_US.UTF-8
      keyboard = "us"; # us,es
      cups = "false"; # true,false
    };
    # ----- USER SETTINGS ----- #
    # This user is in wheel group
    userSettings = {
      username = "janpstrunn"; # janpstrunn,admin,user
      name = "Janpstrunn"; # Janpstrunn,Admin,User
      email = "janpstrunn@disroot.org"; # john@doe.com
      profile = "desktop"; # desktop,laptop
      homeDir = "/home/${userSettings.username}";
      editor = "neovide"; # emacs,neovide
      themeName = "rose-pine";
      iconName = "oomox-rose-pine";
      iconTheme = pkgs.rose-pine-icon-theme;
      gtkTheme = pkgs.rose-pine-gtk-theme;
      displayManager = "ly"; # ly,sddm
      wm = "hyprland"; # hyprland,gnome,plasma
      term = "alacritty"; # alacritty,ghostty,foot
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
          disko.nixosModules.disko
          ./profiles/disks/ext4-luks.nix
          {
            _module.args.disks = ["/dev/sda"];
          }
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${userSettings.username} = import (./. + "/profiles/" + ("/" + userSettings.profile) + "/home.nix");
            home-manager.extraSpecialArgs = {
              # inherit pkgs-unstable;
              inherit pkgs;
              inherit system;
              inherit systemSettings;
              inherit userSettings;
            };
          }
        ];
        specialArgs = {
          # inherit pkgs-unstable;
          inherit system;
          inherit systemSettings;
          inherit userSettings;
        };
      };
    };
  };
}
