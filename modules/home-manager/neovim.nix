{ lib, config, pkgs, ... }:
let
  cfg = config.components.neovim;
in
  {
    config = lib.mkIf cfg {
      programs.neovim = {
        enable = true;
	extraPackages = with pkgs; [
	  vimPlugins.nvim-treesitter-parsers.hyprlang
	];
      };
    };
  }
