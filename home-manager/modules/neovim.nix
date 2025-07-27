{ pkgs, lib, config, ... }: {

  options = {
    neovimMod = lib.mkEnableOption "enables neovimMod";
  };

  config = lib.mkIf config.neovimMod {
    programs.neovim = {
      enable = true;
      extraPackages = with pkgs; [
        vimPlugins.nvim-treesitter-parsers.hyprlang
      ];
    };
  };
}
