{pkgs, lib, ...}:
let
vscode-overlay = pkgs.callPackage ./application-overlays/vscode.nix { };
in {
  nixpkgs.overlays = [
    vscode-overlay
  ];
}