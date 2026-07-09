{ config, pkgs, lib, ... }:

let
  wechatPkg = pkgs.wechat;

  wechatFcitx5 = pkgs.writeShellScriptBin "wechat-fcitx5" ''
    export XMODIFIERS=@im=fcitx
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export SDL_IM_MODULE=fcitx

    exec ${wechatPkg}/bin/wechat "$@"
  '';

  wechatFcitx5Desktop = pkgs.makeDesktopItem {
    name = "wechat-fcitx5";
    desktopName = "WeChat Fcitx5";
    exec = "${wechatFcitx5}/bin/wechat-fcitx5 %U";
    icon = "wechat";
    categories = [ "Network" "InstantMessaging" ];
  };
in
{
  environment.systemPackages = [
    wechatPkg
    wechatFcitx5
    wechatFcitx5Desktop
  ];
}
