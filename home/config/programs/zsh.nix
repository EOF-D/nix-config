{
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    enableCompletion = true;
    enableVteIntegration = true;

    autocd = true;

    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ~/nix-config/.#coal";
      home-update = "home-manager switch --flake ~/nix-config/.#andy@coal";
      ls = "exa -l --git --icons --color=auto";
      dir = "eza --color --tree";
      cat = "bat";
    };

    zplug = {
      enable = true;
      plugins = [
        {
          name = "mafredri/zsh-async";
          tags = [from:github];
        }
        {
          name = "sindresorhus/pure";
          tags = [use:pure.zsh from:github as:theme];
        }
      ];
    };

    initExtra = ''
      eval "$(direnv hook zsh)"
      LD_LIBRARY_PATH=/home/andy/.cache/pypoetry/virtualenvs/migration-ri3pQLP_-py3.11
    '';
  };
}
