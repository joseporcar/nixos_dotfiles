{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    # 1. General Editor Settings
    settings = {
      #theme = "catppuccin_macchiato";
      editor = {
        line-number = "relative";
        cursorline = true;
        color-modes = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides.render = true;
        lsp.display-messages = true;
      };
    };

    # 2. Language-Specific Configuration (languages.toml)
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = { command = "nixpkgs-fmt"; };
          language-servers = [ "nil" ];
        }
        {
          name = "rust";
          auto-format = true;
          language-servers = [ "rust-analyzer" ];
        }
        {
          name = "python";
          language-servers = [ "pyright" "ruff" ];
        }
        {
          name = "c";
          language-servers = [ "clangd" ];
        }
        {
          name = "verilog"; # Crucial for your EE work
          language-servers = [ "svls" ];
        }
      ];
    };

    # 3. The "Secret Sauce": Isolated LSPs
    # These are only available to Helix, keeping your system clean.
    extraPackages = with pkgs; [
      # Nix
      nil
      nixpkgs-fmt
      # Rust
      rust-analyzer
      # Python
      pyright
      ruff
      # C / C++ / Verilog
      clang-tools # provides clangd
      svls        # SystemVerilog Language Server
      # Others
      marksman    # Markdown LSP
      taplo       # TOML LSP
    ];
  };
}
