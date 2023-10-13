{pkgs, ...}: {
  home.packages = with pkgs; [
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
    keepassxc
    inkscape
    vlc
    galculator
    godot_4
    blender
    libreoffice
  ];
  xdg.configFile."alacritty/alacritty.yml".source = ./alacritty.yaml;
  xdg.configFile."fish/config.fish".source = ./config.fish;
  xdg.configFile."starship.toml".source = ./starship.toml;

  programs.vscode = {
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      jnoortheen.nix-ide
      james-yu.latex-workshop
      ms-python.python
    ];
    enable = true;
  };
}
