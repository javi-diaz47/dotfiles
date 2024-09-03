{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
  };

  outputs = { nixpkgs, ... } @ inputs: 
let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true; 
        allowUnfreePredicate = (_: true);
      };
    };
in 
  {
    nixosConfigurations.devi = nixpkgs.lib.nixosSystem {
      inherit pkgs;
      specialArgs = {inherit inputs; };
      modules = [
        ./configuration.nix
      ];
    };
  };
}
