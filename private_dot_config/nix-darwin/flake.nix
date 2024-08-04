{
  description = "@dalvpv macOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = [ 
        pkgs.chezmoi

        pkgs.fish
        pkgs.starship

        pkgs.vim
        pkgs.neovim
        pkgs.zellij
        pkgs.git

        pkgs.sketchybar
        pkgs.jankyborders
        pkgs.yabai
        pkgs.skhd

        pkgs.nodejs_22
        pkgs.perl
        pkgs.lua5_4
        pkgs.rustup
        pkgs.ruby_3_3
        pkgs.cmake
        pkgs.maven

        pkgs.zoxide
        pkgs.bat
        pkgs.fzf
        pkgs.gh
        pkgs.jq
        pkgs.lf
        pkgs.delta
        pkgs.so
        pkgs.neofetch
        pkgs.fd

        pkgs.ansible
        pkgs.wget
        pkgs.ncdu
        pkgs.nmap
        pkgs.bitwarden-cli
        pkgs.inetutils
        pkgs.ripgrep

        pkgs.localsend
        pkgs.kitty
      ];

      services.nix-daemon.enable = true;

      services.sketchybar.enable = true;
      services.yabai.enable = true;
      services.skhd.enable = true;
      # nix.package = pkgs.nix;

      nix.settings.experimental-features = "nix-command flakes";

      programs.zsh.enable = true;
      programs.fish.enable = true;

      security.pam.enableSudoTouchIdAuth = true;

      system.defaults = {
        finder.AppleShowAllExtensions = true;
        finder.AppleShowAllFiles = true;
        finder.CreateDesktop = false;
        finder.FXEnableExtensionChangeWarning = false;

        dock.autohide = true;
        dock.autohide-delay = 0.05;
        dock.tilesize = 16;
      };

      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 4;

      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#MacBook-Air-Vladislav-2
    darwinConfigurations."MacBook-Air-Vladislav-2" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    darwinPackages = self.darwinConfigurations."MacBook-Air-Vladislav-2".pkgs;
  };
}
