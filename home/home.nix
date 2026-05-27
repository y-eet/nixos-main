{ username, pkgs, ... }:
{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

  programs.kitty = {
    enable = true;
    settings = {
      font_size = "11.0";
      window_padding_width = 12;
      confirm_os_window_close = 0;
      copy_on_select = "yes";
      strip_trailing_spaces = "smart";
      tab_bar_style = "powerline";
      tab_bar_align = "left";
      shell_integration = "enabled";
    };
    keybindings = {
      "ctrl+shift+n" = "new_window";
      "ctrl+t" = "new_tab";
      "ctrl+plus" = "change_font_size all +1.0";
      "ctrl+minus" = "change_font_size all -1.0";
      "ctrl+0" = "change_font_size all 0";
    };
  };

  home.file.".config/hypr/hyprland.lua".source = ./hypr/hyprland.lua;
  home.file.".config/hypr/modules".source = ./hypr/modules;
  home.file.".config/hypr/scripts/screenshot-area.sh" = {
    source = ./hypr/scripts/screenshot-area.sh;
    executable = true;
  };
}
