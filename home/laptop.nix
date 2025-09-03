{ config, pkgs, lib, ...}:

{
  # Laptop-specific packages
  home.packages = with pkgs; [
	# Applet for wifi
    network-manager-applet
    acpi
  ];

  # Laptop-specific i3blocks config
  programs.i3blocks.blocks = [
    ''
      [wifi]
      command=echo "W: $(nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d: -f2)"
      interval=10
    ''
    ''
      [battery]
      command=acpi | cut -d, -f2
      interval=30
    ''
  ] ++ config.programs.i3blocks.blocks;

  xsession.windowManager.i3.config.startup = [
    {
      command = "nm-applet";
      always = false;
      notification = false;
    }
  ];
}
