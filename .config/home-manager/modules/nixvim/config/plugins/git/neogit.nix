{pkgs, ...}: {
  plugins.neogit = {
    enable = true;
    package = pkgs.vimPlugins.neogit;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>Neogit<CR>";
      options = {
        desc = "Neogit (root dir)";
      };
    }
  ];
}
