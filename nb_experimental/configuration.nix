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
  boot.binfmt.emulatedSystems = [
    "wasm32-wasi" "wasm64-wasi"
   # "x86_64-windows"
   # "aarch64-linux"
   #  "riscv64-linux"
   #  "riscv32-linux"
  ];

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
#    consoleFont = "Lat2-Terminus16";
#    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  console.font = "Lat2-Terminus16";
  console.keyMap = "us";

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  environment.variables = {
      EDITOR = pkgs.lib.mkOverride 0 "vim";
  };

#  nixpkgs.config.vim.perl = true;
  nixpkgs.config.vim.python = true;

  nixpkgs.config.allowUnsupportedSystem = true;
  nixpkgs.config.android_sdk.accept_license = true;
  nixpkgs.config.allowUnfree = true;
#  nixpkgs.config.allowBroken = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bash
    nushell
    nushellPlugins.formats
    nushellPlugins.gstat
    nushellPlugins.net
#    nushellPlugins.polars
    nushellPlugins.query
    zsh
    fish
    binutils
    findutils
    unzip
#    vim
#    vim_configurable
    perl
    python  # for vim
    virtualenv
    python313Packages.uv
#    migrate-to-uv
    ruby
#    python37Packages.setuptools
#    python37Packages.sexpdata
#    python37Packages.websocket_client
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
#            python3 = python37;
            pythonSupport = true;
            perlSupport = true;
            tclSupport = true;
          }
        )
    )
    helix
#    radicle-node
    wget
    htop
    hicolor-icon-theme
    inetutils
    osquery
    efibootmgr
    openvpn
#    wg-bond
    wg-netmanager
    wireguard-tools
    xray
    v2raya
    zbar
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
    networkmanager-openvpn
    networkmanager-openconnect
    modemmanager
    usbutils
    avahi

    roxterm
    btrfs-progs
#    haskellPackages.btrfs
    btrfs-heatmap
#    btrfs-dedupe
    gparted parted

    fennel
    jq
    xq
    tree-sitter
    tree-sitter-grammars.tree-sitter-c
    tree-sitter-grammars.tree-sitter-cpp
    tree-sitter-grammars.tree-sitter-elm
    tree-sitter-grammars.tree-sitter-erlang
#    tree-sitter-grammars.tree-sitter-gleam
    tree-sitter-grammars.tree-sitter-graphql
    tree-sitter-grammars.tree-sitter-haskell
    tree-sitter-grammars.tree-sitter-html
    tree-sitter-grammars.tree-sitter-http
    tree-sitter-grammars.tree-sitter-javascript
    tree-sitter-grammars.tree-sitter-json
    tree-sitter-grammars.tree-sitter-julia
#    tree-sitter-grammars.tree-sitter-koka
    tree-sitter-grammars.tree-sitter-latex
    tree-sitter-grammars.tree-sitter-llvm
    tree-sitter-grammars.tree-sitter-make
    tree-sitter-grammars.tree-sitter-markdown
    tree-sitter-grammars.tree-sitter-markdown-inline
    tree-sitter-grammars.tree-sitter-nu
    tree-sitter-grammars.tree-sitter-ocaml
    tree-sitter-grammars.tree-sitter-ocaml-interface
    tree-sitter-grammars.tree-sitter-proto
    tree-sitter-grammars.tree-sitter-r
    tree-sitter-grammars.tree-sitter-regex
    tree-sitter-grammars.tree-sitter-ruby
    tree-sitter-grammars.tree-sitter-rust
    tree-sitter-grammars.tree-sitter-scala
    tree-sitter-grammars.tree-sitter-scheme
    tree-sitter-grammars.tree-sitter-sparql
    tree-sitter-grammars.tree-sitter-sql
    tree-sitter-grammars.tree-sitter-supercollider
    tree-sitter-grammars.tree-sitter-toml
    tree-sitter-grammars.tree-sitter-typst
    tree-sitter-grammars.tree-sitter-verilog
    tree-sitter-grammars.tree-sitter-yaml
    tree-sitter-grammars.tree-sitter-zig
    ttags
    vimPlugins.cmp-treesitter
    diffsitter
    ghc
