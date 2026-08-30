{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      # --- 窗口与透明度 ---
      window = {
        opacity = 0.8;
        padding = {
          x = 10;
          y = 10;
        };
      };

      # --- 字体配置 (Maple Mono NF CN) ---
      font = {
        normal = {
          family = "Maple Mono NF CN";
          style = "Regular";
        };
        bold = {
          family = "Maple Mono NF CN";
          style = "Bold";
        };
        italic = {
          family = "Maple Mono NF CN";
          style = "Italic";
        };
        size = 13.0; # 可以根据你的屏幕分辨率微调
      };

      # --- 主题配色 (Tokyo Night Storm) ---
      colors = {
        primary = {
          background = "#24283b";
          foreground = "#c0caf5";
        };
        cursor = {
          text = "#1d202f";
          cursor = "#c0caf5";
        };
        normal = {
          black   = "#1d202f";
          red     = "#f7768e";
          green   = "#9ece6a";
          yellow  = "#e0af68";
          blue    = "#7aa2f7";
          magenta = "#bb9af7";
          cyan    = "#7dcfff";
          white   = "#a9b1d6";
        };
        bright = {
          black   = "#414868";
          red     = "#f7768e";
          green   = "#9ece6a";
          yellow  = "#e0af68";
          blue    = "#7aa2f7";
          magenta = "#bb9af7";
          cyan    = "#7dcfff";
          white   = "#c0caf5";
        };
      };
    };
  };
}