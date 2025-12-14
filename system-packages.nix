{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    arp-scan
    autojump
    black
    # devenv
    inetutils
    fasd
    fd
    freerdp
    fzf
    git
    keepassxc
    lima
    nix-direnv
    # neovim
    nmap
    nodejs
    pgcli
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
    mosquitto
    nvim-pkg
    wireguard-go
    wireguard-tools
    wireshark
    # Casks
    google-chrome
  ];
  fonts.packages = with pkgs; [
    nerdfonts
    # nerd-fonts.fira-code
    # nerd-fonts.droid-sans-mono

    # nerd-fonts.symbols-only
    powerline-fonts
    powerline-symbols
  ];
}
