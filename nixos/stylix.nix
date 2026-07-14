{ inputs, pkgs, ... }:
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
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      monospace = {
        # The updated Nixpkgs syntax for individual Nerd Fonts
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 11;
        terminal = 12;
        desktop = 11;
        popups = 11;
      };
    };
  };
}
