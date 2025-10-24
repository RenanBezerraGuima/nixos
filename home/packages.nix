{ config, pkgs, lib, ...}:

{
	home.packages = with pkgs; [
		xfce.thunar

		devbox
		
		gitui
		micro

		unzip
		zip

		kdePackages.okular
		wget
		curl

		obsidian
		qalculate-qt

		libreoffice

		vscode
	];
}
