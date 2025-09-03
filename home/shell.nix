{ config, pkgs, lib, ...}:

{
	programs.zsh = {
    	enable = true;
			    
	    enableCompletion = true;
	    autosuggestion.enable = true;
	    syntaxHighlighting.enable = true;

		shellAliases = {
			cd = "z";
			ls = "eza";
			lg = "lazygit";	

			deploy-desktop = "nixos-rebuild switch --flake .#desktop";
			deploy-laptop = "nixos-rebuild switch --flake .#laptop";
		};
  	};
}
