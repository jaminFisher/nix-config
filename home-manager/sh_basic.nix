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
      add_newline = false;
      character = {
        disabled = true;
      };
      git_branch = {
        symbol = "branch ";
      };
      git_status = {
        ahead = "⇡$count";
        diverged = "⇕⇡$aheadCount⇣$behindCount";
        behind = "⇣$count";
        windows_starship = "/mnt/c/Program Files/starship/bin/starship.exe";
      };
      git_metrics = {
        added_style = "bold blue";
        format = "[+$added]($addedStyle)/[-$deleted]($deletedStyle) ";
      };
      memory_usage = {
        symbol = " ";
      };
      nodejs = {
        symbol = "nodejs ";
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
        fish_indicator = "";
        powershell_indicator = "_";
        zsh_indicator = "z_";
        bash_indicator = "#!";
        cmd_indicator = ":\\";
        style = "cyan bold";
        disabled = false;
      };
      dotnet = {
        format = "=> [$symbol($tfm){($version)}]($style)";
        symbol = ".NET";
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
        full_symbol = "• ";
        charging_symbol = "⇡ ";
        discharging_symbol = "⇣ ";
        disabled = false;
        display = [
          {
            threshold = 10;
            style = "bold red";
            discharging_symbol = "<10";
          }
          {
            threshold = 30;
            style = "bold yellow";
            discharging_symbol = "<30";
          }
          {
            threshold = 98;
            style = "green";
          }
        ];
      };
      cmd_duration = {
        min_time = 500;
        format = "took [$duration](white)";
      };
    };
  };

  programs.zoxide = {
    enableBashIntegration= true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  home.packages = with pkgs; [
    helix bottom fd fzf broot gitui (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

}