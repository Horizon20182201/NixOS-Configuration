{ config, pkgs, lib, ... }:

{
  fonts = {
    packages = with pkgs; [
      # 常规西文字体
      noto-fonts

      # CJK 字体：简中/繁中/日文/韩文都在里面
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif

      # Emoji
      noto-fonts-color-emoji

      # 中文兼容性较好的老牌字体
      wqy_microhei
      wqy_zenhei

      # 编程用字体
      vista-fonts
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.iosevka-term
      nerd-fonts.caskaydia-mono
      maple-mono.NF
      corefonts
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {
        sansSerif = [
          "Noto Sans CJK SC"
          "WenQuanYi Micro Hei"
          "Noto Sans"
        ];

        serif = [
          "Noto Serif CJK SC"
          "Noto Serif"
        ];

        monospace = [
          "Noto Sans Mono CJK SC"
          "Noto Sans Mono"
        ];

        emoji = [
          "Noto Color Emoji"
        ];
      };
    };
  };
}
