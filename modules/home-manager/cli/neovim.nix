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
      ];
      extraLuaConfig = ''
               require("nvim-autopairs").setup {}
	       require("colorizer").setup({
                 "*"     = { RGB = true; RRGGBB = true; }; -- all filetypes
                 css     = { css = true; };                -- css support
                 html    = { names = false; };             -- html tweaks
               })
               require("nvim-surround").setup {}
        vim.opt.number = true
      '';
    };
  };
}
