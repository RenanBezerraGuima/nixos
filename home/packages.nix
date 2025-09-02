{ config, pkgs, lib, ...}:

{
	home.packages = with pkgs; [
			protonvpn-gui
			bat
			devbox
			gitui
			
			xfce.thunar
		];
}
