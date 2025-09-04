{ config, pkgs, ...}:

{
	# Battery package
	home.packages = with pkgs; [
		acpi	
	];

	programs.i3blocks.blocks = [
		''
		[battery]
		command=acpi | cut -d, -f2
		interval=30
		''
	] ++ config.programs.i3blocks.blocks;
}
