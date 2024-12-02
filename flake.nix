{
  description = "Nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    #inputs.sops-nix.url = "github:Mic92/sops-nix";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # TODO: Add any other flake you might need
    # hardware.url = "github:nixos/nixos-hardware";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      systems,
      nixos-wsl,
      nix-on-droid,
      ...
    }@inputs:
    {
      formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        x220 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          }; # Pass flake inputs to our config
          # > Our main nixos configuration file <
          modules = [ ./system/x220 ];
        };
        nix-wsl = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          }; # Pass flake inputs to our config
          system = "x86_64-linux";

          modules = [
            nixos-wsl.nixosModules.default
            {
              wsl.enable = true;
              wsl.defaultUser = "jaminfisher";
            }
            ./system/wsl.nix
          ];

        };
      };
      nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
      modules = [
        ./system/nix-on-droid.nix

        # list of extra modules for Nix-on-Droid system
        # { nix.registry.nixpkgs.flake = nixpkgs; }
        # ./path/to/module.nix

        # or import source out-of-tree modules like:
        # flake.nixOnDroidModules.module
      ];

      # list of extra special args for Nix-on-Droid modules
      extraSpecialArgs = {
        # rootPath = ./.;
      };

      # set nixpkgs instance, it is recommended to apply `nix-on-droid.overlays.default`
      pkgs = import nixpkgs {
        system = "aarch64-linux";

        overlays = [
          nix-on-droid.overlays.default
          # add other overlays
        ];
      };

      # set path to home-manager flake
      home-manager-path = home-manager.outPath;
    };
    };
}
