{ config, pkgs, lib, ...}:

{
 	virtualisation.virtualbox.guest.enable = true;

	virtualisation.podman = {
	    enable = true;
	    dockerCompat = true;  # Creates docker alias
	    defaultNetwork.settings.dns_enabled = true;
	  };

 	environment.systemPackages = with pkgs; [
 	    distrobox
 	  ];
}
