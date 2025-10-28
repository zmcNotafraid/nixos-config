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
    zsh
    ruby
    elixir
    rustup          
    cargo           
  ];

  programs.zsh.enable = true;
  programs.zsh.ohMyZsh.enable = true;

  programs.rustup.defaultToolchain = "stable";

  programs.elixir.enableIExHistory = true;
}

