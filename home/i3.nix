{ config, pkgs, ... }:

let
	mod = config.xsession.windowManager.i3.config.modifier;
in

{
  # Enable i3 window manager through Home Manager
  xsession.enable = true;
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;
    
    config = {
      # Modifier key (Mod4 = Super/Windows key)
      modifier = "Mod4";
      
      # Font configuration - will be overridden by Stylix
      fonts = {
        names = [ "Fira Code Nerd Font Mono" ];
        size = 10.0;
      };
      
      # Terminal
      terminal = "wezterm";
      
      # Key bindings
      keybindings = {
        # Application launchers
        "${mod}+Return" = "exec wezterm";
        "${mod}+w" = "exec librewolf";
        "${mod}+d" = "exec rofi -show run";
        
        # Window management
        "${mod}+q" = "kill";
        "${mod}+F11" = "fullscreen toggle";
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+space" = "focus mode_toggle";
        
        # Focus controls
        "${mod}+j" = "focus left";
        "${mod}+k" = "focus down";
        "${mod}+l" = "focus up";
        "${mod}+semicolon" = "focus right";
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";
        
        # Move windows
        "${mod}+Shift+j" = "move left";
        "${mod}+Shift+k" = "move down";
        "${mod}+Shift+l" = "move up";
        "${mod}+Shift+semicolon" = "move right";
        
        # Split containers
        "${mod}+h" = "split h";
        "${mod}+v" = "split v";
        
        # Layout modes
        "${mod}+s" = "layout stacking";
        "${mod}+t" = "layout tabbed";
        "${mod}+e" = "layout toggle split";
        
        # Workspace switching
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        
        # Move containers to workspaces
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";
        
        # i3 management
        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+r" = "restart";
        "${mod}+Shift+e" = "exec i3-nagbar -t warning -m 'Exit i3?' -B 'Yes' 'i3-msg exit'";
        
        # Resize mode
        "${mod}+r" = "mode resize";
        
        # Media keys
        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10%";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10%";
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
        
        # Brightness controls
        "XF86MonBrightnessUp" = "exec xbacklight -inc 20";
        "XF86MonBrightnessDown" = "exec xbacklight -dec 20";
        
        # Screenshots
        "Print" = "exec scrot -s -e 'xclip -selection clipboard -t image/png -i $f && rm $f'";
        "Shift+Print" = "exec scrot -e 'xclip -selection clipboard -t image/png -i $f && rm $f'";
        
        # Lock screen
        "${mod}+Shift+x" = "exec betterlockscreen -l dim";
      };
      
      # Resize mode configuration
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
          "Return" = "mode default";
          "Escape" = "mode default";
          "${mod}+r" = "mode default";
        };
      };
      
      # Floating modifier
      floating = {
        modifier = "Mod4";
      };
      
      # Gaps configuration
      gaps = {
        inner = 7;
        outer = 5;
      };
      
      # Window configuration
      window = {
        border = 2;
        hideEdgeBorders = "none";
      };
      
      # Status bar configuration
      bars = [
        {
          position = "top";
          statusCommand = "i3blocks -c ${config.home.homeDirectory}/.config/i3blocks/i3blocks.conf";
          workspaceButtons = true;
          workspaceNumbers = true;
          
          fonts = {
            names = [ "Fira Code Nerd Font Mono" ];
            size = 10.0;
          };
          
          extraConfig = ''
            i3bar_command i3bar --transparency
            workspace_min_width 24
          '';
          
          colors = {
            background = "#00000088";
            statusline = "#ffffff";
            separator = "#666666";
            
            focusedWorkspace = {
              border = "#523d6480";
              background = "#523d6480";
              text = "#ffffff";
            };
            activeWorkspace = {
              border = "#333333";
              background = "#5f676a88";
              text = "#ffffff";
            };
            inactiveWorkspace = {
              border = "#333333";
              background = "#22222288";
              text = "#888888";
            };
            urgentWorkspace = {
              border = "#2f343a";
              background = "#900000cc";
              text = "#ffffff";
            };
            bindingMode = {
              border = "#2f343a";
              background = "#900000cc";
              text = "#ffffff";
            };
          };
        }
      ];
      
      # Startup applications
      startup = [
        {
          command = "picom -b --backend glx";
          always = false;
          notification = false;
        }
        {
          command = "betterlockscreen -w dim";
          always = false;
          notification = false;
        }
        {
          command = "protonvpn-app";
          always = false;
          notification = false;
        }
        {
        	command = "megasync";
        	always = false;
        	notification = false; 
        }
        {
        	command = "pasystray";
        	always= false;
        	notification = false;
        }
      ];
    };
  };
  
  programs.i3blocks = {
    enable = true;
    bars.default.time = {
      command = "date '+%d/%m/%Y %H:%M'";
      interval = 60;
      separator = true;
      separator_block_width = 15;
    };
  };
  
  # Additional packages needed for i3 functionality
  home.packages = with pkgs; [
    # i3 ecosystem
    i3blocks         # Status bar (already in system config, but good to have)
    rofi             # Application launcher (already in system config)
    picom            # Compositor (already in system config)
   
    # Utilities your i3 config uses
    xorg.xbacklight       # Brightness control
	# Audio tray
    pasystray
    pavucontrol
    pamixer
	
    feh
    scrot
    arandr

    betterlockscreen
    xclip

    protonvpn-gui
    megasync
  ];
}
