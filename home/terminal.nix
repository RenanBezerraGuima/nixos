{ config, pkgs, lib, ...}:

{
	programs.wezterm = {
		enable = true;
		enableZshIntegration = true;

		extraConfig = ''
			local wezterm = require "wezterm"

			return {
				window_close_confirmation = "NeverPrompt",		
			}
		'';	
	};
}
