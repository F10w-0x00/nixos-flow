{ config, pkgs, ... }:{
  
    networking.hostName = "NixOS";
    networking.networkmanager.enable = true;
   
}