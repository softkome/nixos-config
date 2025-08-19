{ lib, config, pkgs, ... }:
let
  cfg = config.components.neovim;
in
  {
    config = lib.mkIf cfg {
      programs.neovim = {
        enable = true;
	extraPackages = with pkgs; [
	  vim.Plugins.nvim-treesitter-parsers.hyprlang
	];
      };
    };
  }
