{ pkgs, lib, ... }:
{
    programs.starship = {
        enable = true;
        enableZshIntegration = true;
        #enableNushellIntegration = true;
        enableBashIntegration = true;
        settings = {
            command_timeout=10000;
            add_newline = false;
            character = {
                disabled = true;
            };            
            directory = {
                read_only = " ";
            };
            git_branch ={
                symbol = " ";   
            };
            git_status = {
                ahead = "⇡x\${count}";
                diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
                behind = "⇣\${count}";
                windows_starship = "/mnt/c/Users/username/scoop/apps/starship/current/starship.exe";
            };
            git_metrics = {
                added_style = "bold blue";
                format = "+$added = {($added_style)/-$deleted = {($deleted_style) ";
            };            
            memory_usage = {
                symbol = " ";
            };
            nodejs = {
                symbol = " ";
            };
            os = {
                disabled = false;
            };
            os.symbols = {
                Windows = " ";
                Ubuntu = " ";
                Debian = " ";
                Pop = " ";
                NixOS = " ";
            };
            shell = {
                powershell_indicator = "_";
                zsh_indicator = "z_";
                bash_indicator = "#!";
                cmd_indicator = " ";
                style = "cyan bold";
                disabled = false;
            };
            dotnet = {
                format = "via [$symbol($version )($tfm )]($style)";
                symbol = "󰪮 ";
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
                full_symbol = "󰁹";
                charging_symbol = "󱊦";
                discharging_symbol = "󱟞";
                disabled = false;
            };
            battery.display = [{ 
                threshold = 10;
                style = "bold red";
                discharging_symbol = "󱃍";
            }
            { 
                threshold = 30;
                style = "bold yellow";
                discharging_symbol = "󱟟";
            }
            {
                threshold = 100;
                style = "green";
            }         
            ];
            cmd_duration = {
                min_time = 500;
                format = "took $duration = {(white)";
            };
        };
    };
}