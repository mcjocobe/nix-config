{
  config,
  pkgs,
  ...
}: {
  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.autojump.enable = true;
  # programs.direnv.enable = true;
  programs.eza.enable = true;
  programs.fzf.enable = true;
  programs.home-manager.enable = true;
  programs.starship = {
    enable = true;
  };
  programs.zsh = {
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "main"
        "brackets"
      ];
      styles = {
        "command*" = "fg=#a6d56e";
        "precommand" = "fg=#a6d56e";
        "arg0" = "fg=#a6d56e";
        "alias" = "fg=#a6d56e";
        "suffix-alias" = "fg=#a6d56e";
      };
    };
    dotDir = ".config/zsh";
    enable = true;
    enableCompletion = true;
    history.ignoreAllDups = true;
    historySubstringSearch.enable = true;
    # initExtra = ''
    #   [[ ! -f $(./p10k.zsh) ]] || source $(./p10k.zsh)
    # '';
    initContent = ''
      export PATH=$PATH:/etc/profiles/per-user/josecolomer/bin
      export PATH=$PATH:/run/current-system/sw/bin
      export PATH=$PATH:/usr/local/bin

      bindkey "^A" vi-beginning-of-line
      bindkey "^E" vi-end-of-line

      alias -- 'tiko'='cd /Users/josecolomer/Documents/QE/tiko'

      if [[ $TERM != "dumb" ]]; then
        # don't set STARSHIP_CONFIG automatically if there's a user-specified
        # config file.  starship appears to use a hardcoded config location
        # rather than one inside an XDG folder:
        # https://github.com/starship/starship/blob/686bda1706e5b409129e6694639477a0f8a3f01b/src/configure.rs#L651
        if [[ ! -f "$HOME/.config/starship.toml" ]]; then
           export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
        fi
        eval "$(${config.programs.starship.package}/bin/starship init zsh)"
      fi
    '';
    plugins = [
      # {
      #   name = "powerlevel10k";
      #   src = pkgs.zsh-powerlevel10k;
      #   file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      # }
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
      {
        name = "fzf-z";
        src = pkgs.zsh-z;
        file = "share/zsh-z/zsh-z.plugin.zsh";
      }
    ];
    # syntaxHighlighting.enable = true;
  };
  programs.neovim = {
    plugins = [
      pkgs.vimExtraPlugins.nvim-colorizer-lua
    ];
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true; # If you use Zsh
    # enableBashIntegration = true;  # If you use Bash
    nix-direnv = {
      enable = true;
    };
  };

  # Home Manager needs a bit of information about you and the paths it should
  # manage.

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/davish/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "vim";
    VAULT_ADDR = "https://vault.internal.tiko.ch";
  };

  # Let Home Manager install and manage itself.
}
