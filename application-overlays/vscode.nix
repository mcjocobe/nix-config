{
  pkgs,
  lib,
  ...
}: let
  vscode-overlay = final: prev: {
    vscode-configured = prev.pkgs.vscode-with-extensions.override {
      vscodeExtensions = with prev.pkgs.vscode-extensions; [
        bbenoist.nix
        editorconfig.editorconfig
        esbenp.prettier-vscode
        kamadorueda.alejandra
        mkhl.direnv
        ms-azuretools.vscode-docker
        ms-python.black-formatter
        ms-python.python
        ms-toolsai.jupyter
        ms-vscode-remote.remote-ssh
        tamasfe.even-better-toml
      ];
    };
  };
in {
  nixpkgs.overlays = [
    vscode-overlay
  ];
}
