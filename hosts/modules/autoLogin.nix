# Auto Login X11
{ config, pkgs, ... }:

{
	services.xserver.displayManager.lightdm.autoLogin = {enable = true; user = "renanbg"; };
}
