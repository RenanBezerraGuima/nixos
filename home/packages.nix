{ config, pkgs, lib, ...}:

{
	home.packages = with pkgs; [
		xfce.thunar

		bat
		devbox
		direnv
		
		gitui
		micro

		unzip
		zip

		kdePackages.okular
		wget
		curl

		obsidian
		qalculate-qt
	];
}
