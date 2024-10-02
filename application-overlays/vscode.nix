{
  pkgs,
  lib,
  ...
}:
let
vscode-overlay = final: prev: {
    vscode-configured = prev.pkgs.vscode-with-extensions.override {
      vscodeExtensions = with prev.pkgs.vscode-extensions; [
        ms-azuretools.vscode-docker
        bbenoist.nix
        editorconfig.editorconfig
        esbenp.prettier-vscode
        kamadorueda.alejandra
        mkhl.direnv
        ms-python.black-formatter
        ms-python.python
        ms-vscode-remote.remote-ssh
      ];
    };
  };
  in {
  nixpkgs.overlays = [
    vscode-overlay
  ];
}
