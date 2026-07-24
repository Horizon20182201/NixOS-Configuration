{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    # 命令补全
    enableCompletion = true;

    # 直接输入目录名即可进入该目录
    autocd = true;

    # 根据历史命令自动显示建议
    autosuggestion.enable = true;

    # 命令语法高亮
    syntaxHighlighting.enable = true;

    history = {
      # 当前会话最多保留的历史记录数量
      size = 50000;

      # 写入历史文件的数量
      save = 50000;

      # 多个终端共享历史记录
      share = true;

      # 忽略连续重复命令
      ignoreDups = true;

      # 从历史文件中移除重复项
      saveNoDups = true;

      # 保存命令执行时间
      extended = true;
    };

    shellAliases = {
      # 文件操作
      ll = "eza -lah --group-directories-first";
      la = "eza -a";
      lt = "eza --tree";
      cat = "bat";

      # Git
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git log --oneline --graph --decorate";

      # NixOS
      rebuild = "sudo nixos-rebuild switch";
      rebuild-test = "sudo nixos-rebuild test";
      nix-gc = "sudo nix-collect-garbage -d";

      # 常用目录跳转
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      # 安全性
      cp = "cp -i";
      mv = "mv -i";
      rm = "rm -i";
    };

    initContent = ''
      # 使用 Emacs 风格快捷键
      bindkey -e

      # Ctrl + 左右方向键按单词移动
      bindkey '^[[1;5C' forward-word
      bindkey '^[[1;5D' backward-word

      # Delete 键
      bindkey '^[[3~' delete-char

      # Home 和 End 键
      bindkey '^[[H' beginning-of-line
      bindkey '^[[F' end-of-line
    '';

    historySubstringSearch = {
      # 输入部分命令后，用上下方向键搜索历史
      enable = true;

      # 同时兼容常见终端的方向键编码
      searchUpKey = [
        "^[[A"
        "$terminfo[kcuu1]"
      ];

      searchDownKey = [
        "^[[B"
        "$terminfo[kcud1]"
      ];
    };
  };

  # 更现代的 ls
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "auto";
    git = true;
  };

  # 更现代的 cat，提供语法高亮
  programs.bat.enable = true;

  # 智能目录跳转
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # 命令提示符
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      add_newline = true;
      
      # command_timeout = 1000;

      right_format = "$time";

      directory = {
        truncation_length = 5;
        truncate_to_repo = false;
      };

      git_branch = {
        symbol = "git:";
      };

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };

      cmd_duration = {
        min_time = 2000;
        format = "[󱎫 $duration]($style) ";
        style = "bold yellow";
      };

      time = {
        disabled = false;
        time_format = "%H:%M";
        format = "[$time]($style)";
        style = "dimmed white";
      };

      package.disabled = true;
    };
  };
}
