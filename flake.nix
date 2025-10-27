{
  description = "My NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs }: let
    systemName = "x86_64-linux";
    myConfig = nixpkgs.lib.nixosSystem {
      system = systemName;
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
      ];
    };
  in {
    nixosConfigurations = {
      nixos = myConfig;
    };

    defaultPackage.x86_64-linux = myConfig.config.system.build.toplevel;
  };
}

