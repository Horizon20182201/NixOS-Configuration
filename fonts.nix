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
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.iosevka-term
      nerd-fonts.caskaydia-mono
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

      # 强制 CJK 字体优先使用简体中文 SC，避免微信/浏览器显示成日文字形
      localConf = ''
        <?xml version="1.0"?>
        <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
        <fontconfig>
          <alias>
            <family>sans-serif</family>
            <prefer>
              <family>Noto Sans CJK SC</family>
              <family>WenQuanYi Micro Hei</family>
              <family>Noto Sans</family>
            </prefer>
          </alias>

          <alias>
            <family>serif</family>
            <prefer>
              <family>Noto Serif CJK SC</family>
              <family>Noto Serif</family>
            </prefer>
          </alias>

          <alias>
            <family>monospace</family>
            <prefer>
              <family>Noto Sans Mono CJK SC</family>
              <family>Noto Sans Mono</family>
            </prefer>
          </alias>

          <!-- 对中文语言环境显式 prepend 简体中文字体 -->
          <match target="pattern">
            <test name="lang" compare="contains">
              <string>zh-cn</string>
            </test>
            <edit name="family" mode="prepend">
              <string>Noto Sans CJK SC</string>
            </edit>
          </match>

          <match target="pattern">
            <test name="lang" compare="contains">
              <string>zh</string>
            </test>
            <edit name="family" mode="prepend">
              <string>Noto Sans CJK SC</string>
            </edit>
          </match>
        </fontconfig>
      '';
    };
  };
}
