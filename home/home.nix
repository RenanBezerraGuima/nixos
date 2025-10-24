{ config, pkgs, lib, ...}:

{
	home.username = "renanbg";
	home.homeDirectory = "/home/renanbg";

	imports = [
		./i3.nix
		
		./fastfetch.nix
		./packages.nix
		./starship.nix
		./tui.nix
		./shell.nix
		./git.nix
		./browser.nix
		./terminal.nix
	];

	stylix.enable = true;
	
	home.stateVersion = "25.05";
}
