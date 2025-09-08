{ config, pkgs, lib, ...}:

{
	# Battery package
	home.packages = with pkgs; [
		acpi	
	];

	programs.i3blocks.bars.default.battery = {
			command = "acpi -b | grep -E -o '[0-9][0-9]?[0-9]?%' | head -1";
			interval = 30;
			separator = true;
			separator_block_width = 15;
		};
}
