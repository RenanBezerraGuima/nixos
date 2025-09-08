{config, pkgs, ...}:

{
	home.file.".config/i3blocks/config".text = ''
	    [time]
	    command=date '+%d/%m/%Y %H:%M'
	    interval=60
	    separator=true
	    separator_block_width=15
	  '';
}