#?    haskell.compiler.ghcjs
    sbt sbt-extras
    gradle gradle-completion
    bleep
    julia
#    haskellPackages.jupyter
    jupyter
    ant
    jdk
    visualvm
    twelf
    teyjus
    abella
    #rocq-core
    coq
    #rocqPackages.rocq-elpi
    coqPackages.coq-elpi
    coqPackages.coqide
    prooftree
    ott
    coq2html
    emacs
    zed-editor
    wily
    cargo-update
    cargo
    cargo-generate
#    codeql
#    gnuradio-with-packages
    gnuradio
    gqrx
    arduino-cli
    audacity
    coccinelle
#    idris
    idris2
    celf
#    yi haskellPackages.yi-language haskellPackages.yi
    rustup
    wasm-pack
    wasmtime
    zig
    gleam
#    haskellPackages.modelicaparser
#    openmodelica.combined
    blender
    freecad

    plantuml
    plantuml-c4
    texlivePackages.plantuml
    archi

    workcraft

    nextpnr
    nextpnrWithGui
    verilog
    verilator
    yosys
    yosys-bluespec
#    yosys-synlig
    yosys-ghdl
    symbiyosys
    netlistsvg
#    sby
    sv-lang
#    quartus-prime-lite
    gtkwave
    bluespec
    ghdl
    aiger
    avy

    inferno
#    irods
#    irods-icommands
    powershell
    fsharp
    dotnetPackages.Nuget
#    haskellPackages.roshask
#    haskellPackages.rosmsg
#    haskellPackages.rosmsg-bin
#    haskellPackages.rospkg
    transmission_4
    isabelle
#    cedille
    form
    hyperrogue
    dwarf-fortress
    mindustry
#?    widelands
    anki

    vscode
    code-cursor
#    copilot-vim
    github-copilot-cli
#    vscode-extensions.github.copilot
#    vscode-extensions.github.copilot-chat
#    copilot-language-server

    solfege
    mplayer smplayer
    git gitfs
    darcs
    pijul
    jujutsu # gg-jj
#    apt
    dpkg
    lix
    #optinix
    mlocate
    bat
    atuin

    clingo
#    clingcon

    linuxPackages.usbip
    android-file-transfer
    scrcpy
    qtscrcpy
    dcnnt
    universal-android-debloater
    waydroid
#?    androidsdk
##    androidndk
#?    android-studio-full
#?    android-studio-tools
    cargo-ndk
    cargo-apk
    apkeditor
    android-tools
    android-udev-rules
    android-file-transfer
    apktool
    adb-sync
    adbfs-rootless
    abootimg
    imgpatchtools
    gnirehtet

    jflap
#?    ats
    ats2
#    haskellPackages.ats-pkg
#    haskellPackages.ats-setup
#    haskellPackages.ats-storable
#    haskellPackages.c2ats
    maude
    qemu
    OVMFFull
    sbcl
    clisp
    chicken
    chickenPackages_5.chickenEggs.srfi-69 chickenPackages_5.chickenEggs.srfi-1 chickenPackages_5.chickenEggs.matchable chickenPackages_5.chickenEggs.amb # metta-morph deps
    chickenPackages_5.chickenEggs.nrepl chickenPackages_5.chickenEggs.fuse
#    chickenPackages_5.chickenEggs.allegro
    chickenPackages_5.chickenEggs.z3
    scmutils
    racket
    guile
    akku
    guix
    haskellPackages.xmonad haskellPackages.xmobar
    nip2
    maxima wxmaxima
    yacas yacas-gui
    fricas
    gap-full
    giac
    sundials
    plasma5Packages.kalgebra
    galculator
    calcoo
    libreoffice
#    telegram-cli
    tdesktop
    kotatogram-desktop
