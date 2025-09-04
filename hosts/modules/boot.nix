# Boot loader and kernel configuration
{ config, pkgs, ... }:

{
  # Bootloader.
  boot.loader.grub = {
  	enable = true;
  	device = "/dev/sda";
  	useOSProber = true;
  };

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Corrects time when dual booting with Windows
  time.hardwareClockInLocalTime = true;
}
