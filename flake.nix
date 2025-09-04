{
  description = "The flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
    	url = "github:nix-community/stylix/release-25.05";
    	inputs.nixpkgs.follows = "nixpkgs";	
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, stylix, ... }:
    let
      inherit (nixpkgs) lib;
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
    in
    {
      nixosConfigurations = {
        desktop = lib.nixosSystem {
          inherit system specialArgs;
          modules = [ ./hosts/desktop ];
        };

        laptop = lib.nixosSystem {
          inherit system specialArgs;
          modules = [ ./hosts/laptop ];
        };
      };
    };
}
