{ config, pkgsm, lib, ...}:

{
	programs.starship = {
			enable = true;
			enableZshIntegration = true;
	
			settings = {
				add_newline = false;
				format = "$directory$git_branch$git_status$fill$line_break$character";
	
				directory = {
					truncation_symbol = ".../";
					truncate_to_repo = true;
					read_only = " 󰌾";
				};
	
				c.symbol = " ";
				golang.symbol = " ";
				hostname.ssh_symbol = " ";
				java.symbol = " ";
				nix_shell.symbol = " ";
				package.symbol = "󰏗 ";
				php.symbol = " ";
				rlang.symbol = "󰟔 ";
				ruby.symbol = " ";
				rust.symbol = "󱘗 ";
				python.symbol = " ";
				git_branch.symbol = " ";
			};
		};
}
