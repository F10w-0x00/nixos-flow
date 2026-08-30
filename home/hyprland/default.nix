{ config, pkgs, ... }:{

    imports = [
      ./waybar.nix # 引入同目录下的 waybar
    ];

  {

    wayland.windowManager.hyprland = {
      enable = true;

      settings = {

        "$mod" = "SUPER"; 
        "$terminal" = "alacritty";
        "$browser" = "google-chrome-stable";


        bind = [
          "$mod, T, exec, $terminal"
          "$mod, B, exec, $browser"


          "$mod, Q, killactive,"
          "$mod, F, fullscreen, 0"
          "$mod, V, togglefloating,"


          "$mod SHIFT, M, exit,"

 
          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"

          # --- 将窗口移动到对应工作区 (Super + Shift + 1~9) ---
          "$mod SHIFT, 1, movetoworkspace, 1"
          "$mod SHIFT, 2, movetoworkspace, 2"
          "$mod SHIFT, 3, movetoworkspace, 3"
          "$mod SHIFT, 4, movetoworkspace, 4"
          "$mod SHIFT, 5, movetoworkspace, 5"
        ];


        bindm = [
          # 按住 Super + 鼠标左键：拖拽移动窗口
          "$mod, mouse:272, movewindow"
          # 按住 Super + 鼠标右键：拖拽缩放窗口大小
          "$mod, mouse:273, resizewindow"
        ];
      };
    };
  }
}