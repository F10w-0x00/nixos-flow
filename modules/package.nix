{ inputs, pkgs, ... }:{
  {
    programs.zsh.enable = true;

    services.displayManager.ly.enable = true;

    services.xserver = {
      enable = true;
      autoRepeatDelay = 200;
      autoRepeatInterval = 35;
      windowManager.qtile.enable = true;
  };


    programs.hyprland.enable = true;


    programs.neovim = {
      enable = true;
      defaultEditor = true;
      configure = {
        customRC = ''
          filetype plugin indent on
          set expandtab
          set shiftwidth=4
          set softtabstop=4
          set tabstop=4
          set number
          set relativenumber
          set smartindent
          set showmatch
          set backspace=indent,eol,start
          syntax on
          '';
      };
    };


    fonts.packages = with pkgs; [
     
      maple-mono.NF-CN-unhinted

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
    ]; 


    environment.systemPackages = with pkgs; [
      vim
      wget
      git
      btop
      fastfetch
    ];


    programs.nix-ld.enable = true;
  }
}