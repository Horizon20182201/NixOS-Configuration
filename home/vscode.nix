{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    
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
