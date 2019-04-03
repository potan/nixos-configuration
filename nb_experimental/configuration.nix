# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "pmnix"; # Define your hostname.
  networking.networkmanager.enable = true;
#  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
#  networking.wireless.networks = {
#    WAVESPLATFORM = {
#     psk = "XXX";
#    };
#  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bash
    binutils
    findutils
    unzip
    vim
    wget
    htop
    hicolor_icon_theme
    inetutils
    efibootmgr
    openvpn
    ntfs3g
    bridge-utils
    iw
    wirelesstools
    iptables
    tunctl

    gtk_engines

    docker
    
    networkmanager
    networkmanagerapplet
    networkmanager_openvpn
    modemmanager
    usbutils
    avahi

    roxterm
    btrfs-progs
    haskellPackages.btrfs
    btrfs-dedupe
    ghc
    sbt sbt-extras
    julia_11
#    haskellPackages.jupyter
    jupyter
    ant
    jdk10
    visualvm
    coq
    prooftree
    ott
    coq2html
    emacs
    cargo-update
    cargo
    gnuradio-with-packages
    idris
    yi haskellPackages.yi-language haskellPackages.yi
    rustup
#    haskellPackages.modelicaparser
    inferno
    irods
    irods-icommands
    powershell
#    haskellPackages.roshask
#    haskellPackages.rosmsg
#    haskellPackages.rosmsg-bin
    haskellPackages.rospkg
    transmission
    isabelle
    hyperrogue
    mplayer smplayer
    git gitfs
    apt dpkg
    androidndk
    ats
#    haskellPackages.ats-pkg
#    haskellPackages.ats-setup
#    haskellPackages.ats-storable
#    haskellPackages.c2ats
    maude
    qemu
    sbcl
    haskellPackages.xmonad haskellPackages.xmobar
    nip2
    libreoffice
    telegram-cli
    telegram-purple
    tdesktop
#    haskellPackages.haskore-supercollider
    haskellPackages.hsc3
    faust
    supercollider
    firefox
    bvi
    vimPlugins.elm-vim
    vimPlugins.ensime-vim
    vimPlugins.idris-vim
    vimPlugins.julia-vim
    vimPlugins.rust-vim
    vimPlugins.vim-addon-nix
    vimPlugins.vim-hoogle
    vimPlugins.vim-solidity
    vimPlugins.vim-toml
    haskellPackages.Agda

    vimHugeX
    protobuf
    evince
    leiningen
    coqPackages.mathcomp
    emacsPackages.proofgeneral_HEAD
    why3
#    haskellPackages.why3
    z3
    haskellPackages.z3
    minizinc
#    haskellPackages.haskelzinc
    tlaps
    tlaplus
    tlaplusToolbox
    mosquitto
    apacheKafka
    neo4j
    virtuoso7
    apache-jena
    apache-jena-fuseki
    cayley
#    haskellPackages.gogol-kgsearch
    swiProlog
#    haskellPackages.lojysamban
    shared_desktop_ontologies
    spark
    gcc8
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.guest = {
  #   isNormalUser = true;
  #   uid = 1000;
  # };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09"; # Did you read the comment?

}
