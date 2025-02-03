{ ... }:
let

  # My shell aliases
  myAliases = {
    fd = "fd -Lu";
    switch = "nh os switch ~/nix-config";
  };
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    shellAliases = myAliases;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "zoxide" "starship" "zsh-interactive-cd" "rbw" ];
    };
  };
}
