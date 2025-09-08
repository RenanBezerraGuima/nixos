{config, pkgs, ...}:

{
	home.packages = with pkgs; [
		acpi
	];

	home.file.".config/i3blocks/config".text = ''
	    [time]
	    command=date '+%d/%m/%Y %H:%M'
	    interval=60
	    separator=true
	    separator_block_width=15

	    [battery]
	    command=acpi -b | grep -E -o '[0-9][0-9]?[0-9]?%' | head -1
	    interval=30
	    separator=true
	    separator_block_width=15
	  '';
}
