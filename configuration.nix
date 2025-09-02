# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Storage config
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
  };

  networking.hostName = "renanbg"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.renanbg = {
    isNormalUser = true;
    description = "Renan Bezerra Guimarães";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];

    shell = pkgs.zsh;
  };

  nix.settings.trusted-users = [ "root" "renanbg" ];

  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
	micro
	firefox
	fastfetch

	betterlockscreen
	feh
	scrot
	arandr
	ranger

	xclip

	curl
	wget
	git
	tree
	unzip
	zip
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

	services.xserver = {
		enable = true;
		displayManager.lightdm.enable = true;
		# Auto login
		# displayManager.lightdm.autoLogin = {enable = true; user = "renanbg"; };

		displayManager.session = [
			{
				manage = "desktop";
				name = "xsession";
				start = ''exec $HOME/.xsession'';
			}	
		];
	};

	services = {
		libinput.enable = true;
		displayManager.defaultSession = "xsession";
	};
	
	# services.displayManager = {
	# 	autoLogin = {
	# 		enable = false;
	# 		user = "renanbg";	
	# 	};
	# };

	virtualisation.virtualbox.guest.enable = true;

	fonts.packages = with pkgs; [
		nerd-fonts.fira-code	
	];

	stylix = {
		enable = true;
		polarity = "dark";
		image = ./wallpapers/Wallpaper.jpg;

		base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-dark.yaml";
		#base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-light.yaml";
		fonts = {
			serif = {
				package = pkgs.nerd-fonts.fira-code;
				name = "Fira Code Nerd Font";
			};
			sansSerif = {
				package = pkgs.nerd-fonts.fira-code;
				name = "Fira Code Nerd Font";
			};
			monospace = {
				package = pkgs.nerd-fonts.fira-code;
				name = "Fira Code Nerd Font";
			};

			emoji = {
	            package = pkgs.noto-fonts-emoji;
	            name = "Noto Color Emoji";
	        };
		};
	};


}
