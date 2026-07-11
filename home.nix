{ config, pkgs, ... }:

{
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

}
