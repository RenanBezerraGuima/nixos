# Stylix theming and styling configuration
{ config, pkgs, ... }:

{
	fonts.packages = with pkgs; [
			nerd-fonts.fira-code	
	];
	
	stylix = {
	  enable = true;

	  fonts = {
	    serif = {
	      package = pkgs.nerd-fonts.fira-code;
	      name = "Fira Code Nerd Font";
	    };
	    sansSerif = {
	      package = pkgs.nerd-fonts.fira-code;
	      name = "Fira Code Nerd Font";
	    };
	    monospace = {
	      package = pkgs.nerd-fonts.fira-code;
	      name = "Fira Code Nerd Font";
	    };

	    emoji = {
	      package = pkgs.noto-fonts-emoji;
	      name = "Noto Color Emoji";
	    };
	  };
	};
}
