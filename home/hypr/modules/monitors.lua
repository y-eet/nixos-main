-- Safe fallback: all monitors use preferred resolution/refresh and Hyprland positions them automatically.
-- After first boot, run: hyprctl monitors all
-- Then replace this with explicit DP/HDMI rules if you want fixed refresh/layout.
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })
