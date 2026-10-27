{ ... }:

{
  programs.ssh = {
    enable = true;

    # 避免启用 Home Manager 的旧版默认 SSH 配置
    enableDefaultConfig = false;

    settings."wangyi" = {
      HostName = "10.176.56.235";
      User = "wangyi";

      # ProxyCommand = "${pkgs.nmap}/bin/ncat --proxy 127.0.0.1:1080 --proxy-type socks5 %h %p";

      ServerAliveInterval = 20;
      ServerAliveCountMax = 120;
      TCPKeepAlive = false;
    };
  };
}
