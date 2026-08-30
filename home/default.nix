{ config, pkgs, lib, ... }: {

  {
    imports = [
      ./alacritty
      ./hyprland
      ./wezterm
    ];

    home = {
      username = "flow";
      homeDirectory = "/home/flow";
      stateVersion = "26.05";
    };
  

    programs.home-manager.enable = true;
  }
}