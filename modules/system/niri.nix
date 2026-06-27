{ pkgs, ... }:

{
  programs.niri.enable = true;
  programs.xwayland.enable = true;

  services.xserver.enable = false;
  services.displayManager.gdm.enable = false;
  services.desktopManager.gnome.enable = false;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config = {
      common.default = [ "gtk" ];
      niri.default = pkgs.lib.mkForce [ "gtk" ];
    };
  };
}
