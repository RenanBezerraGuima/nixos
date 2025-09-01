{ config, pkgs, ... }:

{
  home.file.".config/i3blocks/i3blocks.conf" = {
    text = ''
      # Global properties
      separator=true
      separator_block_width=15

      [time]
      command=date '+%d/%m/%Y %H:%M'
      interval=60
    '';
  };
}
