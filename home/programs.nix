{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./zen-browser.nix
    ./rofi.nix
    ./vscode.nix
    ./helix.nix
    #./fastfetch.nix
    #./browser/firefox.nix
    #./terminal/kitty.nix
    #./terminal/fish.nix
  ];

  home.packages = with pkgs; [
    zapzap
    (symlinkJoin {
      name = "obsidian-wayland";
      paths = [ obsidian ];
      buildInputs = [ makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/obsidian \
          --add-flags "--enable-features=UseOzonePlatform --ozone-platform=wayland"
      '';
    })
    hyprsunset
  ];
}
