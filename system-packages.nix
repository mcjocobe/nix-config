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
    keepassxc
    neovim
    nmap
    nodejs
    postgresql
    prettierd
    python311
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
    # tempstuff for vscode
    stdenv
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    powerline-fonts
    powerline-symbols
  ];
}
