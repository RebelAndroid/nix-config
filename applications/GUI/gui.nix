{pkgs, ...}: {
  home.packages = with pkgs; [
    zoom-us
    gimp
    vscodium
    librewolf
    alacritty
    firefox
    xarchiver
    krita
    gparted
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    kate
    freetube
    prismlauncher
    cubiomes-viewer
    onlyoffice-bin
  ];
  xdg.configFile."alacritty/alacritty.yml".source = ./alacritty.yaml;

  programs.vscode = {
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      jnoortheen.nix-ide
    ];
    enable = true;
  };
}
