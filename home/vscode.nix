{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    # 临时修复 NixOS 26.05 的旧打包路径，适用于当前 x86_64-linux 主机。
    # VS Code 1.144.0 使用 ripgrep-universal；上游修复后可移除此覆盖。
    package = pkgs.vscode.overrideAttrs (oldAttrs: {
      postPatch = builtins.replaceStrings
        [ "@vscode/ripgrep/bin/rg" ]
        [ "@vscode/ripgrep-universal/bin/linux-x64/rg" ]
        oldAttrs.postPatch;
    });
    
    profiles.default = {

      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        
        # 简体中文语言包
        ms-ceintl.vscode-language-pack-zh-hans

        # Python
        ms-python.python
        ms-python.vscode-pylance
        ms-python.debugpy

        # Jupyter Notebook 支持
        ms-toolsai.jupyter

        # C/C++
        ms-vscode.cpptools

        # Rust
        rust-lang.rust-analyzer

        # Atom One Dark Pro 主题
        zhuangtongfa.material-theme
      ];

      userSettings = {
        # 编辑器字体
        "editor.fontFamily" =
          "'Consolas', 'JetBrains Mono', 'Noto Sans Mono CJK SC', monospace";
	"workbench.colorTheme" = "One Dark Pro";
	"git.autofetch" = true;
	"terminal.integrated.fontFamily" = "Maple Mono NF";
      };
    };
  };
}
