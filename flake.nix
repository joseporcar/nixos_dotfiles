{
description = "Hyprland on Nixos";

inputs = {
    ashell.url = "github:MalpenZibo/ashell";
    zen-browser = {
        url = "github:0xc000022070/zen-browser-flake";
        inputs = {
            nixpkgs.follows = "nixpkgs";
            home-manager.follows = "home-manager";
        };
    };

    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "nixpkgs/nixos-unstable";
};

outputs = {nixpkgs, home-manager, ...} @inputs : {
    nixosConfigurations.pcpronix = nixpkgs.lib.nixosSystem {
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
        ];
    };
};
}
