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

  outputs = inputs@{ nixpkgs, home-manager, stylix, ... }: {
      nixosConfigurations = {
      	renanbg = nixpkgs.lib.nixosSystem {
      		 system = "x86_64-linux";
		      modules = [
		        ./hosts/desktop/configuration.nix

				stylix.nixosModules.stylix
				
		        home-manager.nixosModules.home-manager
		        {
		        	home-manager.useGlobalPkgs = true;
       	            home-manager.useUserPackages = true;
       	            home-manager.users.renanbg = {
       	            	imports = [ 
       	            		./home/home.nix
      	            	];
       	            };

       	            home-manager.backupFileExtension = "hm-backup";
		        }
		      ];
      	};
      };
    };
}
