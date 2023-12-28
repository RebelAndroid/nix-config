{pkgs, ...}: {
  home.packages = with pkgs; [
    xdg-utils
  ];

  xdg.enable = true;
  xdg.configHome = "/home/christopher/.config";
  xdg.userDirs = {
    enable = true;
    desktop = /home/christopher/desktop;
    documents = /home/christopher/documents;
    download = /home/christopher/downloads;
    music = /home/christopher/music;
    pictures = /home/christopher/pictures;
    videos = /home/christopher/videos;
  };
}
