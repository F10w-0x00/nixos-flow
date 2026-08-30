{ config, inputs, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/anchor.nix
    ];

  system.stateVersion = "26.05";
}