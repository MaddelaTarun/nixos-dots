{ ... }:

{
  xdg.configFile."waybar" = {
    source = ../../config/waybar;
    recursive = true;
    force = true;
  };

  xdg.configFile."otter" = {
    source = ../../config/otter;
    recursive = true;
    force = true;
  };
}
