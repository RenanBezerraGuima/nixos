{ config, pkgs, ... }:

{
	boot = {
		loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
		};
		initrd.luks.devices."luks-9f59772f-eeff-4312-91bd-f892fd5a0971".device = "/dev/disk/by-uuid/9f59772f-eeff-4312-91bd-f892fd5a0971";
	};	
}
