{ pkgs, ...}:
{
  programs.helix = {
    package = pkgs.helix;
    enable = true;
    defaultEditor = false;

    settings = {
      theme = "custom";
      keys = {
        normal = {
          C-g = [":new" ":insert-output gitui" ":buffer-close!" ":redraw"];
        };
      };

      editor = {
        line-number = "relative";
        soft-wrap.enable = true;
        true-color = true;
        cursorline = true;
        mouse = true;
        bufferline = "multiple";

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        whitespace = {
          render = {
            space = "all";
            tab = "all";
            newline = "none";
          };
          characters = {
            space = "·";
            tab = "→";
          };
        };

        indent-guides = {
          render = true;
          character = "│";
        };

        statusline = {
          left = ["mode" "spinner" "file-name" "file-modification-indicator"];
          center = [];
          right = ["diagnostics" "selections" "position" "file-encoding"];
        };

        end-of-line-diagnostics = "hint";
        inline-diagnostics = {
          cursor-line = "warning";
        };
      };
    };

    languages = {
      language = [
        {
          name = "rust";
          auto-format = true;
          indent = { tab-width = 4; unit = "    "; };
        }
        {
          name = "markdown";
          soft-wrap.enable = true;
          indent = { tab-width = 4; unit = "\t"; };
        }
        {
          name = "toml";
          auto-format = true;
          indent = { tab-width = 2; unit = "  "; };
        }
      ];
    };

    themes = {
      custom = let
        # Colors from your stylix config
        base00 = "#061229"; # background
        base01 = "#2a3448"; # lighter bg
        base02 = "#4d5666"; # selection
        base03 = "#717885"; # comments
        base04 = "#9a99a3"; # dark fg
        base05 = "#b8bbc2"; # default fg
        base06 = "#dbdde0"; # light fg
        base07 = "#ffffff"; # white
        base08 = "#d07346"; # orange - variables, errors
        base09 = "#f0a000"; # yellow-orange - constants
        base0A = "#fbd461"; # yellow - types
        base0B = "#99bf52"; # green - strings
        base0C = "#72b9bf"; # cyan - regex, escapes
        base0D = "#5299bf"; # blue - functions
        base0E = "#9989cc"; # purple - keywords
        base0F = "#b08060"; # brown - deprecated
      in {
        # UI
        "ui.background" = { bg = base00; };
        "ui.text" = base05;
        "ui.text.focus" = base06;
        "ui.cursor" = { fg = base00; bg = base05; };
        "ui.cursor.primary" = { fg = base00; bg = base06; };
        "ui.cursor.match" = { fg = base09; modifiers = ["bold"]; };
        "ui.selection" = { bg = base02; };
        "ui.selection.primary" = { bg = base02; };
        "ui.cursorline.primary" = { bg = base01; };
        "ui.linenr" = base03;
        "ui.linenr.selected" = base05;
        "ui.statusline" = { fg = base05; bg = base01; };
        "ui.statusline.inactive" = { fg = base03; bg = base01; };
        "ui.statusline.normal" = { fg = base00; bg = base0D; };
        "ui.statusline.insert" = { fg = base00; bg = base0B; };
        "ui.statusline.select" = { fg = base00; bg = base0E; };
        "ui.popup" = { fg = base05; bg = base01; };
        "ui.window" = base02;
        "ui.menu" = { fg = base05; bg = base01; };
        "ui.menu.selected" = { fg = base06; bg = base02; };
        "ui.help" = { fg = base05; bg = base01; };
        "ui.virtual.whitespace" = base02;
        "ui.virtual.indent-guide" = base02;

        # Syntax
        "comment" = base03;
        "keyword" = base0E;
        "keyword.control" = base0E;
        "keyword.function" = base0E;
        "keyword.operator" = base0E;
        "keyword.storage" = base0E;
        "operator" = base05;
        "punctuation" = base05;
        "punctuation.delimiter" = base05;
        "punctuation.bracket" = base05;
        "function" = base0C;
        "function.method" = base0C;
        "function.macro" = base09;
        "function.builtin" = base0C;
        "type" = base0B;
        "type.builtin" = base0B;
        "constructor" = base0B;
        "constant" = base09;
        "constant.builtin" = base09;
        "constant.numeric" = base09;
        "string" = base0A;
        "string.regexp" = base0C;
        "string.special" = base0C;
        "variable" = base0D;
        "variable.builtin" = base08;
        "variable.parameter" = base0D;
        "variable.other.member" = base0D;
        "label" = base08;
        "attribute" = base09;
        "namespace" = base04;
        "module" = base04;
        "special" = base0C;
        "tag" = base08;

        # Markup (markdown etc)
        "markup.heading" = { fg = base0D; modifiers = ["bold"]; };
        "markup.bold" = { modifiers = ["bold"]; };
        "markup.italic" = { modifiers = ["italic"]; };
        "markup.link.url" = { fg = base09; modifiers = ["underlined"]; };
        "markup.link.text" = base0D;
        "markup.list" = base08;
        "markup.quote" = { fg = base0B; modifiers = ["italic"]; };
        "markup.raw" = base0B;

        # Diff
        "diff.plus" = base0B;
        "diff.minus" = base08;
        "diff.delta" = base09;

        # Diagnostics
        "diagnostic.hint" = { underline = { style = "curl"; color = base0C; }; };
        "diagnostic.info" = { underline = { style = "curl"; color = base0D; }; };
        "diagnostic.warning" = { underline = { style = "curl"; color = base09; }; };
        "diagnostic.error" = { underline = { style = "curl"; color = base08; }; };
        "warning" = base09;
        "error" = base08;
        "info" = base0D;
        "hint" = base0C;
      };
    };
  };
}
