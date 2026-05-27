{ pkgs, inputs, ... }:
{
  imports = [ inputs.nix-gaming.nixosModules.pipewireLowLatency ];

  environment.systemPackages = with pkgs; [
    mangohud
    protonup-qt
    lutris
    heroic
    prismlauncher
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    protontricks.enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  programs.gamescope.enable = true;
  programs.gamemode.enable = true;

  services.pipewire.lowLatency = {
    enable = true;
    quantum = 64;
    rate = 48000;
  };

  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642;
  };

  networking.firewall = {
    allowedTCPPorts = [ 27036 27037 ];
    allowedUDPPorts = [ 27031 27036 ];
  };
}
