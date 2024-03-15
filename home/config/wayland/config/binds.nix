{pkgs, ...}: {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$terminal" = "kitty";

    bind =
      [
        # Compositor.
        "$mod SHIFT, Q, exit"
        "$mod, W, killactive"
        "$mod, F, fullscreen"
        "$mod, Space, togglefloating"

        # Move focus.
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        # Move window.
        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, right, movewindow, r"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, down, movewindow, d"

        "$mod ALT, right, resizeactive, 20 0"
        "$mod ALT, left, resizeactive, -20 0"
        "$mod ALT, up, resizeactive, 0 -20"
        "$mod ALT, down, resizeactive, 0 20"

        # Utilities.
        "$mod, Return, exec, $terminal"
        ", Print, exec, grimblast copy area"
        "$mod, P, exec, appimage-run ~/vendors/Bearly-3.0.0.AppImage"
        "$mod, H, exec, appimage-run ~/vendors/HTTPie-2024.1.2.AppImage"
        "$alt, Space, exec, rofi -show drun"
      ]
      ++ (
        # Workspaces
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );

    binde = [
      # Audio.
      ",XF86AudioRaiseVolume, exec, ${pkgs.pamixer}/bin/pamixer --increase 5"
      ",XF86AudioLowerVolume, exec, ${pkgs.pamixer}/bin/pamixer --decrease 5"
      ",XF86AudioMute, exec, ${pkgs.pamixer}/bin/pamixer --toggle-mute"
      ",XF86AudioMicMute, exec, ${pkgs.pamixer}/bin/pamixer --default-source --toggle-mute"

      # Brightness.
      ",XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl set +10%"
      ",XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 10%-"
    ];
  };
}
