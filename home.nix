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
    mise
    rustup
    autojump
    tig
  ];

  programs.home-manager.enable = true;
  programs.autojump.enable = true;
  programs.gpg = {
    enable = true;
    publicKeys = [
      {
	source = ./gpg/github.asc;
	trust = 5;
      }
    ];
  }

  programs.git = {
    enable = true;
    userName  = "zmcNotafraid";
    userEmail = "mingchang555@hotmail.com";
  };

  programs.mise = {
    enable = true;
    globalConfig = {
      settings = {
        experimental = true;
        node = {
	  compile = false;
	};
      };
      tools = {
        node = "lts";
	erlang = ["28.1.1"];
	elixir = ["1.19.0"];
      };
    };
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

  # home-manager 状态版本
  home.stateVersion = "25.05";
  
}

