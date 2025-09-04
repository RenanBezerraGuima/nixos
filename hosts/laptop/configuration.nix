{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../modules/boot.nix
      ../modules/storage.nix
      ../modules/networking.nix
      ../modules/localization.nix
      ../modules/styling.nix
      ../modules/lightMode.nix
      ../modules/audio.nix
      ../modules/X11.nix
      ../modules/tlp.nix
      ../modules/autoLogin.nix
    ];

  networking.hostName = "laptop";
  networking.wireless.enable = true;

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.renanbg = {
    isNormalUser = true;
    description = "Renan Bezerra Guimarães";
    extraGroups = [ "networkmanager" "wheel" "audio"];
    packages = with pkgs; [];

    shell = pkgs.zsh;
  };
  programs.zsh = {
  	enable = true;
  	interactiveShellInit = "nrs() { sudo nixos-rebuild switch --flake .#laptop; }";
  };

  nix.settings.trusted-users = [ "root" "renanbg" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
