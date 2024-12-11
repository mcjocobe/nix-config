{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    home-manager,
    nixpkgs,
  }: let
    configuration = {pkgs, ...}: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;
    };
    HOME_DIR =
      if nixpkgs.system == "x86_64-darwin"
      then ["/Users/josecolomer"]
      else ["/home/josecolomer"];
  in {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#MK7M66VTWLC

    darwinConfigurations."MK7M66VTWLC" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        ./application-overlays/vscode.nix
        ./system-packages.nix
        ./darwin.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.josecolomer = import ./home.nix;

          # Optionally, use home-manager.extraSpecialArgs to pass
          # arguments to home.nix
        }
      ];
      specialArgs = {inherit inputs;};
    };
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      modules = [
        configuration
        ./application-overlays/vscode.nix
        ./system-packages.nix
        # ./nixos.nix
        ./hardware-configuration.nix
        ./configuration.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.josecolomer = import ./home.nix;

          # Optionally, use home-manager.extraSpecialArgs to pass
          # arguments to home.nix
        }
      ];
      specialArgs = {inherit inputs;};
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."MK7M66VTWLC".pkgs;
    nixosPackages = self.nixosConfigurations."nixos".pkgs;
  };
}
