{ config, pkgs, lib, ...}:

{
	home.packages = with pkgs; [
		acpi
	];

	programs.i3blocks = {
	    enable = true;
	    bars = {
	      config = {
	          time = {
	            command = "date '+%d/%m/%Y %H:%M'";
	            interval = 60;
	            separator = true;
	            separator_block_width = 15;
	          };
	          battery = {
	            command = "acpi -b | grep -oP '(?<=Battery 0: ).*'";
	            interval = 30;
	            separator = true;
	            separator_block_width = 15;
	          };
	      };
	 	};
	  };
}
