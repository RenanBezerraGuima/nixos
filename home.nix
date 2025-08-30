{ config, pkgs, lib, ...}:

{
	home.username = "renanbg";
	home.homeDirectory = "/home/renanbg";

	home.packages = with pkgs; [
		protonvpn-gui
		bat
		devbox
		lazygit
		
		xfce.thunar
	];

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
	};

	programs.fastfetch = {
	    enable = true;
	    settings = {
	      logo.source = "nixos";
	
	      modules = [
	        "break"
	        "separator"
	
	        # --- Hardware Section ---
	        {
	          type = "title";
	          key = "Hardware Information ";
	          keyColor = "yellow";
	        }
	        {
	          type = "host";
	          keyIcon = "󰌢";
	          key = "󰌢";
	        }
	        {
	          type = "cpu";
	          keyIcon = "";
	          key = "";
	        }
	        {
	          type = "gpu";
	          keyIcon = "󰍹";
	          key = "󰍹";
	        }
	        {
	         type = "memory";
             keyIcon = "󰍛";
             key = "󰍛";
	        }
	        {
	         type = "disk";
    	     keyIcon = "󰋊";
    	     key = "󰋊";	
	        }
	
	        "separator"
	
	        # --- Software Section ---
	        {
	          type = "title";
	          key = "Software Information ";
	          keyColor = "yellow";
	        }
	        {
	          type = "os";
	          keyIcon = "";
	          key = "";
	        }
	        {
	          type = "kernel";
	          keyIcon = "󰌽";
	          key = "󰌽";
	        }
	        {
	          type = "wm";
	          keyIcon = "󰖲";
	          key = "󰖲";
	        }
	        {
	          type = "shell";
	          keyIcon = "";
	          key = "";
	        }
	        {
	          type = "terminal";
	          keyIcon = "";
	          key = "";
	        }
	        {
	          type = "font";
	          keyIcon = "";
	          key = "";
	        }
	        {
	          type = "packages";
	          keyIcon = "󰏗";
	          key = "󰏗";
	        }
	
	        "separator"
	      ];
	  };
	};

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

	programs.zsh = {
	    enable = true;
	    
	    enableCompletion = true;
	    autosuggestion.enable = true;
	    syntaxHighlighting.enable = true;

		shellAliases = {
			cd = "z";
			ls = "eza";
			lg = "lazygit";	
		};
	  };

	stylix.enable = true;

	programs.alacritty = {
		enable = true;
	};

	programs.wezterm = {
		enable = true;
		enableZshIntegration = true;	
	};

	programs.git = {
		enable = true;
		userName = "Renan Bezerra Guimarães";
		userEmail = "renanbezerraguima@proton.me";
	};

	programs.gh = {
		enable = true;
		gitCredentialHelper.enable = true;	
	};

	programs.librewolf = {
		enable = true;
		settings = {
			"privacy.resistFingerprinting" = true;
			"privacy.clearOnShutdown.history" = false;
			"privacy.clearOnShutdown.downloads" = false;	
		};
	};

	home.stateVersion = "25.05";
}
