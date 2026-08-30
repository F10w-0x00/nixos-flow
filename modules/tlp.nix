{ config, pkgs, ... }:{



  services.power-profiles-daemon.enable = false;


  services.thermald.enable = true;


  services.udisks2.enable = true;


  services.tlp = {
    enable = true;
    settings = {
      # --- CPU 性能调度 ---
      # 插电时：性能全开
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_MAX_PERF_ON_AC = 100;
      
      # 电池模式下：省电优先，限制最高性能至 60% (可有效降温和大幅延长续航)
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_MAX_PERF_ON_BAT = 60; 

      # --- 接口省电 ---
      # 开启 USB 自动休眠（当鼠标或 U 盘闲置时自动切断 USB 供电）
      USB_AUTOSUSPEND = 1;

      # --- 电池寿命保护 (充放电阈值限制) ---
      # 当电量低于 75% 时，插上电源才会开始充电（防止电量 79% 时插电造成的频繁“微充电”）
      START_CHARGE_THRESH_BAT0 = 75;
      
      # 当电量充到 80% 时强制停止充电（避免电池长期处于 100% 满载高压状态，防止鼓包和容量衰减）
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };
}