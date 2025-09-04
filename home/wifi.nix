{ config, pkgs, ...}:

{
	# Wifi applet
	home.packages = with pkgs; [
		network-manager-applet	
	];

	# Wifi Tray
	xsession.windowManager.i3.config.startup = [
		{
			command = 		"nm-applet";
			always = 		false;
			notification = 	false;
		}	
	];
}