#    haskellPackages.haskore-supercollider
#    haskellPackages.hsc3
    faust
    supercollider
    csound
#    postman
    newman
    grpcui
    soapui
    firefox
#    vdhcoapp
    burpsuite
    bvi
    wxhexeditor
    rehex
    bbe
    poke
    uiua
    uiua386
    vimPlugins.elm-vim
#    vimPlugins.ensime-vim
    vimPlugins.idris-vim
    vimPlugins.julia-vim
    vimPlugins.rust-vim
    vimPlugins.vim-addon-nix
    vimPlugins.vim-hoogle
    vimPlugins.vim-solidity
    vimPlugins.vim-toml
    vimPlugins.vim-scala
    vimPlugins.vim-pony
    #vimPlugins.pony-vim-syntax
    vimPlugins.purescript-vim
    vimPlugins.orgmode
    haskellPackages.Agda
    rakudo
    unison-ucm
#    aliceml
#    haskellPackages.ivory
#    haskellPackages.ivory-examples
#    haskellPackages.ion
    opencl-headers ocl-icd futhark
    #legacyPackages.x86_64-linux.frink
    ponyc
    pony-corral
    vimPlugins.vim-pony

    capnproto
    capnproto-rust
    capnproto-java
    haskellPackages.capnp
    ocamlPackages.capnp

    leo-editor
    vimHugeX
    kakoune
    kak-lsp
    fd

    protobuf
    haskellPackages.BNFC
#    haskellPackages.BNFC-meta
    jflex

    evince
    clojure
    babashka
    leiningen
    ocamlPackages.camlp5
    ocamlPackages.elpi
#    rocqPackages.mathcomp
#    rocqPackages.ssreflect
#    rocqPackages.paramcoq
#    coqPackages.coqhammer
#    rocqPackages.mathcomp-ssreflect
#    rocqPackages.mathcomp-analysis
#    coqPackages.QuickChick
#    coqPackages.ltac2
    prooftree
#    emacsPackages.proofgeneral_HEAD
    why3
#    haskellPackages.why3
    z3
#    haskellPackages.z3
    minizinc
#    haskellPackages.haskelzinc
    tlaps
    tlaplus
    tlaplusToolbox

    tamarin-prover
    proverif
    cryptoverif
    cryptominisat

    fflas-ffpack

    mosquitto
    apacheKafka
    neo4j
#    surrealdb
#    surrealist
#    virtuoso
    apache-jena
    apache-jena-fuseki

#?    welkin

    cayley
#    haskellPackages.gogol-kgsearch
    teyjus # lambda prolog
    scryer-prolog
    swi-prolog
    swi-prolog-gui
    pakcs
    souffle

#    sbagen
    gnaural

    clingo
    gringo
    clasp
    clingcon
    aspcud

#    haskellPackages.lojysamban
    shared_desktop_ontologies
#    spark
    gcc
    pkg-config
    pkg-configUpstream
    pkg-config-unwrapped
    libsodium
    units
    bc
    bcal
    pgcli
    smlnj
#?    manticore
    haskellPackages.cml
#    haskellPackages.sync
    maven
    glibc
    openssl.dev
    exfat
    fatrace
    file
    locale
    glibcLocales
    libatomic_ops
#    libstdcxx5
    patchelf
    slack
    mattermost-desktop
#    skypeforlinux
#    teams teams-for-linux
#    discord
    zoom-us
    nheko
    refind
    torsocks
    tor
#    tor-arm
    privoxy
    snowflake
    obfs4

    biglybt i2p i2pd
    #i2pd-tools
    xd

    usb-modeswitch
    usb-modeswitch-data
    ripgrep
    mercurial
    tectonic
    yodl
    openjade
#    texlivePackages.jadetex
    texlive.bin.pygmentex
    texlive.combined.scheme-full
