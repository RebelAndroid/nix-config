{pkgs, ...}: {
  home.packages = with pkgs; [
    alacritty # terminal
    firefox # web browser
    gimp # image editor
    inkscape # vector art
    keepassxc # password manager
    krita # raster art
    libreoffice # office suite
    librewolf # web browser
    prismlauncher # minecraft launcher
    vlc # media player
    vscodium # code editor
    xournalpp # document writing program

    # typesetting system
    typst
    typst-lsp
    typstfmt

    # gnomeExtensions.dash-to-panel
    # gnomeExtensions.just-perfection
    # gnomeExtensions.caffeine
    # gnomeExtensions.advanced-alttab-window-switcher
    # gnomeExtensions.blur-my-shell
  ];

  xdg.configFile."alacritty/alacritty.toml".source = ./alacritty.toml;
  xdg.configFile."fish/config.fish".source = ./config.fish;
  xdg.configFile."starship.toml".source = ./starship.toml;

  xdg.desktopEntries."element".name = "Element";
  xdg.desktopEntries."element".exec = "firefox --new-window app.element.io";
  xdg.desktopEntries."element".icon = "element-logo.png";
  xdg.dataFile."icons/element-logo.png".source = ./element-logo.png;

  xdg.desktopEntries."discord".name = "Discord";
  xdg.desktopEntries."discord".exec = "firefox --new-window discord.com/app";
  xdg.desktopEntries."discord".icon = "discord-logo.png";
  xdg.dataFile."icons/discord-logo.png".source = ./discord-logo.png;

  programs.vscode = {
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      jnoortheen.nix-ide
      ms-python.python
      llvm-vs-code-extensions.vscode-clangd
      mgt19937.typst-preview
      nvarner.typst-lsp
      tomoki1207.pdf
    ];
    enable = true;
  };
}
