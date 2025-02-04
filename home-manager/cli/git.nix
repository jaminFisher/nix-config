{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Ben Fisher";
    userEmail = "jaminFisher@gmail.com";
    difftastic = {
      enable = true;
      background = "dark";
      display = "side-by-side-show-both";
    };
    aliases = {
      co = "checkout";
      pc = "!git push origin '$(git symbolic-ref --short HEAD)'";
      undo = "reset HEAD~1 --mixed";
      amend = "commit --amend --no-edit";
      br = "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate";
    };
    # extraConfig = {
    #   credential.helper = "cache";
    # };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  # programs.git-credential-oauth = {
  #   enable = true;
  #   extraFlags = [ "-device" ];
  # };
}
