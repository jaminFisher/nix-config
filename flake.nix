{
  description = "Nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    #inputs.sops-nix.url = "github:Mic92/sops-nix";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    home-manager = {
      url = "github:nix-community/home-manager";
      #inputs.nixpkgs.follows = "nixpkgs";
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
    };
}
