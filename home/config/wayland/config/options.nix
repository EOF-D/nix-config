{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "hyprpaper"
    ];

    general = {
      gaps_in = 5;
      gaps_out = 25;
      border_size = 2;
      resize_on_border = true;

      "col.active_border" = "rgb(${config.colorScheme.palette.base0D})";
      "col.inactive_border" = "rgb(${config.colorScheme.palette.base00})";
    };

    animations = {
      enabled = true;
    };

    decoration = {
      rounding = 0;

      active_opacity = 1.0;
      inactive_opacity = 0.8;

      drop_shadow = true;
      shadow_range = 20;
      shadow_render_power = 5;
      shadow_ignore_window = true;
      shadow_offset = "0 2";

      blur = {
        enabled = true;
        passes = 2;
      };

      dim_inactive = false;
    };

    input = {
      "kb_layout" = "us";
      "follow_mouse" = true;
    };

    misc = {
      disable_hyprland_logo = true;
    };

    xwayland.force_zero_scaling = true;
  };
}
