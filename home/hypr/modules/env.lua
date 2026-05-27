hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("GTK_USE_PORTAL", "1")

-- NVIDIA Wayland
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("__GL_VRR_ALLOWED", "1")
hl.env("__GL_GSYNC_ALLOWED", "1")
hl.env("NVD_BACKEND", "direct")

-- Native Wayland for browsers/Electron apps
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("NIXOS_OZONE_WL", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
