# Storage optimization and garbage collection
{ config, pkgs, ... }:

{
	nix = {
		optimise.automatic = true;
		settings.auto-optimise-store = true;
		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 1w";	
		};	
	};
}
