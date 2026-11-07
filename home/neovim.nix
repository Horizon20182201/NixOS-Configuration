{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    # 通过 wrapper 加载 Nix 生成的配置，保留本地 LazyVim 的 init.lua。
    sideloadInitLua = true;

    # 运行时依赖
    withNodeJs = true;
    withPython3 = true;
    withRuby = false;

    # LazyVim 自动管理插件，这里只保留基础依赖
    plugins = with pkgs.vimPlugins; [
      # LazyVim 核心
      lazy-nvim

      # LazyVim 依赖的基础插件
      plenary-nvim
      nvim-web-devicons
    ];
  };

  # LSP 服务器、Formatter 和工具
  home.packages = with pkgs; [
    # LSP 服务器
    clang-tools          # C/C++
    pyright              # Python
    rust-analyzer        # Rust
    gopls                # Go
    typescript-language-server  # JavaScript/TypeScript
    lua-language-server  # Lua
    nil                  # Nix

    # Formatter
    black                # Python
    isort                # Python
    stylua               # Lua
    alejandra            # Nix
    prettier             # JavaScript/TypeScript
    rustfmt              # Rust

    # Linter
    pylint               # Python
    shellcheck           # Shell

    # 工具
    ripgrep              # 模糊查找
    fd                   # 文件查找
    git                  # 版本控制
  ];
}
