{ pkgs, ... }:
{
   imports = [
      ./stylix.nix
   ];
   programs.nix-ld.enable = true;
}
