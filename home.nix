{ pkgs, ... }: {
  # This is required information for home-manager to do its job
  home = {
    stateVersion = "23.11";
    username = "scott";
    homeDirectory = "/Users/scott";

    file.".config" = {
      source = ./config;
      recursive = true;
    };
    file.".zsh" = {
      source = ./.zsh;
      recursive = true;
    };
    file.".zshrc" = {source = ./.zshrc;};
    file.".aerospace.toml" = {source = ./.aerospace.toml;};
    file.".tmux.conf" = {source = ./.tmux.conf;};

    packages = [
      pkgs.git
      pkgs.neovim
      pkgs.solc
      pkgs.go_1_23
      pkgs.tmux
    ];
  };

  # This is to ensure programs are using ~/.config rather than
  # /Users/<username/Library/whatever
  xdg.enable = true;

  programs.home-manager.enable = true;
  # I use fish, but bash and zsh work just as well here. This will setup
  # the shell to use home-manager properly on startup, neat!
 # programs.zsh.enable = true;
}
