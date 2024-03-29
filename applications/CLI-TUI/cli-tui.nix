{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra # nix formatter
    bat # cat replacement
    bottom # resource monitor
    docker # containerization system
    du-dust # disk usage monitor
    eza # ls replacement
    file # file type analyzer
    gh # github cli
    jdk17 # java development kit
    lm_sensors # get hardware info from sensors
    neofetch # tool for generating screenshots to post online
    nil # nix language server
    pstree # displays running processes in a tree
    smartmontools # get information about drives
    starship # shell prompt
    timer # timer
    tldr # man replacement
    tree # displays file trees
    zoxide # cd replacement
  ];
}
