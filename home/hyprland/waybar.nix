{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        spacing = 8;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "group/quicksettings" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{name}";
        };

        clock = {
          format = "{:%d/%m/%y %A}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
        };

        "group/quicksettings" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 300;
            children-class = "system-info";
            transition-left-to-right = false;
          };
          modules = [
            "custom/nixos-icon"
            "network"
            "bluetooth"
            "pulseaudio"
            "battery"
          ];
        };

        "custom/nixos-icon" = {
          format = "   ";
          tooltip = false;
        };

        network = {
          format-wifi = " {essid}";
          format-ethernet = " Wired";
          format-disconnected = "⚠ Offline";
          tooltip-format = "Signal: {signalStrength}%";
        };

        bluetooth = {
          format = " {status}";
          format-connected = " {device_alias}";
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {time}";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-icons = ["" "" "" "" ""];
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = " Muted";
          format-icons = {
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
        };
      };
    };

    style = ''
      * {
        font-family: "Maple Mono NF CN";
        font-size: 14px;
        font-weight: bold;
        border: none;
        border-radius: 0;
        min-height: 0;
        margin: 0;
        padding: 0;
      }

      window#waybar {
        background-color: rgba(0, 0, 0, 0.85);
        color: #ffffff;
      }

      #workspaces button {
        color: #a6a6a6;
        padding: 0 12px;
        background: transparent;
      }
      #workspaces button.active {
        color: #ffffff;
      }
      #workspaces button:hover {
        background: rgba(255, 255, 255, 0.1);
        box-shadow: none;
      }

      #clock {
        color: #ffffff;
      }

      #network, #bluetooth, #pulseaudio, #battery {
        padding: 0 10px;
        color: #e0e0e0;
      }

      #battery.warning { color: #ffcc00; }
      #battery.critical { color: #ff6666; }

      #custom-nixos-icon {
        color: #7eBAE4;
        font-size: 18px;
        padding: 0 15px;
      }
    '';
  };
}