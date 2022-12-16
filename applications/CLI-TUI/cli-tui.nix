{pkgs, ...}: {
  home.packages = with pkgs; [
    neofetch
    pstree
    alejandra
    cbonsai
    gh
  ];
}
