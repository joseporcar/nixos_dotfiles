{ config, pkgs, ... }:
{
    imports =[ 
        ./hardware-configuration.nix
        ./../../nixos/hyprland.nix
        ./../../nixos/programs.nix
    ];

    # Bootloader.
    boot.loader.grub = {
        enable = true;
        devices = ["nodev"];
        efiSupport = true;
        useOSProber = true;
    };
    boot.loader.efi.canTouchEfiVariables = true;
    boot.supportedFilesystems = [ "ntfs" "exfat" ];
    boot.kernelParams = [ "usbcore.autosuspend=-1" ];

    networking.hostName = "pcpronix"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Enable networking
    networking.networkmanager = {
        enable = true;
    };
    networking.firewall.checkReversePath = "loose";
    # Set your time zone.
    time.timeZone = "Europe/Amsterdam";
    # Bluetooth
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;

    services.udisks2.enable = true;
    services.udev = {
        packages = with pkgs; [
            qmk
            qmk-udev-rules # the only relevant
            qmk_hid
            via
            vial
        ]; # packages
    }; # udev
    

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "nl_NL.UTF-8";
        LC_IDENTIFICATION = "nl_NL.UTF-8";
        LC_MEASUREMENT = "nl_NL.UTF-8";
        LC_MONETARY = "nl_NL.UTF-8";
        LC_NAME = "nl_NL.UTF-8";
        LC_NUMERIC = "nl_NL.UTF-8";
        LC_PAPER = "nl_NL.UTF-8";
        LC_TELEPHONE = "nl_NL.UTF-8";
        LC_TIME = "nl_NL.UTF-8";
    };

    # Configure keymap in X11
    console.useXkbConfig = true;
    services.xserver.xkb = {
        layout = "us";
        variant = "colemak_dh";
        options = "caps:backspace,grp:win_space_toggle,shift:both_capslock,terminate:ctrl_alt_bkspq";
    };

    programs.virt-manager.enable = true;
    users.groups.libvirtd.members = ["pcpronix"];
    # users.users.pcpronix.extraGroups = [ "libvirtd" ];
    virtualisation.libvirtd.enable = true;
    virtualisation.libvirtd.qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
    virtualisation.spiceUSBRedirection.enable = true; 
 
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.pcpronix = {
        isNormalUser = true;
        description = "Jose Porcar";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
        kitty
        git
        killall
        eduvpn-client
        
    ];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };
    programs.firefox.enable = true;

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;
    services = {
        upower = {
            enable = true;
            noPollBatteries = true;
        };
        power-profiles-daemon.enable = true;
        
    };
    powerManagement.enable = true;
    powerManagement.powertop.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    nix.settings.experimental-features = ["nix-command" "flakes"];
    system.stateVersion = "25.11"; # Did you read the comment?

}
