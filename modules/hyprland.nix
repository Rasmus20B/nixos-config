{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "monitor" = ",preferred,auto,auto";
      "$terminal" = "kitty -o font_size=20";
      "$menu" = "wofi --show drun";
      "$browser" = "firefox";
      "$mod" = "SUPER";
      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, C, killactive"

        "$mainMod, Return, exec, $terminal"
        "$mainMod, F, exec, $menu"
        "$mainMod, B, exec, $browser"

        "$mainMod, h,  movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, j, movefocus, d"
        "$mainMod, k, movefocus, u"
        ]
        ++ (
        builtins.concatLists (builtins.genList (i:
          let ws = i + 1;
          in [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        )
        9)
      );
      "exec-once" = [
        "nm-applet --indicator &"
        "waybar &"
        "swww init &"
        "swww img ~/pix/papes/mario-ho-vV2A50HUqsU-unsplash.jpg &"
        "pipewire &"
        "pipewire-pulse &"
        "dunst"
      ];
    };
  };
}
