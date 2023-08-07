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
    texlive.combined.scheme-full
    timer
    sox
    nix-index
    apparmor-utils
    gptfdisk
    starship
    nixpkgs-fmt
  ];
}