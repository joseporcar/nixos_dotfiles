{ pkgs, ... }:
{
  imports = [    
    ./git.nix
    ./zen-browser.nix
    #./vscode.nix
    #./fastfetch.nix
    #./browser/firefox.nix
    #./terminal/kitty.nix
    #./terminal/fish.nix
  ];

  home.packages = [
    pkgs.zapzap
  ];
}