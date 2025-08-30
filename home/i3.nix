{ config, pkgs, lib, osConfig, ... }:

let
  isLaptop = osConfig.networking.hostName == "laptop";
in
{
  programs.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    extraPackages = with pkgs; [
      i3status
      rofi
      picom
    ];
    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "rofi -show drun";

      bars = [
        {
          statusCommand = "i3status";
          position = "top";
        }
      ];

      startup = [
        { command = "nm-applet --indicator"; always = true; }
      ];

      gaps = {
        inner = 10;
        outer = 10;
      };
    };
  };

  programs.i3status = {
    enable = true;
    general = {
      colors = true;
      interval = 5;
    };
    order = [
      "wireless _first_"
      "ethernet _first_"
      "cpu_usage"
      "load"
      "memory"
      "tztime local"
    ] ++ (lib.mkIf isLaptop [ "battery all" ]);

    wireless._first_ = {
      format_up = "W: (%quality at %essid) %ip";
      format_down = "W: down";
    };

    ethernet._first_ = {
      format_up = "E: %ip (%speed)";
      format_down = "E: down";
    };

    cpu_usage = {
      format = "CPU: %usage";
    };

    load = {
      format = "L: %1min";
    };

    memory = {
      format = "%used / %total";
    };

    tztime.local = {
      format = "%Y-%m-%d %H:%M:%S";
    };

    battery.all = {
      format = "%status %percentage %remaining";
      format_down = "No battery";
      last_full_capacity = true;
      integer_battery_capacity = true;
      low_threshold = 20;
      threshold_type = "percentage";
      hide_seconds = true;
    };
  };
}
