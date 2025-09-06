{ config, pkgs, ...}:

{
	# Battery package
	home.packages = with pkgs; [
		acpi	
	];

	programs.i3blocks.bars.default.battery = {
			command = "acpi | cut -d, -f2";
			interval = 30;
			separator = true;
			separator_block_width = 15;
		};
}
