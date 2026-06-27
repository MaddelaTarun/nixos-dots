{ ... }:

{
  imports = [
    ./shell.nix
    ./editor.nix
    ./bars.nix
  ];

  home.username = "t";
  home.homeDirectory = "/home/t";
  home.stateVersion = "26.05";
}
