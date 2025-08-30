{ config, pkgs, ... }:

{
  imports =
    [
      ../common/default.nix
      ./hardware.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "desktop";

  networking.networkmanager.enable = true;

  virtualisation.virtualbox.guest.enable = true;
}
