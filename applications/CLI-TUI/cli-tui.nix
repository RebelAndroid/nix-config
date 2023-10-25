{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    apparmor-utils
    bottom
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
    starship
    texlive.combined.scheme-full
    timer
    dconf2nix
  ];
}
