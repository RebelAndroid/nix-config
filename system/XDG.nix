{pkgs, ...}: {
  home.packages = with pkgs; [
    xdg-utils
  ];

  xdg.userDirs = {
    enable = true;
    desktop = /home/christopher/desktop;
    documents = /home/christopher/documents;
    download = /home/christopher/downloads;
    music = /home/christopher/music;
    pictures = /home/christopher/pictures;
    videos = /home/christopher/videos;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
    };
  };
}
