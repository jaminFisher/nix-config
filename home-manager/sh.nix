{ pkgs, ... }:
let

  # My shell aliases
  myAliases = {
    fd = "fd -Lu";
    br = "broot";
  };
in
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      command_timeout = 10000;
      addNewline = false;
      character = {
        disabled = true;
      };
      directory = {
        readOnly = " ";
      };
      gitBranch = {
        symbol = " ";
      };
      gitStatus = {
        ahead = '⇡${count}';
        diverged = '⇕⇡${aheadCount}⇣${behindCount}';
        behind = '⇣${count}';
        windowsStarship = '/mnt/c/Program Files/starship/bin/starship.exe';
      };
      gitMetrics = {
        addedStyle = 'bold blue';
        format = '[+$added]($addedStyle)/[-$deleted]($deletedStyle) ';
      };
      memory_usage = {
        symbol = " ";
      };
      nodejs = {
        symbol = " ";
      };
      os = {
        disabled = false;
        symbols = {
          Windows = " ";
          Ubuntu = " ";
          Debian = " ";
          NixOS = " ";
        };
      };
      shell = {
        fish_indicator = '';
        powershell_indicator = '_';
        zsh_indicator = 'z_';
        bash_indicator = '#!';
        cmd_indicator = '';
        style = 'cyan bold';
        disabled = false;
      };
      dotnet = {
        format = '=> [$symbol($tfm){($version)}]($style)';
        symbol = '󰪮 ';
        disabled = false;
      };
      azure = {
        disabled = false;
        format = "on [$symbol($subscription-$username)]($style) ";
        symbol = "ﴃ ";
        style = "blue bold";
      };
      battery = {
        format = "[$symbol]($style)";
        full_symbol = '󰁹';
        charging_symbol = '󱊦';
        discharging_symbol = '󱟞';
        disabled = false;
        display = [
          {
            threshold = 10;
            style = 'bold red';
            discharging_symbol = '󱃍';
          }
          {
            threshold = 30;
            style = 'bold yellow';
            discharging_symbol = '󱟟';
          }
          {
            threshold = 98;
            style = 'green';
          }
        ];
      };
      command_duration = {
        min_time = 500
        format = 'took [$duration](white)'
      };
    };
  };

  programs.zoxide = {
    enableBashIntegration= true;
    enableZshIntegration = true;
  }

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
    initExtra = ''
    PROMPT=" ◉ %U%F{magenta}%n%f%u@%U%F{blue}%m%f%u:%F{yellow}%~%f
     %F{green}→%f "
    RPROMPT="%F{red}▂%f%F{yellow}▄%f%F{green}▆%f%F{cyan}█%f%F{blue}▆%f%F{magenta}▄%f%F{white}▂%f"
    [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '
    '';
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  home.packages = with pkgs; [
    bottom fd fzf broot gitui (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

}