{ pkgs, unstable, ... }:

{ 
  programs.claude-code = {
    enable = true;
    package = unstable.claude-code;

    # settings.json 由本地维护，保留环境变量、模型和主题设置。
    # 设置非空 settings 会让 Home Manager 接管整个文件。
  };
}
