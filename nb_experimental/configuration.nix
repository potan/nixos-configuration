# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs
 ,  ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
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

  environment.variables = {
      EDITOR = pkgs.lib.mkOverride 0 "vim";
  };

#  nixpkgs.config.vim.perl = true;
  nixpkgs.config.vim.python = true;

  nixpkgs.config.android_sdk.accept_license = true;
  nixpkgs.config.allowUnfree = true;
#  nixpkgs.config.allowBroken = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bash
    binutils
    findutils
    unzip
#    vim
#    vim_configurable
    perl
    python  # for vim
    python37  # for vim
    python37Packages.pip
    python37Packages.setuptools
    python37Packages.sexpdata
    python37Packages.websocket_client
    (
        with import <nixpkgs> {};

#        vim_configurable.customize {
#            # Specifies the vim binary name.
#            # E.g. set this to "my-vim" and you need to type "my-vim" to open this vim
#            # This allows to have multiple vim packages installed (e.g. with a different set of plugins)
#            name = "vim";
#            vimrcConfig.customRC = ''
#               # Here you can specify what usually goes into `~/.vimrc` 
#               syntax enable
#            '';
#        }

        vim_configurable.override(oldAttrs: 
          oldAttrs // {
            python = python37;
            pythonSupport = true;
            perlSupport = true;
            tclSupport = true;
          }
        )
    )
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
    gradle gradle-completion
    julia_11
#    haskellPackages.jupyter
    jupyter
    ant
    jdk11
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
#    yi haskellPackages.yi-language haskellPackages.yi
    rustup
#    haskellPackages.modelicaparser
##    inferno
    irods
#    irods-icommands
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

##    androidndk
    android-studio
    android-udev-rules
    android-file-transfer
    apktool
    adb-sync
    adbfs-rootless
    abootimg
    imgpatchtools
    gnirehtet

    ats
    ats2
    haskellPackages.ats-pkg
#    haskellPackages.ats-setup
#    haskellPackages.ats-storable
#    haskellPackages.c2ats
    maude
    qemu
    sbcl
    haskellPackages.xmonad haskellPackages.xmobar
    nip2
    libreoffice
#    telegram-cli
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
##    haskellPackages.Agda
    rakudo
    unison-ucm
#    aliceml
#    haskellPackages.ivory
#    haskellPackages.ivory-examples
#    haskellPackages.ion

    vimHugeX
    protobuf
    haskellPackages.BNFC
#    haskellPackages.BNFC-meta
    jflex

    evince
    leiningen
    ocamlPackages.camlp5
    coqPackages.mathcomp
    coqPackages.ssreflect
    coqPackages.paramcoq
    coqPackages.coqhammer
    coqPackages.mathcomp-ssreflect
    coqPackages.mathcomp-analysis
    coqPackages.QuickChick
    ocamlPackages.elpi
    prooftree
    emacsPackages.proofgeneral_HEAD
    why3
#    haskellPackages.why3
    z3
#    haskellPackages.z3
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
    pkgconfig
    pkgconfigUpstream
    libsodium
    units
    bc
    bcal
    pgcli
    smlnj
    manticore
    haskellPackages.cml
#    haskellPackages.sync
    maven
    glibc
    exfat
    fatrace
    file
    locale
    glibcLocales
    libatomic_ops
    libstdcxx5
    patchelf
    slack
    skypeforlinux
    discord
    zoom-us
    refind
    torsocks
    tor
    tor-arm
    privoxy
    usb-modeswitch
    usb-modeswitch-data
    ripgrep
    mercurial
    tectonic
    pygmentex
    texlive.combined.scheme-full
    scala
    clips
    scalafix
    nodejs
    elmPackages.elm
    exa
    corefonts
    liberastika
#    liberation-sans-narrow
    liberation_ttf
    vistafonts-chs
    texlive.combined.scheme-full
    fontconfig
    freetype
    lmodern
    ghostscript
    alt-ergo
    cvc4
    boolector
#    monosat
#    opensmt
    veriT
    yices
    killall
    ntp
    gnumake
    git-lfs
    haxe
    neko
    leela
    gecode
    opam
    ocaml
    or-tools
    framac
    vmfs-tools
    openvswitch
    eprover
    prover9
    veriT
    metamath
    abella
    qiv
    hwinfo
    gnome3.cheese
    imagemagick7Big
    unrar
    alloy
    fbreader
    sigil
    obs-studio
    wxcam
    libjpeg
    libjpeg_original
    libpng12
    gimp
    shutter
    kcharselect
    wl-clipboard
    xclip
    yank
    xen

    graphviz
    gephi
    ocamlPackages.ocamlgraph
#    haskellPackages.xdot
    yed
#    haskellPackages.dot2graphml

    autogen
    autoconf
    automake
    SDL
    SDL_gfx
    SDL_ttf
    SDL_mixer

    ktorrent
    xorg.imake

    fuse
    appimage-run
    appimagekit
    cabal-install
    gperf
    readline70
    gflags
    m4
    nspr
    xorg.libXi
    qt5.full

    cachix

    celf
    clasp
    clean
#    haskellPackages.copilot
    haskellPackages.CPL
#    haskellPackages.Dao
    eff
    es
    fira-code
    fstar
    gappa
    golly
#    haskellPackages.GPipe
#    hol
    j
    kona
    mercury
#    metaocaml_3_09
    mill
    netlogo
    noweb
    picat
    pure
    puredata
#    purescript
#    coqPackages.ltac2
    urweb

    postgresql
    postgresqlPackages.postgis
    virtuoso7

    pciutils
    lshw
    matrix-synapse
    purple-matrix
    purple-discord
    purple-facebook
    telegram-purple
    empathy
    pidgin
    ag

# for k-framework
    stack
    cmake
    clang_7
    libffi
    boost
    jemalloc
    libyaml
    llvm_7
  ];

  virtualisation = {
#    libvirtd.enable = false;
    docker.enable = true;
#    virtualbox.host.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.tor.enable = true;
  services.tor.client.enable = true;
  services.tor.enableGeoIP = true;
  services.neo4j.enable = true;
  services.postgresql.enable = true;
#  services.virtuoso7.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  services.xserver.libinput.enable = true;
  services.xserver.libinput.tapping = false;

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.guest = {
  #   isNormalUser = true;
  #   uid = 1000;
  # };

  system.autoUpgrade.enable = true;
  system.autoUpgrade.channel = https://nixos.org/channels/nixos-19.09;
  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?

}
