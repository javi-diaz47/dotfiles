{
  pkgs,
  pkgs-stable,
  inputs,
  ...
}: {
  imports = [
    ./modules/git.nix
    ./modules/gtk.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jdiaz";
  home.homeDirectory = "/home/jdiaz";

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
  #
  #  programs = {
  #      fish = {
  #        enable = true;
  #        plugins = [
  #          { name = "z"; src = pkgs.fishPlugins.z.src; }
  #          { name = "tide"; src = pkgs.fishPlugins.tide.src; }
  #          { name = "fzf"; src = pkgs.fishPlugins.fzf.src; }
  #        ];
  #      };
  #  };
  #
  #programs.nixvim.enable = true;
  #programs.nixvim.defaultEditor = true;

  home.packages = [
    #pkgs.fish
    inputs.nixvim.packages."${pkgs.system}".default

    pkgs.zoxide

    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    inputs.zen-browser.packages."${pkgs.system}".default

    pkgs.rose-pine-gtk-theme
    pkgs-stable.rose-pine-cursor

    pkgs.openrefine
    pkgs.weka

    pkgs.zotero

    pkgs.spotify
    pkgs.vscode
    pkgs.google-chrome

    pkgs-stable.python311Packages.orange3

    pkgs.rofi-wayland

    pkgs.unrar

    (pkgs.writeShellScriptBin "wal-swww" ''
      ~/.config/hypr/scripts/random-wal-swww.sh
    '')

    (pkgs.writeShellScriptBin "power" ''
      bash ~/.config/hypr/scripts/power.sh
    '')

    (pkgs.writeShellScriptBin "wal-picker-swww" ''
      bash ~/.config/rofi/scripts/wal-picker.sh
    '')

    (pkgs.writeShellScriptBin "set-cursor-hyprland" ''
      hyprctl setcursor rose-pine-hyprcursor 28

      gsettings set org.gnome.desktop.interface cursor-theme 'BreezeX-RosePine-Linux'
      gsettings set org.gnome.desktop.interface cursor-size 30
    '')

    pkgs.vlc

    # To use vdhcoapp
    # you should run vdhcoapp install once
    pkgs.vdhcoapp

    pkgs.fzf

    pkgs.unzip

    # Nixvim
    #pkgs.vimPlugins.friendly-snippets

    # openrefine
    # weka
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

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
  #  /etc/profiles/per-user/jdiaz/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    ##EDITOR = "neovim";
  };

  # Let Home Manager install and manage itself.
  #programs.rofi = {
  #  enable = true;
  #  package = pkgs.rofi-wayland;
  #  plugins = [pkgs.rofi-emoji pkgs.rofi-calc];
  #};
  #
}
