{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    pkg-config
    gcc
    gnumake
    autoconf
    automake
    m4
    perl
    python3
    openssl
    ncurses
    libxslt
    fop
    libxml2
    libGL
    libGLU
    (wxGTK32.override { withWebKit = true; })
    xorg.libX11
    zlib
    libuuid
    flex
    bison
  ];

  shellHook = ''
    # Erlang configure options
    export KERL_CONFIGURE_OPTIONS="\
      --with-ssl=${pkgs.openssl.out} \
      --with-ssl-incl=${pkgs.openssl.dev} \
      --disable-hipe \
      --without-javac \
      --without-odbc"

    export ERL_AFLAGS="-kernel shell_history enabled"
    export KERL_BUILD_DOCS=yes

    # Ensure ncurses is visible to pkg-config
    export PKG_CONFIG_PATH="${pkgs.ncurses.dev}/lib/pkgconfig:$PKG_CONFIG_PATH"
    export CPPFLAGS="-I${pkgs.ncurses.dev}/include $CPPFLAGS"
    export LDFLAGS="-L${pkgs.ncurses.out}/lib $LDFLAGS"
  '';
}

