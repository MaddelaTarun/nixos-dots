{ pkgs, ... }:

{
  programs.fish.enable = true;

  xdg.configFile."fish" = {
    source = ../../config/fish;
    recursive = true;
    force = true;
  };

  xdg.configFile."starship/starship.toml" = {
    source = ../../config/starship/starship.toml;
    force = true;
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = false;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = false;
  };
}
