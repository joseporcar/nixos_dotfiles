{
description = "Hyprland on Nixos";

inputs = {
    ashell.url = "github:MalpenZibo/ashell";
    helix.url = "github:helix-editor/helix/master";
    zen-browser = {
        url = "github:0xc000022070/zen-browser-flake";
        inputs = {
            nixpkgs.follows = "nixpkgs";
            home-manager.follows = "home-manager";
        };
    };
    stylix = {
        url = "github:danth/stylix";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.home-manager.follows = "nixpkgs";
    };

    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "nixpkgs/nixos-unstable";
};

outputs = {nixpkgs, home-manager, ...} @inputs : {
    nixosConfigurations.pcpronix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
            ./devices/pcpronix/configuration.nix
            home-manager.nixosModules.home-manager {
                home-manager = {
                    extraSpecialArgs = {inherit inputs;};
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    users.pcpronix = import ./devices/pcpronix/home.nix;
                    backupFileExtension = "backup";
                };
            }
            inputs.stylix.nixosModules.stylix
        ];
    };
};
}
