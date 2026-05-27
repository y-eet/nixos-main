{ username, pkgs, ... }:
{
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "render"
      "input"
      "gamemode"
    ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
