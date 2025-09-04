# Auto Login X11
{ config, pkgs, ... }:

{
	services.displayManager.autoLogin = {enable = true; user = "renanbg"; };
}
