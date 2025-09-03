{ config, pkgs, lib, ...}:

{
	home.packages = with pkgs; [
		librewolf	
	];

	stylix.targets.librewolf.profileNames = [ "default" ];
}
