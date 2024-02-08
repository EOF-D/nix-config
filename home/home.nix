{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./config
    inputs.sops-nix.homeManagerModules.sops
    inputs.nix-colors.homeManagerModules.default
  ];

  # Setting colorscheme
  colorscheme = inputs.nix-colors.colorSchemes.gruvbox-material-dark-hard;

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "andy";
    homeDirectory = "/home/andy";

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  home.packages = with pkgs; [
    # Hyprland utilities
    grim
    grimblast
    hyprpaper

    # Secrets
    sops

    # Browser
    brave

    # Sound
    pamixer
  ];

  programs = {
    home-manager.enable = true;
    git.enable = true;

    bash = {
      enable = true;
      initExtra = ''
        . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
      '';
    };

    bat.enable = true;
    eza.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
