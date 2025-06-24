{...}: {
  imports = [
    # Home Manager
    ../../modules/home.nix
    # Programming Languages
    ../../modules/user/lang/android.nix
    ../../modules/user/lang/cpp.nix
    ../../modules/user/lang/go.nix
    ../../modules/user/lang/nodejs.nix
    ../../modules/user/lang/python.nix
    ../../modules/user/lang/ruby.nix
    ../../modules/user/lang/rust.nix
    # Applications
    ../../modules/user/apps/browser.nix
    ../../modules/user/apps/cli.nix
    ../../modules/user/apps/drive.nix
    # ../../modules/user/apps/editor/emacs.nix
    ../../modules/user/apps/editor/nvim.nix
    # ../../modules/user/apps/editor/obsidian.nix
    ../../modules/user/apps/email.nix
    ../../modules/user/apps/media.nix
    ../../modules/user/apps/office.nix
    ../../modules/user/apps/password-manager.nix
    # ../../modules/user/apps/syncthing.nix
    ../../modules/user/apps/task-management.nix
    ../../modules/user/apps/terminal.nix
    # ../../modules/user/apps/virt-manager.nix
    # ../../modules/user/apps/wine.nix
    # Window Manager
    # ../../modules/user/wm/hyprland.nix
  ];

  home.file = {
    ".config/waybar/config.jsonc" = {
      text = ''
        {
          "include": [
            "$HOME/.config/waybar/profiles/default-mechabar.jsonc",
            "$HOME/.config/waybar/modules/nixos.jsonc",
            "$HOME/.config/waybar/modules/desktop.jsonc",
          ],
        }
      '';
      force = true;
    };
  };
}
