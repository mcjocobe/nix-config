{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
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
      then ["/Users/joseluiscolomer"]
      else ["/home/joseluiscolomer"];
  in {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#MK7M66VTWLC

    darwinConfigurations."Joses-Air" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        ./application-overlays/vscode.nix
        ./application-overlays/nvim.nix
        ./system-packages.nix
        ./darwin.nix
        ./scripts.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.joseluiscolomer = import ./home.nix;

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
        ./nixos.nix
        ./hardware-configuration.nix
        ./configuration.nix
        home-manager.nixosModules.home-manager
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
    darwinPackages = self.darwinConfigurations."Joses-Air".pkgs;
    nixosPackages = self.nixosConfigurations."nixos".pkgs;
  };
}
