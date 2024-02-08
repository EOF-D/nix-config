{
  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;
    enableCompletion = true;
    enableVteIntegration = true;

    autocd = true;

    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ~/nix-config/.#coal";
      home-update = "home-manager switch --flake ~/nix-config/.#andy@coal";
      dir = "eza --color --tree";
      cat = "bat";
    };

    zplug = {
      enable = true;
      plugins = [
	{ name = "mafredri/zsh-async"; tags = [from:github]; }
	{ name = "sindresorhus/pure"; tags = [use:pure.zsh from:github as:theme]; }
      ];
    };

    initExtra = ''
       unset PROMPT_COMMAND
    '';
  };
}
