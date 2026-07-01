{
  description = "Tarun's NixOS Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helium-flake.url = "github:oxcl/nix-flake-helium-browser";
    helium-flake.inputs.nixpkgs.follows = "nixpkgs";
    otter-launcher.url = "github:kuokuo123/otter-launcher";
    otter-launcher.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, home-manager, helium-flake, otter-launcher, ... }@inputs:
  let
    mkSystem = modules: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = modules ++ [
        helium-flake.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.t = import ./modules/home;
        }
      ];
    };
  in {
    nixosConfigurations = {
      desktop = mkSystem [ ./hosts/desktop ];
      laptop  = mkSystem [ ./hosts/laptop  ];
    };
  };
}
