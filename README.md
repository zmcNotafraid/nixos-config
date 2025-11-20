# NixOS Configuration

## Setup
1. copy .ssh to home folder
2. run `nix-shell -p git` 
3. clone this project
4. copy /etc/nixos/hardware-configuration.nix to this project and git add
5. sudo nixos-rebuild switch --flake .#zmc
6. nix-shell and mise install
