# This file is a placeholder.
# You should generate a hardware configuration for your laptop
# and place it here.
# You can do this by running the following command on your laptop:
# nixos-generate-config --show-hardware-config > hardware.nix
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [ ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { # device = "/dev/disk/by-uuid/????????-????-????-????-????????????";
      fsType = "ext4";
    };

  swapDevices =
    [ # { device = "/dev/disk/by-uuid/????????-????-????-????-????????????"; }
    ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
