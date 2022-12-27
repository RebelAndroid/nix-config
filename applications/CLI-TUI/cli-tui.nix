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
  ];
}
