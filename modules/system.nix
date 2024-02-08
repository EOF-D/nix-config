{
  pkgs,
  lib,
  ...
}: {
  programs.zsh.enable = true;
  users.users.andy = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ];

    initialPassword = "temp";
    home = "/home/andy";
    shell = pkgs.zsh;
  };

  time.timeZone = "America/New_York";

  # Garbage collection every week.
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  nixpkgs.config.allowUnfree = true;

  # Locale settings.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_MESSAGES = "en_US.UTF-8";
  };

  # Fonts.
  fonts = {
    packages = with pkgs; [
      pkgs.noto-fonts
      pkgs.noto-fonts-cjk
      pkgs.noto-fonts-emoji

      (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})
    ];

    fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif" "Noto Color Emoji"];
        sansSerif = ["Noto Sans" "Noto Color Emoji"];
        monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };

      antialias = true;
      hinting.enable = true;
      subpixel.rgba = "rgb";
    };
  };

  # System packages.
  environment.systemPackages = with pkgs; [
    neovim
    git
    curl
    neofetch
    nnn
    tree
  ];

  # Sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable polkit.
  security.polkit.enable = true;
}
