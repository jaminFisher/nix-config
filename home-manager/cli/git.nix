{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Ben Fisher";
    userEmail = "jaminFisher@gmail.com";
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
