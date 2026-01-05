{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.features.cli.tools.neovim;
in {
  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
        nvim-autopairs
        nvim-surround
	nvim-colorizer-lua
      ];
      extraLuaConfig = ''
        require("nvim-autopairs").setup {}
	require("colorizer").setup ({
	  ["*"] =  {
	    names = false,
	  },
	})
        require("nvim-surround").setup {}
        vim.opt.number = true
      '';
    };
  };
}
