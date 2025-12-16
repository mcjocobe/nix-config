{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    arp-scan
    autojump
    black
    inetutils
    fasd
    fd
    fzf
    git
    # nix-direnv
    nmap
    pgcli
    python312
    qmk
    ranger
    ripgrep
    starship
    tmux
    tree
    uv
    nvim-pkg
    wireguard-go
    wireguard-tools
    # Casks
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.symbols-only
    nerd-fonts.jetbrains-mono
    powerline-fonts
    powerline-symbols
  ];
}