#    texlivePackages.dot2texi
    texlivePackages.petri-nets 
    dot2tex
    fontconfig
    freetype
    lmodern
    ghostscript
    typst
    scala
    flix
    clips
    scalafix
    nodejs
    elmPackages.elm
    eza #exa
    corefonts
    liberastika
#    liberation-sans-narrow
    liberation_ttf
    vistafonts-chs
    alt-ergo
    cvc4
    boolector
#    monosat
#    opensmt
    veriT
    yices
    killall
    xorg.xkill
    xorg.xev
    ntp
    gnumake
    just
    bazel
    redo
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
    hvm
    kind2
    #bend
    qiv
    hwinfo
 #?   gnome3.cheese
    imagemagickBig
    unrar
    alloy
    #fbreader
    koreader
    logseq
    sigil
    obs-studio
    #wxcam
    guvcview  #camera
    libjpeg
    libjpeg_original
    libpng12
    gimp
    inkscape
    #shutter
#    kcharselect
    wl-clipboard
    xclip
    yank
#    xen
    wabt
#    haskellPackages.shentong
    openocd
#    eukleides
#    geogebra
#    obsidian
    logseq
    zotero
#?    emacsPackages.org-modern

    graphviz
    gephi
    ocamlPackages.ocamlgraph
#    haskellPackages.xdot
#    yed
#    haskellPackages.dot2graphml

    autogen
    autoconf
    automake
    SDL
    SDL_gfx
    SDL_ttf
    SDL_mixer
    glew

#    ktorrent
    qbittorrent
    enhanced-ctorrent
    xorg.imake

    adbfs-rootless
    fuse
    fuse3
    jmtpfs
#    supertag
    appimage-run
#    appimagekit
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
#    clean
#    haskellPackages.copilot
#    haskellPackages.CPL
#    haskellPackages.Dao
    eff ante # language with algebraic effects
    es
    fira-code
    fstar
    gappa
    golly
#    haskellPackages.GPipe
    hol
    j
    kona
#    mercury
#    metaocaml_3_09
    mill
    netlogo
    noweb
    picat
#    pure
    puredata
    purescript
    purenix
#    spago
    urweb

    dzen2
#    haskellPackages.dzen-utils
#    haskellPackages.dzen-dhall
    dhall

    pharo
    pharo-spur64
    erlang
    elixir
    ammonite

#    postgresql
#    postgresqlPackages.postgis
    sqlite

    pciutils
    lshw
    smartmontools
    matrix-synapse
    purple-matrix
    purple-discord
    purple-facebook
#    telegram-purple
#    empathy
    pidgin
    silver-searcher #ag
    unetbootin
    cargo-bootimage
    bluez
    obexfs
    obexftp
    mtpfs
    dig
    wireshark

#    bpftools
    linuxPackages.bpftrace
    linuxPackages.bcc
    gdb
    radare2
    rizin cutter
    objconv
    ghidra ghidra-extensions.ghidraninja-ghidra-scripts ghidra-extensions.sleighdevtools
    rizinPlugins.rz-ghidra

    glxinfo

    steam
    steamcmd
    colobot
    liberation-circuit

    nix-index

    ollama
    aichat

# for k-framework
    stack
    cmake
    clang
    libffi
    boost
    jemalloc
    libyaml
    llvm_18
    klee
