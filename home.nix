{ config, pkgs, lib, inputs, ... }:

{

  nixpkgs.config.allowUnfree = true;
  home.username = "merimak";
  home.homeDirectory = "/home/merimak";

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    # Compilers
    cargo
    gcc_latest
    clang19Stdenv
    llvm_19
    lldb_19
    pkgs.protobuf
    pkgs.protoc-gen-rust

    # Build systems
    cmake
    gnumake

    # libs
    glibc

    # Interpreters
    python3

    # Wayland Environment
    pkgs.waybar
    rofi-wayland
    fastfetch

    # AI 
    lmstudio

    # Debugging
    rr
    gdb
    pkgs.valgrind

    # Useful CLI
    file
    mlocate
    fzf
    wl-clipboard

    pavucontrol
    pamixer
    alsa-utils

    pkgs.wofi

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;
    shellAliases = {
     ll = "ls -l";
     v = "nvim";
    };
  };

  programs.kitty = {
    enable = true;
    keybindings = {
      "alt+1" = "goto_tab 1";
      "alt+2" = "goto_tab 2";
      "alt+3" = "goto_tab 3";
      "alt+4" = "goto_tab 4";
      "alt+5" = "goto_tab 5";
    };

    settings = {
      allow_remote_control = true;
    };
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-hyprland
  ];
  xdg.portal.config = {
    common = {
      default = [
	"hyprland"
      ];
    };
  };

  lib.programs.hyprland.enable = true;

  lib.programs.file.enable = true;

  lib.programs.lmstudio = {
    enable = true;
  };
  programs.git = {
    enable = true;
    userName = "JT";
    userEmail = "jmtateossian50b@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
