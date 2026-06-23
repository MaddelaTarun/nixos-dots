{
  description = "Simple NixOS Setup - Tarun";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    # Helium Browser Flake
    helium-flake.url = "github:oxcl/nix-flake-helium-browser";
    helium-flake.inputs.nixpkgs.follows = "nixpkgs";

    # Otter Launcher
    otter-launcher.url = "github:kuokuo123/otter-launcher";
    otter-launcher.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, helium-flake, otter-launcher, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        
        # Inject the Helium browser module globally into your system
        helium-flake.nixosModules.default
	({ pkgs,...}: {
	  environment.systemPackages = [
	    otter-launcher.packages."x86_64-linux".default
	  ];
	})
      ];
    };
  };
}
