{ config, pkgs, lib, ...}:

{
	home.packages = with pkgs; [
		xfce.thunar

		bat
		devbox
		gitui
		micro

		unzip
		zip

		okular
		wget
		curl
		firefox
	];
}
