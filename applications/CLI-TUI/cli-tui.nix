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
    jdk17
    lm_sensors
    neofetch
    nil # nix language server
    nix-index
    nixpkgs-fmt
    pstree
    scowl
    smartmontools
    starship
    timer
    tree
  ];
}
