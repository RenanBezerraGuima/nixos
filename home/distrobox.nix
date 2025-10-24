# configuration.nix
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    distrobox
    podman
  ];

  # Enable podman (recommended over docker for rootless containers)
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;  # Creates docker alias for podman
    defaultNetwork.settings.dns_enabled = true;
  };
}
