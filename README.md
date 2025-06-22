<h1 align="center">🍚 NixOS Dotfiles</h1>

<div align="center">
<img src=https://img.shields.io/github/repo-size/janpstrunn/dotfiles-nixos?color=7c5cff&label=SIZE&logo=googlecloudstorage&style=for-the-badge&logoColor=D9E0EE&labelColor=292324>
<img src=https://img.shields.io/badge/Keep%20It%20Simple-Stupid-7c5cff?logo=nixos&style=for-the-badge&logoColor=D9E0EE&labelColor=292324>
<img src=https://img.shields.io/github/license/janpstrunn/dotfiles-nixos?color=7c5cff&label=LICENSE&logo=github&style=for-the-badge&logoColor=D9E0EE&labelColor=292324>
</div>

> [!NOTE]
> This repository only contains Nix configurations. The software configurations can be found at [janpstrunn/dotfiles](https://github.com/janpstrunn/dotfiles)

<details>
  <summary>Philosophies</summary>

- <strong>Keep things simple</strong>
- Keep it easy to maintain
- Lightweight system without sacrificing on visuals
  </details>

<details>
  <summary>Goals</summary>

- Make the system highly customized
- Keep the visuals consistent with an original theme (Elegant Vagrant)
- Execute any task blazingly fast without any frictions to my workflow
- Integrate CLI tools to produce results better than any GUI Tool
  </details>

<details>
  <summary>Notes</summary>

I do not use Home Manager to manage all my dotfiles, instead I have a separate repository only for the software configurations. I do manage them using `stow` which is much simpler than Home Manager and give me more flexibility.

This approach allows me to have agnostic configs, which can be used in any system, even if it does not run NixOS or Home Manager.

  </details>

<details>
  <summary>Trying it out</summary>

This repository include an installation script which helps you install this NixOS configuration. The script will handle everything (disk format, installation, apply dotfiles config and setup user password).

To use the script you must be aware of two things:

- This repository uses `disko` to manage partitions. I do recommend you to use your own `disko` configuration, or check the available ones in this repository at `./profiles/disks/` before proceeding!
- Home Manager is configured separately from NixOS. This means you must run `home-manager switch --flake .` to apply the Home Manager configuration after installation.

You can try this configuration in two ways:

```bash
git clone https://codeberg.org/janpstrunn/nix $HOME/nix
sh $HOME/nix/install.sh
```

Or if you prefer a single command (WIP):

```bash
curl -sSL https://codeberg.org/janpstrunn/nix/raw/branch/main/install.sh clone | bash
```

<strong>Tip:</strong> If you want to try the config just like I use it, use the `-d` flag to use the default config.

  </details>

## Footages

<div align="center">
  <img src="https://git.disroot.org/janpstrunn/images/raw/branch/main/dotfiles/2025-04-21-nixos.webp">
  <p>Footage from NixOS. Featuring: Fastfetch, Neovim, Ranger, Cmatrix, Fuzzel, Hyprland and Waybar</p>
</div>

The theme can be found in the official theme repository: [janpstrunn/elegantvagrant](https://github.com/janpstrunn/elegantvagrant)

## Tools

| Tools         | Function             |
| ------------- | -------------------- |
| Cmus          | Music Player         |
| Dunst         | Notifications        |
| Emacs         | Multi-purpose        |
| Alacritty     | Terminal Emulator    |
| MPV           | Media Player         |
| Neovim        | Text Editor          |
| Neomutt       | Mail Client          |
| Ranger + Yazi | File Management      |
| Rofi          | Multi-purpose        |
| Swayimg       | Image Viewer         |
| Taskwarrior   | Task Management      |
| Tmux          | Terminal Multiplexer |
| Zsh           | Shell                |

And many more...

## License

This repository is licensed under the MIT License, allowing for extensive use, modification, copying, and distribution.
