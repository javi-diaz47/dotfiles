{
  programs.git = {
    enable = true;

    # [user]
    userName = "javi-diaz47";
    userEmail = "javiereduardo300@gmail.com";

    #[alias]
    aliases = {
      st = "status -sb";
      ll = "log --oneline --graph";
      a = "add";
      cm = "commit -m";
      ca = "commit --amend -m";
      can = "commit --amend --no-edit";
      acm = "commit -a -m";
    };

    extraConfig = {
      # [init]
      init.defaultBranch = "main";
    };
  };
}
