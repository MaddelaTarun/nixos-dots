{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
  ];

  networking.hostName = "desktop";

  system.stateVersion = "26.05";
}