# unstable
    # difftastic
    # weylus
  ];

  virtualisation = {
    libvirtd.enable = false;
    docker.enable = true;
#    virtualbox.host.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  nixpkgs.config.permittedInsecurePackages = [
         "olm-3.2.16" 
         "openssl-1.0.2u"
         "xen-4.10.4"
         "electron-25.9.0"
         "electron-27.3.11"
         "python3.9-mistune-0.8.4"
         "python-2.7.18.8"
         "qtwebkit-5.212.0-alpha4"
         "qbittorrent-4.6.4"
         "jujutsu-0.23.0"
       ];
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.tor.enable = true;
  services.tor.client.enable = true;
  services.tor.enableGeoIP = true;
  services.tor.settings = {
      UseBridges = true;
      ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/obfs4proxy";
#      Bridge = "obfs4 137.220.35.35:443 75B34B8458A1C93714BFF9393E09F7CBC04A2F59 cert=GglhKh0UwOjkfQPN0aH3gs8ZdnE6T4qU9uU/fmiYbJ69Dpk4nxS9o82UBnAxVZJytOulfA iat-mode=0";
#      Bridge = "obfs4 51.159.147.17:443 D1DECE3E053A78736F93EAEAC6DD1CC2377BDCBE cert=PJTCe03dH/dyZf9vVB+cwnI+ihDaYNZm6KliEYFhMPjLF4SGzSOdW+/RjsX65CF/YbcmMw iat-mode=0";
#      Bridge = "obfs4 49.13.73.142:25412 42E83EFD33F846B58CB323E0199A8DD40C97539A cert=vO5+bMqqbPa1lO4b7KuoylclszLMUh5MLL4hWPGbeojxkIsBI3QOb/ZgNY6x5etOwLytVA iat-mode=0";
#      Bridge = "obfs4 146.59.116.80:4578 0590B0FBA13005EDDF3CA21EBB0B52B6F1797A86 cert=zqttbquJuQO46uO8laQ48R3QtkvaYI/88TWJfbyxOIsFIAiN00vtcKu10V6sdUCJRcjiYQ iat-mode=0";
     # Bridge = "obfs4 195.52.161.143:5001 5A7E34DB26FC4E96C085E09E9C721703A55C63E6 cert=SyvSFZs3rb3tAgX6MG9ygmgof9AhDc1kvi225OSuUKUaxkiVmutoJKm6v0nWtoccu8KVfg iat-mode=0";
     Bridge = "obfs4 185.177.207.11:43474 ED62C18A19F60E1BE6181224185C440CDA6B1823 cert=p9L6+25s8bnfkye1ZxFeAE4mAGY7DH4Gaj7dxngIIzP9BtqrHHwZXdjMK0RVIQ34C7aqZw iat-mode=2";
  };
  services.neo4j.enable = true;
#  services.postgresql.enable = true;
#  services.virtuoso7.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  networking.extraHosts =
  ''
#  185.15.211.203 bt.t-ru.org
#  185.15.211.203 bt2.t-ru.org
#  185.15.211.203 bt3.t-ru.org
#  185.15.211.203 bt4.t-ru.org
#195.82.146.120 bt.t-ru.org
#195.82.146.121 bt2.t-ru.org
#195.82.146.122 bt3.t-ru.org
#195.82.146.123 bt4.t-ru.org
# 172.64.174.19 bt.t-ru.org
# 172.64.174.19 bt2.t-ru.org
# 172.64.174.19 bt3.t-ru.org
# 172.64.174.19 bt4.t-ru.org
  '';
  
  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
#  sound.enable = true;
#  hardware.pulseaudio.enable = true;
  services.pipewire.audio.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  hardware.enableRedistributableFirmware = true;

  # hardware.opengl.enable = true;
  # hardware.opengl.driSupport32Bit = true;
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.steam-hardware.enable = true;
  programs.steam.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "eurosign:e";

  # Enable touchpad support.
  services.libinput.enable = true;
  # services.xserver.libinput.tapping = false;
  services.libinput.touchpad.tapping = false;

  # Enable the KDE Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  #services.desktopManager.plasma6.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.guest = {
  #   isNormalUser = true;
  #   uid = 1000;
  # };

#  environment.fhs.enable = true;
#  environment.fhs.linkLibs = true;
#  environment.lsb.enable = true;
#  environment.lsb.support32Bit = true;
#environment.systemPackages = with pkgs; [ virt-manager ];
  programs.dconf.enable = true;

  system.autoUpgrade.enable = true;
  system.autoUpgrade.channel = https://nixos.org/channels/nixos-21.05;
  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking som-e soft-ware such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "20.09"; # Did you read the comment?

}
