{ config, pkgs, ... }:{

  {

  programs.waybar = {
    enable = true;
    
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        spacing = 8;
        
        # 模块排布
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "group/quicksettings" ]; # 右侧呼出抽屉组

        # --- 左侧：工作区 ---
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{name}";
        };

        # --- 中间：日期时钟 ---
        clock = {
          format = "{:%d/%m/%y %A}"; # (例: 30/08/26 Sunday)
          tooltip-format = "<tt><small>{calendar}</small></tt>";
        };

        # --- 右侧：GNOME 风格折叠抽屉 ---
        "group/quicksettings" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 300; # 抽屉展开动画 0.3秒
            children-class = "system-info";
            transition-left-to-right = false; # 从右向左展开
          };
          # 展开后显示的模块顺序：网络 -> 蓝牙 -> 音量 -> 电池 -> 雪花图标
          modules = [
            "custom/nixos-icon"
            "network"
            "bluetooth"
            "pulseaudio"
            "battery"
          ];
        };

        # 雪花主按钮
        "custom/nixos-icon" = {
          format = "   ";
          tooltip = false;
        };

        # Wi-Fi 模块
        network = {
          format-wifi = " {essid}";
          format-ethernet = "󰈀 Wired";
          format-disconnected = "⚠ Offline";
          tooltip-format = "Signal: {signalStrength}%";
        };

        # 蓝牙模块
        bluetooth = {
          format = " {status}";
          format-connected = " {device_alias}";
        };

        # 电池模块 (带剩余时间)
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {time}"; # 显示图标和剩余时间
          format-charging = "󰂄 {capacity}%";
          format-plugged = " {capacity}%";
          format-icons = ["" "" "" "" ""];
        };

        # 音响模块
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = " Muted";
          format-icons = {
            default = ["" "" ""];
          };
          on-click = "pavucontrol"; # 可选：点击音量打开高级混音器
        };
      };
    };

    style = ''
      * {
        font-family = "Maple Mono NF CN";
        font-size = 14px;
        font-weight = bold;
        border: none;
        border-radius = 0;
        min-height = 0;
        margin: 0;
        padding: 0;
      }

      window#waybar {
        background-color = rgba(0, 0, 0, 0.85); /* GNOME 经典半透明纯黑顶栏 */
        color = #ffffff;
      }

      /* 工作区按钮样式 */
      #workspaces button {
        color = #a6a6a6;
        padding: 0 12px;
        background: transparent;
      }
      #workspaces button.active {
        color = #ffffff;
      }
      #workspaces button:hover {
        background: rgba(255, 255, 255, 0.1);
        box-shadow: none;
      }

      /* 中间时钟 */
      #clock {
        color = #ffffff;
      }

      /* 右侧信息模块边距 */
      #network, #bluetooth, #pulseaudio, #battery {
        padding: 0 10px;
        color = #e0e0e0;
      }

      /* 电池电量低时变红警告 */
      #battery.warning { color = #ffcc00; }
      #battery.critical { color = #ff6666; }

      /* 最右侧的 NixOS 雪花图标 */
      #custom-nixos-icon {
        color = #7eBAE4; /* NixOS 官方浅蓝色 */
        font-size = 18px;
        padding: 0 15px;
      }
    '';
    };
  }
}