# Stylix theming and styling configuration
{ config, pkgs, ... }:

{
	stylix = {
	  polarity = "light";
	  image = ../../wallpapers/WallpaperLight.jpg;
	  base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-light.yaml";
	};
}
