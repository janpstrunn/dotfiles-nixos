{...}: {
  imports = [
    # Home Manager
    ../../modules/home.nix
    # Programming Languages
    ../../modules/user/lang/android.nix
    # ../../modules/user/lang/cpp.nix
    ../../modules/user/lang/go.nix
    ../../modules/user/lang/nodejs.nix
    ../../modules/user/lang/python.nix
    ../../modules/user/lang/ruby.nix
    ../../modules/user/lang/rust.nix
    # Applications
    ../../modules/user/apps/browser.nix
    ../../modules/user/apps/cli.nix
    ../../modules/user/apps/drive.nix
    ../../modules/user/apps/editor.nix
    # ../../modules/user/apps/emacs.nix
    ../../modules/user/apps/email.nix
    ../../modules/user/apps/media.nix
    ../../modules/user/apps/nvim.nix
    ../../modules/user/apps/office.nix
    ../../modules/user/apps/password-manager.nix
    ../../modules/user/apps/task-management.nix
    ../../modules/user/apps/terminal.nix
  ];
}
