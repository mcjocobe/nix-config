{
  pkgs,
  lib,
  ...
}: let
  vscode-overlay = final: prev: {
    vscode-configured = prev.pkgs.vscode-with-extensions.override {
      vscodeExtensions = with prev.pkgs.vscode-extensions; [
        bbenoist.nix
        eamodio.gitlens
        editorconfig.editorconfig
        esbenp.prettier-vscode
        humao.rest-client
        kamadorueda.alejandra
        mechatroner.rainbow-csv
        mkhl.direnv
        ms-azuretools.vscode-docker
        ms-python.black-formatter
        ms-python.python
        ms-python.vscode-pylance
        ms-toolsai.jupyter
        ms-vscode-remote.remote-ssh
        scala-lang.scala
        tamasfe.even-better-toml
        zaaack.markdown-editor
      ];
    };
  };
in {
  nixpkgs.overlays = [
    vscode-overlay
  ];
  environment.systemPackages = [pkgs.vscode-configured];
}
