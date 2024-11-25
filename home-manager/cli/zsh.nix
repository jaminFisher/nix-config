{...}:
  let

  # My shell aliases
  myAliases = {
    fd = "fd -Lu";
    br = "broot";
  };
in{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = myAliases;
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "the fuck" "zoxide"];
    };
  };
}