{
  description = "Daniel's NixOS base";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      username = "daniel"; # Change this if your installer user has another name.
      hostname = "workstation";
    in {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs username hostname; };
        modules = [
          ./hosts/workstation/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs username hostname; };
            home-manager.users.${username} = import ./home/home.nix;
          }
        ];
      };
    };
}
