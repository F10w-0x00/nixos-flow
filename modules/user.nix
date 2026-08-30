{ pkgs, ... }:{
  
  {
    users.users.flow = {
      isNormalUser = true;
      description = "flow";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        tree
      ];

      shell = pkgs.zsh;
    
    };
  }
}