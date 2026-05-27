{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brave
    github-desktop
    vscode
    kitty
    wofi
    thunar
    file-roller
    pavucontrol
    fastfetch
    btop
    ripgrep
    fd
    jq
    wget
    curl
    unzip
    git
    gh
  ];

  programs.dconf.enable = true;
  services.dbus.enable = true;

  programs.firefox.enable = false;
}
