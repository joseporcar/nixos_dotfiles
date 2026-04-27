{ inputs, pkgs, ...}:
{
  stylix = {
    enable = true;
    polarity = "light";
    # Wallpapers: 
    image = ./../wallpapers/nixos_wallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    cursor = {
        package = pkgs.catppuccin-cursors.macchiatoRosewater;
        name = "catppuccin-macchiato-rosewater-cursors";
        size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono";
      };
    };
  };
}
