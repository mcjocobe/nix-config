{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    autojump
    black
    direnv
    fasd
    fd
    fzf
    git
    neovim
    nodejs
    postgresql
    qmk
    ranger
    ripgrep
    sops
    starship
    tmux
    tree
    vscode-configured
    # tiko
    mosquitto
    wireguard-go
    wireguard-tools
    # Casks
    google-chrome
  ];
  fonts.packages = with pkgs; [
    nerdfonts
    powerline-fonts
    powerline-symbols
  ];
}