# SolidCraft (tangency-labs) — parametric 3D CAD in pure Rust, pinned to
# v0.15.0. Separate from the storytold suite; the flake feeds src via an
# input (solidcraft-src). Runtime stack mirrors the storytold packages:
# binaries link glibc/libgcc, dlopen the rest (libdbus from dbus.lib!).
{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  autoPatchelfHook,
  makeWrapper,
  xorg,
  alsa-lib,
  dbus,
  libGL,
  vulkan-loader,
  wayland,
  libxkbcommon,
}:

rustPlatform.buildRustPackage rec {
  pname = "solidcraft";
  version = "0.15.0";

  src = fetchFromGitHub {
    owner = "tangency-labs";
    repo = "solidcraft";
    rev = "fa691707c224cae580c42201ed3a22d5e4b8c716"; # v0.15.0 (2026-10-17)
    hash = "sha256-8R3j1s7vxyOxrOnjcLmzkmRObpifGj7NzOGzGuA4OU0=";
  };

  # Zero git deps in the lock; [patch.crates-io] path entries are in-tree.
  cargoLock.lockFile = "${src}/Cargo.lock";

  cargoBuildFlags = [
    "-p"
    "solidcraft"
    "-p"
    "solidcraft-cli"
  ];
  cargoInstallFlags = [
    "-p"
    "solidcraft"
    "-p"
    "solidcraft-cli"
  ];
  doCheck = false;

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
  ];
  buildInputs = [
    alsa-lib
    stdenv.cc.cc.lib
  ];
  runtimeDependencies = [
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

  postInstall = ''
    install -Dm644 $src/assets/platforms/linux/ai.storyteller.solidcraft.desktop \
      $out/share/applications/ai.storyteller.solidcraft.desktop
    install -Dm644 $src/assets/platforms/linux/ai.storyteller.solidcraft.mime.xml \
      $out/share/mime/packages/ai.storyteller.solidcraft.xml
    for size in 16 24 32 48 64 128 256 512; do
      icon=$out/share/icons/hicolor/''${size}x''${size}/apps/ai.storyteller.solidcraft.png
      mkdir -p "$(dirname "$icon")"
      install -m644 $src/assets/icons/app/linux/exports/hicolor/''${size}x''${size}/apps/ai.storyteller.solidcraft.png "$icon"
    done
  '';

  postFixup = ''
    for bin in $out/bin/*; do
      wrapProgram "$bin" \
        --set-default XDG_DATA_DIRS "$out/share:/run/opengl-driver/share:/usr/local/share:/usr/share"
    done
  '';

  meta = {
    description = "SolidCraft: open-source parametric 3D CAD app, built from source";
    homepage = "https://github.com/tangency-labs/solidcraft";
    license = with lib.licenses; [
      mit
      asl20
    ];
    mainProgram = "solidcraft";
    platforms = lib.platforms.linux;
  };
}
