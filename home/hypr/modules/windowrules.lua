-- ~/.config/hypr/modules/windowrules.lua
-- Window rules for our current Arch + Hyprland setup.

local function rule(name, match, effects)
    local r = effects or {}
    r.name = name
    r.match = match
    hl.window_rule(r)
end

-- ─────────────────────────────────────────────────────────────
-- Terminal
-- ─────────────────────────────────────────────────────────────

rule("float-kitty", { class = "^kitty$" }, {
    float = true,
    size = "1000 700",
    center = true,
})

-- ─────────────────────────────────────────────────────────────
-- File manager
-- ─────────────────────────────────────────────────────────────

rule("float-thunar", { class = "^(thunar|Thunar)$" }, {
    float = true,
    size = "1100 750",
    center = true,
})

-- ─────────────────────────────────────────────────────────────
-- Browser / Picture-in-Picture
-- ─────────────────────────────────────────────────────────────

rule("pip-browser-en", { title = "^Picture-in-Picture$" }, {
    float = true,
    pin = true,
    size = "480 270",
    move = "100%-500 100%-300",
})

rule("pip-browser-sv", { title = "^Bild-i-bild$" }, {
    float = true,
    pin = true,
    size = "480 270",
    move = "100%-500 100%-300",
})

-- ─────────────────────────────────────────────────────────────
-- Image viewer
-- ─────────────────────────────────────────────────────────────

rule("float-loupe", { class = "^(org\\.gnome\\.Loupe|loupe)$" }, {
    float = true,
    size = "1000 700",
    center = true,
})

rule("float-image-viewer-title", { title = "^Image Viewer$" }, {
    float = true,
    size = "1000 700",
    center = true,
})

-- ─────────────────────────────────────────────────────────────
-- VS Code
-- ─────────────────────────────────────────────────────────────

rule("size-code", { class = "^(Code|code|code-oss)$" }, {
    float = true,
    size = "1400 900",
    center = true,
})

-- ─────────────────────────────────────────────────────────────
-- Stremio
-- ─────────────────────────────────────────────────────────────

rule("size-stremio", { class = "^(com\\.stremio\\.stremio|stremio|Stremio)$" }, {
    float = true,
    size = "1400 900",
    center = true,
})

-- ─────────────────────────────────────────────────────────────
-- Steam
-- ─────────────────────────────────────────────────────────────
-- Steam main client often uses steamwebhelper, not only steam/Steam.

rule("float-steam-main", {
    class = "^(steam|Steam|steamwebhelper)$",
    title = "^(Steam|Steam Client Bootstrapper)$",
}, {
    float = true,
    size = "1400 900",
    center = true,
    suppress_event = "maximize",
})

rule("float-steam-settings", {
    class = "^(steam|Steam|steamwebhelper)$",
    title = ".*(Settings|Steam Settings|Friends List|Properties).*",
}, {
    float = true,
    size = "1000 700",
    center = true,
    suppress_event = "maximize",
})
-- ─────────────────────────────────────────────────────────────
-- Audio control
-- ─────────────────────────────────────────────────────────────

rule("float-pavucontrol", { class = "^pavucontrol$" }, {
    float = true,
    size = "900 600",
    center = true,
})

-- ─────────────────────────────────────────────────────────────
-- Compatibility / fixes
-- ─────────────────────────────────────────────────────────────

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.window_rule({
    name = "move-hyprland-run",
    match = {
        class = "hyprland-run",
    },
    move = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name = "suppress-maximize-events",
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})