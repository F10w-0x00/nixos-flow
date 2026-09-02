{ config, pkgs, ... }:
{
  imports = [
    ./waybar.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = ''

      hl.on("hyprland.start", function()
        hl.exec_cmd("waybar")
      end)

      -- 应用启动
      hl.bind("SUPER + T", hl.dsp.exec_cmd("alacritty"))
      hl.bind("SUPER + B", hl.dsp.exec_cmd("google-chrome-stable"))

      -- 窗口管理
      hl.bind("SUPER + Q", hl.dsp.window.close())
      hl.bind("SUPER + F", hl.dsp.window.fullscreen())
      hl.bind("SUPER + V", hl.dsp.window.float())

      -- 退出 Hyprland
      hl.bind("SUPER + SHIFT + M", hl.dsp.exit())

      -- 切换工作区
      hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
      hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
      hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
      hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
      hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))

      -- 将窗口移动到对应工作区
      hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
      hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
      hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
      hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
      hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))

      -- 鼠标绑定
      hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
      hl.bind("SUPER + mouse:273", hl.dsp.window.resize())
    '';
  };
}