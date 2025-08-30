{ config, pkgs, ... }:

{
  imports =
    [
      ../common/default.nix
      ./hardware.nix
    ];

  networking.hostName = "laptop";

  # Enable TLP for power management
  services.tlp.enable = true;

  # Enable wireless networking
  networking.wireless.enable = true;

  environment.systemPackages = with pkgs; [
    network-manager-applet
  ];

  # LUKS disk encryption
  # This is a placeholder for your encrypted root partition.
  # 1. Find the UUID of your encrypted partition with `lsblk -f`.
  # 2. Uncomment the following lines.
  # 3. Replace <your-luks-device-uuid> with the UUID of your encrypted partition.
  # 4. Change "crypted" to a name you prefer.
  # 5. Make sure your `fileSystems."/"` in `hardware.nix` points to `/dev/mapper/crypted`.
  #
  # boot.initrd.luks.devices."crypted" = {
  #   device = "/dev/disk/by-uuid/<your-luks-device-uuid>";
  #   preLVM = true;
  #   allowDiscards = true;
  # };
}
