{
  description = "storytold ArtCraft suite (15 apps) + solidcraft for Nix/NixOS, built from pinned upstream source";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # Official rust toolchains: craft-* crates need cargo >= 1.96; 1.99.0 is
    # what upstream CI uses. (dotfiles' nixpkgs-26.05 cargo is 1.95.)
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs =
    {
      self,
      nixpkgs,
      rust-overlay,
    }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;

      rustPkgs = import nixpkgs {
        inherit system;
        overlays = [ rust-overlay.overlays.default ];
      };

      # One entry per app: the newest stable release, pinned to its exact
      # commit (rev == the tag commit, hash == fetchFromGitHub's NAR hash,
      # date == the tag commit date). Bump by fetching
      # github:storytold/<app>/v<new> and updating the fields.
      releases = {
        cadcraft = {
          version = "0.17.0";
          date = "2026-11-03";
          rev = "f389d6a72e3fc160ea125b4f264d68f64cbe2aba";
          hash = "sha256-Yf5bRRsvQbHdqBMScBb7qmsm18c8DSqvMx48Ab2Lli0=";
          description = "cadcraft";
          outputHashes = {
            "craft-docpath-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-fonts-build-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-i18n-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-pdf-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-ui-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-update-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-window-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "ecolor-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "eframe-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-wgpu-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-winit-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_glow-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_kittest-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "emath-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint_default_fonts-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "hayro-jbig2-0.3.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "hayro-syntax-0.7.2" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "krilla-0.8.2" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "winit-0.30.13" = "sha256-+67bk7cqhM5VHqROL3PeghmhKJvlPIxhU73ay45vaxw=";
          };
          unusedPatches = {
            "egui_demo_lib-0.37.0" = "egui_demo_lib";
            "egui_extras-0.37.0" = "egui_extras";
            "egui_inspection-0.37.0" = "egui_inspection";
            "egui_system_font_provider-0.37.0" = "egui_system_font_provider";
          };
        };
        gridcraft = {
          version = "0.16.0";
          date = "2026-11-03";
          rev = "85e51e009c24fad47575f04d3c08f12342615d82";
          hash = "sha256-UdKcStMixsQd0xCF75CpUxvTSl6VfuEcnnfFRG0WpWI=";
          description = "gridcraft";
          outputHashes = {
            "craft-fonts-build-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-i18n-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-print-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-ui-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-update-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-window-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-winprint-gdi-0.1.0" = "sha256-n1pcNaBGrnvSsE5MedeSRczJOMhfmF/LGFiiDTrG1GM=";
            "ecolor-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "eframe-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-wgpu-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-winit-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_glow-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_kittest-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "emath-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint_default_fonts-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "winit-0.30.13" = "sha256-+67bk7cqhM5VHqROL3PeghmhKJvlPIxhU73ay45vaxw=";
            "winprint-0.2.1" = "sha256-wnz/VbqQ3j/x1PEq6Elxu/oSjVqdONfqQmZ31NsTIIc=";
          };
          unusedPatches = {
            "egui_demo_lib-0.37.0" = "egui_demo_lib";
            "egui_extras-0.37.0" = "egui_extras";
            "egui_inspection-0.37.0" = "egui_inspection";
            "egui_system_font_provider-0.37.0" = "egui_system_font_provider";
          };
        };
        deckcraft = {
          version = "0.15.0";
          date = "2026-11-03";
          rev = "3e178d8f5a59c787a6a53a7ed0f052b3e4a1489f";
          hash = "sha256-ffMDpDziPZ18qa7hHbgb67cvi5w6010o4Q3fHvanyYg=";
          description = "deckcraft";
          outputHashes = {
            "craft-fonts-build-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-i18n-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-media-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-pdf-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-ui-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-update-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "ecolor-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "eframe-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-wgpu-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-winit-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_glow-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_kittest-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "emath-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint_default_fonts-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "krilla-0.8.2" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "winit-0.30.13" = "sha256-+67bk7cqhM5VHqROL3PeghmhKJvlPIxhU73ay45vaxw=";
          };
          unusedPatches = {
            "egui_demo_lib-0.37.0" = "egui_demo_lib";
            "egui_extras-0.37.0" = "egui_extras";
            "egui_inspection-0.37.0" = "egui_inspection";
            "egui_system_font_provider-0.37.0" = "egui_system_font_provider";
          };
        };
        soundcraft = {
          version = "0.17.0";
          date = "2026-11-03";
          rev = "b35dd0f9eb0c08a198c1306021bd138f3a22d87c";
          hash = "sha256-3EvdefFFh+nEx6ie8sNqOeRH+Jky49tj01P4Ge7W3Qo=";
          description = "soundcraft";
          outputHashes = {
            "craft-docpath-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-fonts-build-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-i18n-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-media-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-ui-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-update-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "ecolor-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "eframe-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-wgpu-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-winit-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_glow-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_kittest-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "emath-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint_default_fonts-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "winit-0.30.13" = "sha256-+67bk7cqhM5VHqROL3PeghmhKJvlPIxhU73ay45vaxw=";
          };
          unusedPatches = {
            "egui_demo_lib-0.37.0" = "egui_demo_lib";
            "egui_extras-0.37.0" = "egui_extras";
            "egui_inspection-0.37.0" = "egui_inspection";
            "egui_system_font_provider-0.37.0" = "egui_system_font_provider";
          };
        };
        wordcraft = {
          version = "0.15.0";
          date = "2026-11-03";
          rev = "b47079fc791595fd84bb499d64dcd3f0624ef35a";
          hash = "sha256-AZJphQEBCkJiqAo2qus5R/LL6qTyiDODNU9yfVt8gUE=";
          description = "wordcraft";
          outputHashes = {
            "craft-atomic-0.1.0" = "sha256-cyjktjU+fsQFQaG/aKxq7xtj/mrpdLEqCjKgujCXaAE=";
            "craft-font-catalog-0.1.0" = "sha256-cyjktjU+fsQFQaG/aKxq7xtj/mrpdLEqCjKgujCXaAE=";
            "craft-font-store-0.1.0" = "sha256-cyjktjU+fsQFQaG/aKxq7xtj/mrpdLEqCjKgujCXaAE=";
            "craft-fonts-build-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-i18n-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-pdf-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-print-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-proof-0.1.0" = "sha256-YLjP7ZPC1YOgKEhk4u2om/VlNtr+VJYXaAihhNnqSHc=";
            "craft-ui-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-update-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-window-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-winprint-gdi-0.1.0" = "sha256-n1pcNaBGrnvSsE5MedeSRczJOMhfmF/LGFiiDTrG1GM=";
            "ecolor-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "eframe-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-wgpu-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-winit-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_glow-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_kittest-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "emath-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint_default_fonts-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "krilla-0.8.2" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "winit-0.30.13" = "sha256-+67bk7cqhM5VHqROL3PeghmhKJvlPIxhU73ay45vaxw=";
            "winprint-0.2.1" = "sha256-wnz/VbqQ3j/x1PEq6Elxu/oSjVqdONfqQmZ31NsTIIc=";
          };
          unusedPatches = {
            "egui_demo_lib-0.37.0" = "egui_demo_lib";
            "egui_extras-0.37.0" = "egui_extras";
            "egui_inspection-0.37.0" = "egui_inspection";
            "egui_system_font_provider-0.37.0" = "egui_system_font_provider";
          };
        };
        figcraft = {
          version = "0.15.0";
          date = "2026-11-03";
          rev = "02c38a6d959f0afd82e44d9d67d396266e6ab4a3";
          hash = "sha256-E3DdHHgJVdebbXqibZcrhytT0aDUUc+a+kpTUZocBK0=";
          description = "figcraft";
          outputHashes = {
            "craft-atomic-0.1.0" = "sha256-yTMWFdJDxJnbwHbing7TsrbmKRMhrjceMz5RwFJYt5g=";
            "craft-docpath-0.1.0" = "sha256-yTMWFdJDxJnbwHbing7TsrbmKRMhrjceMz5RwFJYt5g=";
            "craft-font-catalog-0.1.0" = "sha256-yTMWFdJDxJnbwHbing7TsrbmKRMhrjceMz5RwFJYt5g=";
            "craft-font-store-0.1.0" = "sha256-yTMWFdJDxJnbwHbing7TsrbmKRMhrjceMz5RwFJYt5g=";
            "craft-fonts-build-0.1.0" = "sha256-yTMWFdJDxJnbwHbing7TsrbmKRMhrjceMz5RwFJYt5g=";
            "craft-i18n-0.1.0" = "sha256-yTMWFdJDxJnbwHbing7TsrbmKRMhrjceMz5RwFJYt5g=";
            "craft-keymap-0.1.0" = "sha256-yTMWFdJDxJnbwHbing7TsrbmKRMhrjceMz5RwFJYt5g=";
            "craft-menu-0.1.0" = "sha256-yTMWFdJDxJnbwHbing7TsrbmKRMhrjceMz5RwFJYt5g=";
            "craft-quit-0.1.0" = "sha256-yTMWFdJDxJnbwHbing7TsrbmKRMhrjceMz5RwFJYt5g=";
            "craft-settings-0.1.0" = "sha256-yTMWFdJDxJnbwHbing7TsrbmKRMhrjceMz5RwFJYt5g=";
            "craft-ui-0.1.0" = "sha256-yTMWFdJDxJnbwHbing7TsrbmKRMhrjceMz5RwFJYt5g=";
            "craft-update-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-window-0.1.0" = "sha256-yTMWFdJDxJnbwHbing7TsrbmKRMhrjceMz5RwFJYt5g=";
            "ecolor-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "eframe-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-wgpu-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-winit-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_extras-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_glow-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "emath-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint_default_fonts-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "krilla-0.8.2" = "sha256-yTMWFdJDxJnbwHbing7TsrbmKRMhrjceMz5RwFJYt5g=";
            "winit-0.30.13" = "sha256-+67bk7cqhM5VHqROL3PeghmhKJvlPIxhU73ay45vaxw=";
          };
          unusedPatches = {
            "egui_demo_lib-0.37.0" = "egui_demo_lib";
            "egui_inspection-0.37.0" = "egui_inspection";
            "egui_kittest-0.37.0" = "egui_kittest";
            "egui_system_font_provider-0.37.0" = "egui_system_font_provider";
          };
        };
        texturecraft = {
          version = "0.3.0";
          date = "2026-11-03";
          rev = "85475143fa4d219cc7d60cd039923f57b6c2209c";
          hash = "sha256-GQcV4ryTuyuy1diNGIbEi+tB1VRV89Op8WwkTKahhUM=";
          description = "texturecraft";
          outputHashes = {
            "craft-fonts-build-0.1.0" = "sha256-0IBVplfbCZ7UhLR/tupGrOSYZkCFA2DBbUD9Bhs6xkE=";
            "craft-i18n-0.1.0" = "sha256-0IBVplfbCZ7UhLR/tupGrOSYZkCFA2DBbUD9Bhs6xkE=";
            "craft-ui-0.1.0" = "sha256-0IBVplfbCZ7UhLR/tupGrOSYZkCFA2DBbUD9Bhs6xkE=";
            "craft-window-0.1.0" = "sha256-0IBVplfbCZ7UhLR/tupGrOSYZkCFA2DBbUD9Bhs6xkE=";
            "ecolor-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "eframe-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-wgpu-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-winit-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_glow-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_kittest-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "emath-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint_default_fonts-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "winit-0.30.13" = "sha256-+67bk7cqhM5VHqROL3PeghmhKJvlPIxhU73ay45vaxw=";
          };
        };
        materialcraft = {
          version = "0.1.0";
          date = "2026-11-03";
          rev = "cedabf02030a3c662fda99b197ceb3ed12790ee7";
          hash = "sha256-v95y8NIEr1G8fMJEHaQmw1eUoCcsDHousVwUJnRjnY8=";
          description = "materialcraft";
          outputHashes = {
            "craft-fonts-build-0.1.0" = "sha256-0IBVplfbCZ7UhLR/tupGrOSYZkCFA2DBbUD9Bhs6xkE=";
            "craft-i18n-0.1.0" = "sha256-0IBVplfbCZ7UhLR/tupGrOSYZkCFA2DBbUD9Bhs6xkE=";
            "craft-ui-0.1.0" = "sha256-0IBVplfbCZ7UhLR/tupGrOSYZkCFA2DBbUD9Bhs6xkE=";
            "ecolor-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "eframe-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-wgpu-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-winit-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_glow-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_kittest-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "emath-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint_default_fonts-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "winit-0.30.13" = "sha256-+67bk7cqhM5VHqROL3PeghmhKJvlPIxhU73ay45vaxw=";
          };
        };
        pdfcraft = {
          version = "0.18.0";
          date = "2026-11-03";
          rev = "3936f93a1479366a951206fc6d3094680fe2d3dc";
          hash = "sha256-agLr61nG0/s786ZYj2AS2uw8hhH7a20TcCEjedHyygk=";
          description = "pdfcraft";
          outputHashes = {
            "craft-docpath-0.1.0" = "sha256-oEMbxXiZ/e9RhYrefEUC0gFLPlaR9LxtUWUU8coz9As=";
            "craft-fonts-build-0.1.0" = "sha256-oEMbxXiZ/e9RhYrefEUC0gFLPlaR9LxtUWUU8coz9As=";
            "craft-i18n-0.1.0" = "sha256-oEMbxXiZ/e9RhYrefEUC0gFLPlaR9LxtUWUU8coz9As=";
            "craft-keymap-0.1.0" = "sha256-oEMbxXiZ/e9RhYrefEUC0gFLPlaR9LxtUWUU8coz9As=";
            "craft-menu-0.1.0" = "sha256-oEMbxXiZ/e9RhYrefEUC0gFLPlaR9LxtUWUU8coz9As=";
            "craft-print-0.1.0" = "sha256-oEMbxXiZ/e9RhYrefEUC0gFLPlaR9LxtUWUU8coz9As=";
            "craft-quit-0.1.0" = "sha256-oEMbxXiZ/e9RhYrefEUC0gFLPlaR9LxtUWUU8coz9As=";
            "craft-ui-0.1.0" = "sha256-oEMbxXiZ/e9RhYrefEUC0gFLPlaR9LxtUWUU8coz9As=";
            "craft-update-0.1.0" = "sha256-oEMbxXiZ/e9RhYrefEUC0gFLPlaR9LxtUWUU8coz9As=";
            "craft-winprint-gdi-0.1.0" = "sha256-n1pcNaBGrnvSsE5MedeSRczJOMhfmF/LGFiiDTrG1GM=";
            "ecolor-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "eframe-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-wgpu-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-winit-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_extras-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_glow-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_kittest-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "emath-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint_default_fonts-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "winit-0.30.13" = "sha256-+67bk7cqhM5VHqROL3PeghmhKJvlPIxhU73ay45vaxw=";
            "winprint-0.2.1" = "sha256-wnz/VbqQ3j/x1PEq6Elxu/oSjVqdONfqQmZ31NsTIIc=";
          };
          unusedPatches = {
            "egui_demo_lib-0.37.0" = "egui_demo_lib";
            "egui_inspection-0.37.0" = "egui_inspection";
            "egui_system_font_provider-0.37.0" = "egui_system_font_provider";
          };
        };
        photocraft = {
          version = "0.20.1";
          date = "2026-11-03";
          rev = "327c4cc82e737a3e0af7c147a477126d77525495";
          hash = "sha256-wThSwug4qWWz7RkhZ8s1ZF9pKFZVKPhnhUw0w5Xurwk=";
          description = "photocraft";
          outputHashes = {
            "craft-docpath-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-fonts-build-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-i18n-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-jpeg-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-pcraft-format-0.1.0" = "sha256-x3pHb9RI7FwssE7kivrhRo/0lIbrJee7Ll5Wrn96AMw=";
            "craft-print-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-ui-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-update-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-winprint-gdi-0.1.0" = "sha256-n1pcNaBGrnvSsE5MedeSRczJOMhfmF/LGFiiDTrG1GM=";
            "ecolor-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "eframe-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-wgpu-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-winit-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_extras-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_glow-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_kittest-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "emath-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint_default_fonts-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "winit-0.30.13" = "sha256-+67bk7cqhM5VHqROL3PeghmhKJvlPIxhU73ay45vaxw=";
            "winprint-0.2.1" = "sha256-wnz/VbqQ3j/x1PEq6Elxu/oSjVqdONfqQmZ31NsTIIc=";
          };
          unusedPatches = {
            "egui_demo_lib-0.37.0" = "egui_demo_lib";
            "egui_inspection-0.37.0" = "egui_inspection";
            "egui_system_font_provider-0.37.0" = "egui_system_font_provider";
          };
        };
        vectorcraft = {
          version = "0.21.0";
          date = "2026-11-03";
          rev = "11862f61198c8f62c0b22b6c9a331cc5950ac98d";
          hash = "sha256-jHdKEfQK+O4WnEkyRnXuQ22248H4YVbrpWfnYz1xSgs=";
          description = "vectorcraft";
          outputHashes = {
            "craft-docpath-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-fonts-build-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-i18n-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-keymap-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-pdf-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-print-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-ui-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-update-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-vectorcraft-format-0.1.0" = "sha256-nj+diZKOcVgTsVRf0FcZQ01oqFOOi8qzu+iBtayAMbg=";
            "craft-window-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-winprint-gdi-0.1.0" = "sha256-n1pcNaBGrnvSsE5MedeSRczJOMhfmF/LGFiiDTrG1GM=";
            "ecolor-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "eframe-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-wgpu-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-winit-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_extras-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_glow-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_kittest-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "emath-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint_default_fonts-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "hayro-cmap-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "hayro-interpret-0.7.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "hayro-jbig2-0.3.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "hayro-postscript-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "hayro-syntax-0.7.2" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "krilla-0.8.2" = "sha256-ofhNWcMwEEf9lsagli1JzVyqQ935BK1oVe0XUhXBh1I=";
            "winit-0.30.13" = "sha256-+67bk7cqhM5VHqROL3PeghmhKJvlPIxhU73ay45vaxw=";
            "winprint-0.2.1" = "sha256-wnz/VbqQ3j/x1PEq6Elxu/oSjVqdONfqQmZ31NsTIIc=";
          };
          unusedPatches = {
            "egui_demo_lib-0.37.0" = "egui_demo_lib";
            "egui_inspection-0.37.0" = "egui_inspection";
            "egui_system_font_provider-0.37.0" = "egui_system_font_provider";
          };
        };
        designcraft = {
          version = "0.17.0";
          date = "2026-11-03";
          rev = "e79d682e02dc66f14370958b193bfa46072b2f41";
          hash = "sha256-7yyNVvZFO4F1SmDhpFytxM3BoPNA4uOLY0ldP5Ic2mE=";
          description = "designcraft";
          outputHashes = {
            "craft-atomic-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-cms-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-dialogs-0.1.0" = "sha256-6Q6qpUD73D9aUntjL9g9ovJHXwsWzQZpxsvlGsxEZmI=";
            "craft-docpath-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-fonts-build-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-i18n-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-keymap-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-pdf-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-prepress-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-print-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-ui-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-update-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-window-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-winprint-gdi-0.1.0" = "sha256-n1pcNaBGrnvSsE5MedeSRczJOMhfmF/LGFiiDTrG1GM=";
            "ecolor-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "eframe-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-wgpu-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-winit-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_glow-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_kittest-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "emath-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint_default_fonts-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "hayro-0.7.1" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "hayro-cmap-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "hayro-interpret-0.7.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "hayro-jbig2-0.3.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "hayro-postscript-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "hayro-syntax-0.7.2" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "indd-0.1.0" = "sha256-9buHpnMVC8NPbe0JwF1guqoxeVv6PdO3OVcjSQk9fmk=";
            "krilla-0.8.2" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "winit-0.30.13" = "sha256-+67bk7cqhM5VHqROL3PeghmhKJvlPIxhU73ay45vaxw=";
            "winprint-0.2.1" = "sha256-wnz/VbqQ3j/x1PEq6Elxu/oSjVqdONfqQmZ31NsTIIc=";
          };
          unusedPatches = {
            "egui_demo_lib-0.37.0" = "egui_demo_lib";
            "egui_extras-0.37.0" = "egui_extras";
            "egui_inspection-0.37.0" = "egui_inspection";
            "egui_system_font_provider-0.37.0" = "egui_system_font_provider";
          };
        };
        filmcraft = {
          version = "0.17.0";
          date = "2026-11-03";
          rev = "eb59ec09daaea519c9c8fffa404a594ae50d00e0";
          hash = "sha256-8qy6HZu96wBUhpyN3w87hxnPgOZ06MmzHkzT1i5ru0k=";
          description = "filmcraft";
          outputHashes = {
            "craft-docpath-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-fonts-build-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-i18n-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-media-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-ui-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-update-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "ecolor-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "eframe-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-wgpu-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-winit-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_glow-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_kittest-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "emath-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint_default_fonts-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "winit-0.30.13" = "sha256-+67bk7cqhM5VHqROL3PeghmhKJvlPIxhU73ay45vaxw=";
          };
          unusedPatches = {
            "egui_demo_lib-0.37.0" = "egui_demo_lib";
            "egui_extras-0.37.0" = "egui_extras";
            "egui_inspection-0.37.0" = "egui_inspection";
            "egui_system_font_provider-0.37.0" = "egui_system_font_provider";
          };
        };
        effectcraft = {
          version = "0.21.0";
          date = "2026-11-03";
          rev = "7870b5916ae0749d497d880989683bf2946d6c8b";
          hash = "sha256-bKKAYM4tKV3EateUKOg7PpbxfXB0xMKsXmvPQvDuK/Q=";
          description = "effectcraft";
          outputHashes = {
            "craft-docpath-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-ecproj-format-0.1.0" = "sha256-aEW6WiEyi9YB/mAVdhRJ/WaPBxaIhH1wkhenPE8KLNE=";
            "craft-fonts-build-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-i18n-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-pdf-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-quit-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-ui-0.1.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "craft-update-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "ecolor-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "eframe-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-wgpu-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-winit-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_glow-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_kittest-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "emath-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint_default_fonts-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "filmcraft-aac-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-ac3-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-apv-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-av1-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-avi-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-bitstream-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-cfb-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-codecs-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-color-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-dng-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-dnx-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-frame-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-geom-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-h264-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-h264enc-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-hevc-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-interchange-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-isobmff-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-matroska-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-media-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-mpa-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-mpeg2v-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-mpegts-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-mxf-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-ogg-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-opus-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-project-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-prores-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-time-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-vp8-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "filmcraft-vp9-0.8.0" = "sha256-zwGlMsfzhQT+5pbYOaxyaOAfBkm6Ocs6s8+Dnz1A+nE=";
            "hayro-jbig2-0.3.0" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "hayro-syntax-0.7.2" = "sha256-/8I9DcqtsznoYPo4ECc/rPQIal6P9gyPksrvVHDW6Mg=";
            "winit-0.30.13" = "sha256-+67bk7cqhM5VHqROL3PeghmhKJvlPIxhU73ay45vaxw=";
          };
          unusedPatches = {
            "egui_demo_lib-0.37.0" = "egui_demo_lib";
            "egui_extras-0.37.0" = "egui_extras";
            "egui_inspection-0.37.0" = "egui_inspection";
            "egui_system_font_provider-0.37.0" = "egui_system_font_provider";
          };
        };
        lightcraft = {
          version = "0.18.0";
          date = "2026-11-03";
          rev = "32d569ad5d19a6b55cf8d5c077127faa0f44a83b";
          hash = "sha256-2pmVy85ms/KrjqwlZRpLxtBeQzbjrrrHJUJ/jW3WIgA=";
          description = "lightcraft";
          outputHashes = {
            "craft-docpath-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-fonts-build-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-i18n-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-ui-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-update-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "craft-window-0.1.0" = "sha256-BRkWxb796qLWtF1U1EqCZFa8h1YCuoAZcXrVWMN8MEY=";
            "ecolor-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "eframe-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-wgpu-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui-winit-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_glow-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "egui_kittest-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "emath-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "epaint_default_fonts-0.37.0" = "sha256-xzgBk6K1X/MZ8WUlIdy+r/0cf1FDkhJJuwQHZX+WY9U=";
            "winit-0.30.13" = "sha256-+67bk7cqhM5VHqROL3PeghmhKJvlPIxhU73ay45vaxw=";
          };
          unusedPatches = {
            "egui_demo_lib-0.37.0" = "egui_demo_lib";
            "egui_extras-0.37.0" = "egui_extras";
            "egui_inspection-0.37.0" = "egui_inspection";
            "egui_system_font_provider-0.37.0" = "egui_system_font_provider";
          };
        };
      };

      # { "<app>" = <drv with gui+cli>; ... }
      mkApps = lib.foldl (a: b: a // b) { } (
        lib.mapAttrsToList (
          name: rel:
          let
            src = rustPkgs.fetchFromGitHub {
              owner = "storytold";
              repo = name;
              inherit (rel) rev hash;
            };
          in
          {
            "${name}" = rustPkgs.callPackage ./package.nix (
              builtins.removeAttrs rel [
                "rev"
                "hash"
              ]
              // {
                inherit name src;
                inherit (rel) rev date;
              }
            );
          }
        ) releases
      );

      solidcraft = rustPkgs.callPackage ./solidcraft.nix { };
    in
    {
      packages.${system} = mkApps // {
        inherit solidcraft;
        default = rustPkgs.symlinkJoin {
          name = "artcraft-suite";
          paths = (lib.attrValues mkApps) ++ [ solidcraft ];
        };
      };

      overlays.default = final: _prev: {
        artcraft-suite = mkApps;
        artcraft-suite-solidcraft = solidcraft;
      };
    };
}
