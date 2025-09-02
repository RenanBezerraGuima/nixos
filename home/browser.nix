{ config, pkgs, lib, ...}:

{
	programs.librewolf = {
		enable = true;
				
	};

	stylix.targets.librewolf.profileNames = [ "default" ];
}
