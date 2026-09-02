{ config, pkgs, ... }:
{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      configurationLimit = 3;
    };
  };

  boot.kernelParams = [
    "acpi_backlight=vendor"
    "nowatchdog"
  ];


  environment.systemPackages = with pkgs; [
    os-prober
  ];
}