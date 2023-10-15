{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    apparmor-utils
    bottom
    cbonsai
    cloc
    compsize
    file
    gh
    gptfdisk
    jdk17
    lm_sensors
    neofetch
    nix-index
    nixpkgs-fmt
    pstree
    scowl
    smartmontools
    sox
    starship
    texlive.combined.scheme-full
    timer
    yt-dlp
  ];
}
