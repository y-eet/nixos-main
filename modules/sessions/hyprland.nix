{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  # Simple graphical login to start with.
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GTK_USE_PORTAL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };

  environment.systemPackages = with pkgs; [
    wayland-utils
    wl-clipboard
    cliphist
    grim
    slurp
    swappy
    hyprpicker
    hyprlock
    hypridle
    hyprpaper
    mako
    libnotify
    playerctl
    brightnessctl
    networkmanagerapplet
  ];
}
