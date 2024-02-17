{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra # nix formatter
    bottom # resource monitor
    docker # containerization system
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
    tree # displays file trees
    zoxide # cd replacement
  ];
}
