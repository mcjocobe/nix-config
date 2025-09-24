{
  pkgs,
  lib,
  ...
}: let
  vscode-overlay = final: prev: {
    vscode-configured = prev.pkgs.vscode-with-extensions.override {
      vscodeExtensions = with prev.pkgs.vscode-extensions; [
        bbenoist.nix
        dart-code.flutter
        eamodio.gitlens
        editorconfig.editorconfig
        esbenp.prettier-vscode
        grapecity.gc-excelviewer
        kamadorueda.alejandra
        mechatroner.rainbow-csv
        mkhl.direnv
        ms-azuretools.vscode-docker
        ms-python.black-formatter
        ms-python.python
        ms-toolsai.jupyter
        ms-toolsai.jupyter-renderers
        ms-vscode-remote.remote-ssh
        tamasfe.even-better-toml
        zaaack.markdown-editor
      ];
    };
  };
in {
  nixpkgs.overlays = [
    vscode-overlay
  ];
}
