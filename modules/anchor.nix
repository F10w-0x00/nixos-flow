{ config, pkgs, ... }: {
  imports = [
    ./audio.nix
    ./bootloader.nix
    ./locales.nix
    ./network.nix
    ./package.nix
    ./setting.nix
    ./tlp.nix
    ./user.nix
  ];
}