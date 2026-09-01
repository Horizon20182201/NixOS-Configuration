{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> {
    system = pkgs.stdenv.hostPlatform.system;
  };
in
{
  imports = [
    ./home/vscode.nix
    ./home/zsh.nix
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
    opencode
    typora
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Enzhao Liu";
        email = "ezliu822@gmail.com";
      };
    };
  };

  # programs.bash.enable = true;

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

    settings."wangyi" = {
      HostName = "10.176.56.235";
      User = "wangyi";

      # ProxyCommand = "${pkgs.nmap}/bin/ncat --proxy 127.0.0.1:1080 --proxy-type socks5 %h %p";

      ServerAliveInterval = 20;
      ServerAliveCountMax = 120;
      TCPKeepAlive = false;
    };
  };

}
