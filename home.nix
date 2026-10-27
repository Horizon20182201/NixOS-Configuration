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
    ./home/ssh.nix
  ];

  home.username = "lez";
  home.homeDirectory = "/home/lez";

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    appimage-run
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

}
