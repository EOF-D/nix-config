{
  imports = [
    ./config/binds.nix
    ./config/options.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
  };
}
