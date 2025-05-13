{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    bash-language-server
    clang-tools
    # docker-compose-language-service
    # dockerfile-language-server-nodejs
    harper
    # java-language-server
    # kotlin-language-server
    lua-language-server
    markdown-oxide
    marksman
    neovide
    neovim
    python311Packages.python-lsp-server
    sqls
    # typescript-language-server
    yaml-language-server
  ];
}
