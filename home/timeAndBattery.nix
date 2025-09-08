{ config, pkgs, ...}:

{
	programs.i3blocks = {
    	enable = true;
    	bars = {
      		main = {
        		blocks = [
          		{
            		name = "time";
            		command = "date '+%d/%m/%Y %H:%M'";
            		interval = 60;
            		separator = true;
            		separator_block_width = 15;
          		}
          		{
            		name = "battery";
            		command = "acpi -b | grep -E -o '[0-9][0-9]?[0-9]?%' | head -1";
            		interval = 30;
            		separator = true;
            		separator_block_width = 15;
          		}		
        		];
      		};
    	};
  	};
}
