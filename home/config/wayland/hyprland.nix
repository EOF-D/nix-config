{
  imports = [
    ./config/binds.nix
    ./config/options.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
