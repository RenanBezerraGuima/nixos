{ config, pkgs, lib, ...}:

{
	programs.btop = {
			enable = true;
			settings = {
				theme_background = false;
			};
		};
	
		programs.eza = {
			enable = true;
			enableZshIntegration = true;
			git = true;
			icons = "always";
			colors = "auto";
	
			extraOptions = [
				"-1"
				"--hyperlink"
				"--group-directories-first"
			];
		};
	
		programs.zoxide = {
			enable = true;
			enableZshIntegration = true;
		};
	
		programs.yazi = {
			enable = true;
			enableZshIntegration = true;
			shellWrapperName = "y";
		};
	
		programs.helix = {
			enable = true;

			languages = {
				langue-server.ruby-lsp = {
					command = "${pkgs.ruby-lsp}/bin/ruby-lsp";		
				};
			};

			settings = {
				editor = {
					continue-comments = false;	
				};	
			};
		};
}
