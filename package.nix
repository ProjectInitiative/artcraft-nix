# One storytold app at one pinned version, built from its upstream source.
#
# Every one of these workspaces vendors storytold forks (egui/winit,
# craft-libs, media crates, ...) via [patch.crates-io]:
#   - cargoLock.outputHashes pins each git checkout (passed from flake.nix)
#   - Cargo.toml keeps patch lines the lock marks [[patch.unused]] (the full
#     egui family); cargo still validates those patch locations during
#     --offline builds, but fetchcargo cannot vendor crates outside
#     [[package]] — so postPatch strips the dead lines.
#   - craft-libs workspace manifests need cargo >= 1.96; the flake pins the
#     official rust 1.99.0 toolchain (dotfiles' nixpkgs-26.05 cargo is 1.95).
#
# Runtime: the binaries link only glibc/libgcc/alsa (dlopen everything else),
# so the platform stack goes on RUNPATH via runtimeDependencies (artcraft
# pattern). NOTE libdbus lives in dbus.lib, NOT dbus.out — dlopen()ing it
# needs the lib output on the RUNPATH (rfd's xdg-desktop-portal backend).
# The GUIs preflight with `ldconfig -p` (cannot see the RUNPATH) and look
# for a <BIN>_SKIP_LIB_CHECK env var, set via wrapProgram when present.
{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  makeRustPlatform,
  rust-bin,
  pkg-config,
  autoPatchelfHook,
  makeWrapper,
  xorg,
  alsa-lib,
  dbus,
  libGL,
  vulkan-loader,
  wayland,
  libxkbcommon,
  # app identity + per-app release data (from flake.nix)
  name,
  version,
  src,
  rev,
  date,
  outputHashes ? { },
  unusedPatches ? { },
  description ? null,
}:

let
  # cargo >= 1.96 for the craft-* crates; 1.99.0 is what upstream CI uses.
  craftRustPlatform = makeRustPlatform {
    cargo = rust-bin.stable."1.99.0".minimal;
    rustc = rust-bin.stable."1.99.0".minimal;
  };

  # dlopen()ed runtime stack. dbus.lib (not dbus.out) carries libdbus-1.
  runtimeLibs = [
    dbus.lib
    libGL
    vulkan-loader
    wayland
    libxkbcommon
    xorg.libX11
    xorg.libxcb
    xorg.libXcursor
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libXext
  ];
in
craftRustPlatform.buildRustPackage {
  pname = name;
  inherit version src;

  cargoLock.lockFile = "${src}/Cargo.lock";
  cargoLock.outputHashes = outputHashes;

  cargoBuildFlags = [
    "-p"
    name
    "-p"
    "${name}-cli"
  ];
  cargoInstallFlags = [
    "-p"
    name
    "-p"
    "${name}-cli"
  ];
  doCheck = false; # `cargo xtask ci` is upstream's gate (wasm target + GPU)

  env = {
    "${lib.toUpper (builtins.replaceStrings [ "-" ] [ "_" ] name)}_BUILD_SHA" = rev;
    "${lib.toUpper (builtins.replaceStrings [ "-" ] [ "_" ] name)}_BUILD_DATE" = date;
  };

  # Strip [[patch.unused]] [patch.crates-io] lines (see header).
  postPatch = lib.optionalString (unusedPatches != { }) (
    lib.concatStrings (
      lib.mapAttrsToList (_v: crate: ''
        sed -i '/^${crate} = { git = "https:\/\/github.com\/storytold\//d' Cargo.toml
      '') unusedPatches
    )
  );

  nativeBuildInputs = [
    pkg-config
    autoPatchelfHook
    makeWrapper
  ];
  buildInputs = [
    alsa-lib
    stdenv.cc.cc.lib
  ];
  runtimeDependencies = runtimeLibs;

  # Desktop entry, mime XML, and the pre-rendered hicolor icons all ship in
  # the source tree (packaging/linux + assets/app-icon) — install them so the
  # GUI shows up in app launchers instead of CLI-only installs.
  postInstall = ''
    if [ -d $src/packaging/linux ]; then
      install -Dm644 $src/packaging/linux/ai.storyteller.${name}.desktop \
        $out/share/applications/ai.storyteller.${name}.desktop
      install -Dm644 $src/packaging/linux/ai.storyteller.${name}.mime.xml \
        $out/share/mime/packages/ai.storyteller.${name}.xml
      for icon in $src/assets/app-icon/hicolor/*/apps/ai.storyteller.${name}.png; do
        size=$(basename $(dirname $(dirname $icon)))
        iconDir=$out/share/icons/hicolor/$size/apps
        mkdir -p "$iconDir"
        install -m644 "$icon" "$iconDir/"
      done
    fi
  '';

  postFixup = ''
    for bin in $out/bin/*; do
      var="$(basename "$bin" | tr 'a-z-' 'A-Z_')_SKIP_LIB_CHECK"
      if grep -qa "$var" "$bin"; then
        wrapProgram "$bin" --set-default "$var" 1
      fi
    done
  '';

  meta = {
    description = if description == null then "storytold ${name}, built from source" else description;
    homepage = "https://github.com/storytold/${name}";
    license = with lib.licenses; [
      mit
      asl20
    ];
    mainProgram = name;
    platforms = lib.platforms.linux;
  };
}
