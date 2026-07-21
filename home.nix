{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> {
    system = pkgs.stdenv.hostPlatform.system;
  };
in
{
  imports = [
    ./vscode.nix
  ];

  home.username = "lez";
  home.homeDirectory = "/home/lez";

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    fastfetch
    ripgrep
    fd
    eza
    bat
    neovim
    tree
    unstable.codex
    wpsoffice
  ];

  programs.git = {
    enable = true;
    userName = "刘恩照";
    userEmail = "1969197882@qq.com";
  };

  programs.bash.enable = true;

  xdg.enable = true;

  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    desktop = "${config.home.homeDirectory}/Desktop";
    download = "${config.home.homeDirectory}/Downloads";
    templates = "${config.home.homeDirectory}/Templates";
    publicShare = "${config.home.homeDirectory}/Public";
    documents = "${config.home.homeDirectory}/Documents";
    music = "${config.home.homeDirectory}/Music";
    pictures = "${config.home.homeDirectory}/Pictures";
    videos = "${config.home.homeDirectory}/Videos";
  };

  programs.ssh = {
    enable = true;

    # 避免启用 Home Manager 的旧版默认 SSH 配置
    enableDefaultConfig = false;

    settings."*" = {
      ServerAliveInterval = 20;
      ServerAliveCountMax = 120;
      TCPKeepAlive = false;
    };
  };

}
