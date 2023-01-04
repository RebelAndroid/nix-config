{pkgs, ...}: {
  home.packages = with pkgs; [
    neofetch
    pstree
    alejandra
    cbonsai
    gh
    compsize
    yt-dlp
    bottom
    jdk17
    smartmontools
    lm_sensors
  ];
}
