# Stylix theming and styling configuration
{ config, pkgs, ... }:

{
	stylix = {
	  polarity = "dark";
	  image = ../../wallpapers/WallpaperDark.jpg;
	  base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-dark.yaml";
	};
}
