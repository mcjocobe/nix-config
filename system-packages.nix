{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    arp-scan
    autojump
    black
    direnv
    inetutils
    fasd
    fd
    fzf
    git
    neovim
    nmap
    nodejs
    postgresql
    prettierd
    qmk
    ranger
    ripgrep
    sops
    starship
    thonny
    tmux
    tree
    vscode-configured
    # tiko
    mosquitto
    wireguard-go
    wireguard-tools
    wireshark
    # Casks
    google-chrome
  ];
  fonts.packages = with pkgs; [
    nerdfonts
    powerline-fonts
    powerline-symbols
  ];
}
