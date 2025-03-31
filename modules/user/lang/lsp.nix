{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    lua-language-server
    nil
    clang-tools
    marksman
    python311Packages.python-lsp-server
    # typescript-language-server
    # java-language-server
    # dockerfile-language-server-nodejs
    # docker-compose-language-service
    # kotlin-language-server
    bash-language-server
    yaml-language-server
    sqls
  ];
}
