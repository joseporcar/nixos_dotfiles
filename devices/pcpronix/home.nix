{ config, pkgs, inputs, ...}:
{
  imports = [
    ./../../home/programs.nix

  ];
  home = {
    username = "pcpronix";
    homeDirectory = "/home/pcpronix";
    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;
  home.packages = [
    pkgs.brightnessctl
    inputs.ashell.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.nautilus
  ];

}
