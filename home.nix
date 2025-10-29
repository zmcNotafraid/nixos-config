{ config, pkgs, ... }:

{
  home.username = "zmc";
  home.homeDirectory = "/home/zmc";

  home.packages = with pkgs; [
    google-chrome
    discord
    telegram-desktop
    thunderbird
    vscode
    oh-my-zsh
    asdf-vm
    rustup
    autojump
    tig
  ];

  programs.home-manager.enable = true;
  programs.autojump.enable = true;


  programs.git = {
    enable = true;
    userName  = "zmcNotafraid";
    userEmail = "mingchang555@hotmail.com";
  };

 programs.neovim = {
    enable = true;
    defaultEditor = true;

    # ✅ Clipboard 支持（X11/Wayland）
    extraPackages = with pkgs; [
      xclip
      wl-clipboard
    ];

    # ✅ 替代 deprecated 的 configure.customRC
    extraConfig = ''
      set clipboard=unnamedplus   " 启用系统剪贴板
      set number                  " 显示行号
      syntax on
    '';
  };


  programs.zsh = {
    enable = true;  # 启用 Zsh
    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
    };
  };

  home.shell.enableZshIntegration=true;

  # home-manager 状态版本
  home.stateVersion = "25.05";
  
}

