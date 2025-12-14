{
  pkgs,
  lib,
  ...
}: let
  nvim-overlay = final: prev: let
    all-plugins = prev.callPackage ./nvim/nvimPlugins.nix {};
    mkNeovim = prev.callPackage ./nvim/mkNeovim.nix {};
  in {
    nvim-pkg = mkNeovim {
      plugins = all-plugins;
      # inherit extraPackages;
    };
  };
in {
  nixpkgs.overlays = [
    nvim-overlay
  ];
  # environment.systemPackages = [pkgs.nvim-pkg];
}
