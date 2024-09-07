{
  description = "Home Manager configuration of jdiaz";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    # Apps
    zen-browser.url = "github:MarceColl/zen-browser-flake";

    # Cursors
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";

    nixvim = {
      url = "/home/jdiaz/.config/home-manager/modules/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
    #pkgs = nixpkgs.legacyPackages.${system};
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};
  in {
    devShells.${system}.default = import ./shell.nix {inherit pkgs;};

    # Fish shell
    #
    home-manager.useGlobalPkgs = true;

    home-manager.users.jdiaz = {
      programs.fish = {
        enable = true;
        vendor = {
          completions.enable = true;
          config.enable = true;
          functions.enable = true;
        };

        # For your git dependencies, just proceed as usual
        plugins = with pkgs; [
          {
            name = "autorpair";
            src = fishPlugins.autopair.src;
          }
        ];
      };
    };

    homeConfigurations."jdiaz" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      # Specify your home configuration modules here, for example,
      # the path to your home.nix.
      modules = [
        ./home.nix
      ];

      # Optionally use extraSpecialArgs
      # to pass through arguments to home.nix
      extraSpecialArgs = {
        inherit pkgs-stable;
        inherit inputs;
        inherit system;
      };
    };
  };
}
