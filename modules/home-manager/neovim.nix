{ lib, config, pkgs, ... }:
let
  cfg = config.components.neovim;
in
  {
    config = lib.mkIf cfg {
      programs.neovim = {
        enable = true;
	plugins = with pkgs.vimPlugins; [
	  nvim-autopairs
	  nvim-surround
	];
	extraLuaConfig = ''
	  require("nvim-autopairs").setup {}
	  require("nvim-surround").setup {}
	  vim.opt.number = true
	'';
	extraPackages = with pkgs; [
	  vimPlugins.nvim-treesitter-parsers.hyprlang
	];
      };
    };
  }
