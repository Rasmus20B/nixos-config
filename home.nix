{ config, pkgs, lib, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.

  home.username = "merimak";
  home.homeDirectory = "/home/merimak";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    cargo
    clang
    pkgs.waybar
    rofi-wayland
    fastfetch

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

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/merimak/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;
    shellAliases = {
     ll = "ls -l";
     v = "nvim";
    };
  };

  programs.kitty.enable = true;

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

  programs.git = {
    enable = true;
    userName = "JT";
    userEmail = "jmtateossian50b@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      "$terminal" = "kitty";
      "$mod" = "SUPER";
      bind = [
	  "$mod, Q, exec, kitty"
	  "$mod, S, exec, rofi -show drun -show-icons"

	  "$mod, h, movefocus, l"
	  "$mod, j, movefocus, d"
	  "$mod, k, movefocus, u"
	  "$mod, l, movefocus, r"

	  "{$mod}SHIFT, h, movewindow, l"
	  "{$mod}SHIFT, j, movewindow, d"
	  "{$mod}SHIFT, k, movewindow, u"
	  "{$mod}SHIFT, l, movewindow, r"

	  "$mod, 1, workspace, 1"
	  "$mod, 2, workspace, 2"
	  "$mod, 3, workspace, 3"
	  "$mod, 4, workspace, 4"
	  "$mod, 5, workspace, 5"
	  "$mod, 6, workspace, 6"
	  "$mod, 7, workspace, 7"
	  "$mod, 8, workspace, 8"
	  "$mod, 9, workspace, 9"

	  "{$mod}SHIFT, 1, movetoworkspace, 1"
	  "{$mod}SHIFT, 2, movetoworkspace, 2"
	  "{$mod}SHIFT, 3, movetoworkspace, 3"
	  "{$mod}SHIFT, 4, movetoworkspace, 4"
	  "{$mod}SHIFT, 5, movetoworkspace, 5"
	  "{$mod}SHIFT, 6, movetoworkspace, 6"
	  "{$mod}SHIFT, 7, movetoworkspace, 7"
	  "{$mod}SHIFT, 8, movetoworkspace, 8"
	  "{$mod}SHIFT, 9, movetoworkspace, 9"
      ];

      exec-once = [
	"waybar &"
	"pipewire &"
	"pipewire-pulse &"
	"dunst"
      ];
    };
  };
}
