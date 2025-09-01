{ config, pkgs, ... }:

{
  programs.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    extraPackages = with pkgs; [
      i3blocks
      rofi
      picom
      scrot
      xclip
      betterlockscreen
      pulseaudio
      xbacklight
      protonvpn-gui
    ];
    config = {
      modifier = "Mod4";
      font = {
        pango = "Fira Code Nerd Font Mono 10";
      };
      floating.modifier = "$mod";

      keybindings = {
        "$mod+Return" = "exec wezterm";
        "$mod+w" = "exec librewolf";
        "$mod+q" = "kill";
        "$mod+d" = "exec rofi -show run";

        "$mod+j" = "focus left";
        "$mod+k" = "focus down";
        "$mod+l" = "focus up";
        "$mod+semicolon" = "focus right";

        "$mod+Left" = "focus left";
        "$mod+Down" = "focus down";
        "$mod+Up" = "focus up";
        "$mod+Right" = "focus right";

        "$mod+Shift+j" = "move left";
        "$mod+Shift+k" = "move down";
        "$mod+Shift+l" = "move up";
        "$mod+Shift+semicolon" = "move right";

        "$mod+h" = "split h";
        "$mod+v" = "split v";
        "$mod+f" = "fullscreen toggle";

        "$mod+s" = "layout stacking";
        "$mod+t" = "layout tabbed";
        "$mod+e" = "layout toggle split";

        "$mod+Shift+space" = "floating toggle";
        "$mod+space" = "focus mode_toggle";

        "$mod+1" = "workspace number 1";
        "$mod+2" = "workspace number 2";
        "$mod+3" = "workspace number 3";
        "$mod+4" = "workspace number 4";
        "$mod+5" = "workspace number 5";
        "$mod+6" = "workspace number 6";
        "$mod+7" = "workspace number 7";
        "$mod+8" = "workspace number 8";
        "$mod+9" = "workspace number 9";
        "$mod+0" = "workspace number 10";

        "$mod+Shift+1" = "move container to workspace number 1";
        "$mod+Shift+2" = "move container to workspace number 2";
        "$mod+Shift+3" = "move container to workspace number 3";
        "$mod+Shift+4" = "move container to workspace number 4";
        "$mod+Shift+5" = "move container to workspace number 5";
        "$mod+Shift+6" = "move container to workspace number 6";
        "$mod+Shift+7" = "move container to workspace number 7";
        "$mod+Shift+8" = "move container to workspace number 8";
        "$mod+Shift+9" = "move container to workspace number 9";
        "$mod+Shift+0" = "move container to workspace number 10";

        "$mod+Shift+c" = "reload";
        "$mod+Shift+r" = "restart";
        "$mod+Shift+e" = "exec \"i3-nagbar -t warning -m 'Exit i3?' -B 'Yes' 'i3-msg exit'\"";

        "$mod+r" = "mode \"resize\"";

        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10%";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10%";
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";

        "XF86MonBrightnessUp" = "exec xbacklight -inc 20";
        "XF86MonBrightnessDown" = "exec xbacklight -dec 20";

        "Print" = "exec scrot -s -e 'xclip -selection clipboard -t image/png -i $f && rm $f'";
        "Shift+Print" = "exec scrot -e 'xclip -selection clipboard -t image/png -i $f && rm $f'";

        "$mod+Shift+x" = "exec betterlockscreen -l dim";
      };

      modes = {
        resize = {
          "j" = "resize shrink width 10 px or 10 ppt";
          "k" = "resize grow height 10 px or 10 ppt";
          "l" = "resize shrink height 10 px or 10 ppt";
          "semicolon" = "resize grow width 10 px or 10 ppt";

          "Left" = "resize shrink width 10 px or 10 ppt";
          "Down" = "resize grow height 10 px or 10 ppt";
          "Up" = "resize shrink height 10 px or 10 ppt";
          "Right" = "resize grow width 10 px or 10 ppt";

          "Return" = "mode \"default\"";
          "Escape" = "mode \"default\"";
          "$mod+r" = "mode \"default\"";
        };
      };

      bars = [{
        statusCommand = "i3blocks -c ${config.home.homeDirectory}/.config/i3blocks/i3blocks.conf";
        position = "top";
        workspaceMinWidth = 24;
        font = "pango:Fira Code Nerd Font Mono 10";
        i3barCommand = "i3bar --transparency";
        colors = {
          background = "#00000088";
          statusline = "#ffffff";
          separator = "#666666";
          focused_workspace = { border = "#523d6480"; background = "#523d6480"; text = "#ffffff"; };
          active_workspace = { border = "#333333"; background = "#5f676a88"; text = "#ffffff"; };
          inactive_workspace = { border = "#333333"; background = "#22222288"; text = "#888888"; };
          urgent_workspace = { border = "#2f343a"; background = "#900000cc"; text = "#ffffff"; };
          binding_mode = { border = "#2f343a"; background = "#900000cc"; text = "#ffffff"; };
        };
      }];

      startup = [
        { command = "picom -b --backend glx"; noStartupId = true; }
        { command = "betterlockscreen -w dim"; noStartupId = true; }
        { command = "protonvpn-app"; noStartupId = true; }
      ];

      gaps = {
        inner = 7;
        outer = 5;
      };

      defaultBorder = "pixel 2";
    };
  };
}
