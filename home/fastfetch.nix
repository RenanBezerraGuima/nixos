{ config, pkgs, lib, ...}:

{
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
}
