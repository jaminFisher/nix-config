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
