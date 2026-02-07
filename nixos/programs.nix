{ pkgs, ... }:
{
  imports = [    
    ./home/programs.nix
    ./nixos/programs.nix
  ];
}