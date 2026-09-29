{ pkgs, inputs, ... }:

{
    imports = [
      inputs.stylix.homeModules.stylix
    ];

# Actual Stylix Configuaration

    stylix = {
        enable = true;
        image = ./clair_obscur.jpeg;
        polarity = "dark";

        base16Scheme = {
            base00 = "110f12"; # Default Background (Very dark purple-black)
            base01 = "1a161d"; # Lighter Background (For status bars, line numbers)
            base02 = "2c2330"; # Highlights (Dunkles Lila)
            base03 = "a7a0ab"; # Comments, Muted Text, Caret / Column Line
            base04 = "9a90a1"; # Dark Foreground (For less prominent text)
            base05 = "e4ded5"; # Default Foreground (Main body text / Warm off-white)
            base06 = "f5f0e8"; # Light Foreground (For clean, bright text)
            base07 = "ffffff"; # Light Background / Active Text (Pure White)
            base08 = "de5454"; # Variables, XML Tags, Markup Link Text (Firebrick Red)
            base09 = "d4af37"; # Integers, Boolean, Constants (Metallic Gold)
            base0A = "e5c158"; # Classes, Markup Bold, Search Highlights (Warm Yellow/Gold)
            base0B = "b300b3"; # Strings, Inherited Class, Markup Code (Amethyst Purple)
            base0C = "5d3a77"; # Support, Regular Expressions, Escape Characters (Deep Purple)
            base0D = "e5c158"; # Functions, Methods, Attribute IDs (Warm Yellow/Gold - matching base0A)
            base0E = "a14352"; # Keywords, Storage, Selector (Muted Crimson/Rose)
            base0F = "8b0000"; # Deprecated, Opening/Closing Embedded Tags (Dark Red)
          };

        fonts = {
            serif = {
                package = pkgs.google-fonts;
                name = "Italiana";
            };
            monospace = {
              package = pkgs.nerd-fonts.jetbrains-mono;
              name = "JetBrainsMono Nerd Font";
            };
          };
        opacity = {
          applications = 0.6;
          terminal = 0.6;
          desktop = 0.6;
          popups = 0.6;
        };
          
      };
  }
