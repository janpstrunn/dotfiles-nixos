{pkgs, ...}: {
  home.packages = with pkgs; [
    neovide
  ];

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      alejandra
      bash-language-server
      # clang-tools
      # docker-compose-language-service
      # dockerfile-language-server-nodejs
      harper
      # java-language-server
      # kotlin-language-server
      lua-language-server
      # markdown-oxide
      # marksman
      neovide
      # sqls
      # typescript-language-server
      # yaml-language-server
    ];
  };
}
