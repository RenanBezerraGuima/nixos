{ config, pkgs, ...}:

{
	services.network-manager-applet.enable = true;

	# Wifi Tray
	xsession.windowManager.i3.config.startup = [
		{
			command = "nm-applet";
			always = false;
			notification = false;
		}	
	];
}
