{pkgs, ...}: {
  home.packages = with pkgs; [
    alacritty
    cubiomes-viewer
    firefox
    galculator
    gimp
    inkscape
    keepassxc
    krita
    libreoffice
    librewolf
    onlyoffice-bin
    prismlauncher
    qpdfview
    vlc
    vscodium
    xournal
    gnomeExtensions.dash-to-panel
    gnomeExtensions.just-perfection
    gnomeExtensions.caffeine
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
      hashicorp.terraform
      llvm-vs-code-extensions.vscode-clangd
    ];
    enable = true;
  };
}
