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
    lima
    nix-direnv
    neovim
    nmap
    nodejs
    pgcli
    postgresql
    prettierd
    python312
    qmk
    ranger
    ripgrep
    sops
    starship
    thonny
    tmux
    tree
    uv
    vault
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
