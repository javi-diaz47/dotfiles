# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi"; 
  #Define on which hard drive you want to install Grub. 
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "devi"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/Bogota";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
#  services.xserver = {
#    enable = true;
#    videoDrivers = ["nvidia"];
#    desktopManager = {
#      xfce.enable = true;
#    };
#    displayManager = {
#      sddm = {
#        enable = true;
#        wayland.enable = true;
#        theme = "where_is_my_sddm_theme";
#      };
#    };
#  };

  services.xserver.enable = true;
  
  services.xserver.desktopManager = {
      xfce.enable = true;
  };

 services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "where_is_my_sddm_theme";
    };
  };

  
  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jdiaz = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "networkmanager" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
  #     tree
    ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };


  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";

    STEAM_EXTRA_COMPAT_TOOLS_PATHS = 
      "/home/jdiaz/.steam/root/compatibilitytools.d";
  };
  
  
  hardware.graphics.enable = true;
  hardware.nvidia.modesetting.enable = true;
  #hardware = {
      #opengl.enable = true; -> graphics.enable
  #    graphics.enable = true;
      #graphics.enable32Bit = true;
      #opengl.driSupport = true;
      #opengl.driSupport32Bit = true;
  #    nvidia.modesetting.enable = true;
      #nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  #};

  specialisation = {
    gaming.configuration = {
      system.nixos.tags = ["Gaming"];
      
      services.xserver.videoDrivers = ["nvidia"];
      
      hardware.graphics.enable32Bit = true;
      hardware.nvidia.modesetting.enable = true;

    };
  };
  
  
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  #
  
  programs.fish.enable = true;
  environment.systemPackages = with pkgs; [
    fishPlugins.autopair

    mangohud
    protonup

    home-manager

    kitty

    waybar

    swww
    pywal

    wl-clipboard

    wlogout
    hyprlock

    hyprcursor

    dunst
    libnotify

    git
   
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.

    fastfetch
    htop
    dwt1-shell-color-scripts
    cava
    lsd

  #   wget
  ];

  environment.variables.EDITOR = "neovim";

# Fonts
  fonts.packages = with pkgs; [
    cascadia-code
    nerdfonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    liberation_ttf
    fira-code-nerdfont
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?
 
}

