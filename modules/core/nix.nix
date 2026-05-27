{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
    warn-dirty = false;

    # nix-gaming cache; helps with gaming-related packages when available.
    substituters = [ "https://nix-gaming.cachix.org" ];
    trusted-public-keys = [ "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" ];
  };

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 5";
    };
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [ stdenv.cc.cc zlib fuse3 icu nss openssl curl expat ];
  };
}
