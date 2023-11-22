{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    apparmor-utils
    bottom
    cloc
    compsize
    dconf2nix
    docker
    distrobox
    file
    gh
    gptfdisk
    jdk17
    lm_sensors
    neofetch
    nil
    nix-index
    nixpkgs-fmt
    pstree
    scowl
    smartmontools
    starship
    texlive.combined.scheme-full
    timer
  ];
}
