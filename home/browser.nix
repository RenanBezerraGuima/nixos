{ config, pkgs, lib, ...}:

{
	programs.librewolf = {
		enable = true;
		settings = {
			"privacy.resistFingerprinting" = true;
			"privacy.clearOnShutdown.history" = false;
			"privacy.clearOnShutdown.downloads" = false;	
		};
	};

	stylix.targets.librewolf.profileNames = [ "default" ];
}
