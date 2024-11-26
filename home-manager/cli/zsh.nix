{ ... }:
let

  # My shell aliases
  myAliases = {
    fd = "fd -Lu";
  };
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = myAliases;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "zoxide"
        "starship"
        "rbw"
      ];
    };
  };
}
