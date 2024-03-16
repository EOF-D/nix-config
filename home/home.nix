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
    overlays = [
      (final: prev: {
        neovim = inputs.neve.packages.${prev.system}.default;
      })
    ];

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
      NIXOS_OZONE_WL = "1";
    };
  };

  home.packages = with pkgs; [
    # Hyprland utilities
    grim
    grimblast
    hyprpaper
    wl-clipboard

    # Coding ultilies/apps
    unzip
    direnv
    gitkraken

    notepadqq
    csview

    # Secrets
    sops

    # Browser/Apps
    brave
    discord
    spotify

    # Sound
    pamixer
    bluez

    # Utils
    appimage-run

    inputs.neve.packages.${system}.default
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
    htop.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
