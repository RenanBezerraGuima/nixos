# Desktop environment and X11 configuration
{ config, pkgs, ... }:

{
	imports = [
		# Auto Login
		./autoLogin.nix	
	];
	
	services.xserver = {
	  enable = true;
	  displayManager.lightdm.enable = true;

	  displayManager.session = [
	    {
	      manage = "desktop";
	      name = "xsession";
	      start = ''exec $HOME/.xsession'';
	    }	
	  ];
	};

	services = {
	  libinput.enable = true;
	  displayManager.defaultSession = "xsession";
	};
}
