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
