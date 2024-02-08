{
  inputs,
  pkgs,
  lib,
  ...
}: {
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/nix-config/wallpapers/glass-panes.png
    wallpaper = , ~/nix-config/wallpapers/glass-panes.png
  '';

  systemd.user.services.hyprpaper = {
    Unit = {
      Description = "Hyprland wallpaper daemon";
      PartO = ["graphical-session.target"];
    };

    Service = {
      ExecStart = "${lib.getExe inputs.hyprpaper.packages.${pkgs.system}.default}";
      Restart = "on-failure";
    };

    Install.WantedBy = ["graphical-session.target"];
  };
}
