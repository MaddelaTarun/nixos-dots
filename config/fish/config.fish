set -U fish_greeting ""

if status is-interactive
    set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
    starship init fish | source
    if type -q zoxide
        zoxide init fish | source
    end
end

# format man pages
set -x MANROFFOPT -c
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# PATH additions
for p in $HOME/.local/bin $HOME/Applications/depot_tools
    if test -d $p
        if not contains -- $p $PATH
            set -p PATH $p
        end
    end
end

# vim keybinding
set -g fish_key_bindings fish_vi_key_bindings

# Always block cursor (disable cursor switching)
function fish_mode_prompt
    echo -n ''
end

# !! and !$ support
function __history_previous_command
    switch (commandline -t)
        case "!"
            commandline -t $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function __history_previous_command_arguments
    switch (commandline -t)
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function lt
    # If a number is passed (e.g., lt 2), use it as the depth level
    if test (count $argv) -gt 0; and string match -qr '^[0-9]+$' $argv[1]
        eza -aT --level=$argv[1] --color=always --group-directories-first --icons
    else
        # Default behavior: Show the full unrestricted tree
        eza -aT --color=always --group-directories-first --icons
    end
end

# Bind history expansion to BOTH Vi Insert and Vi Normal/Default modes
bind -M default ! __history_previous_command
bind -M insert ! __history_previous_command

bind -M default '$' __history_previous_command_arguments
bind -M insert '$' __history_previous_command_arguments

# Better history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (string trim -r -c '/' $argv[1])
        set to $argv[2]
        command cp -r $from $to
    else
        command cp $argv
    end
end

# mkcd DIR
function mkcd
    mkdir -p $argv[1]; and cd $argv[1]
end

# Extract archives
function extract
    set file $argv[1]
    if test -f $file
        switch $file
            case '*.tar.bz2'
                tar xjf $file
            case '*.tar.gz'
                tar xzf $file
            case '*.bz2'
                bunzip2 $file
            case '*.rar'
                unrar x $file
            case '*.gz'
                gunzip $file
            case '*.tar'
                tar xvf $file
            case '*.tbz2'
                tar xjf $file
            case '*.tgz'
                tar xzf $file
            case '*.zip'
                unzip $file
            case '*.Z'
                uncompress $file
            case '*.7z'
                7z x $file
            case '*'
                echo "'$file' cannot be extracted via extract()"
        end
    else
        echo "'$file' is not a valid file"
    end
end

# Alias
# ls replacements
alias ls='eza -al --color=always --group-directories-first --icons'
alias la='eza -a --color=always --group-directories-first --icons'
alias ll='eza -l --color=always --group-directories-first --icons'
alias l.='eza -a | grep -e "^\."'

# system
alias tarnow='tar -acf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# program alias
alias tmux="tmux -u"
alias vi="nvim"
alias yz="yazi"

# shortcuts
alias q='exit'
alias h='history'
alias c='clear'

# git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gcl='git clone'
alias gl='git log --oneline'
alias gd='git diff'
alias gpush='git push'
alias gpull='git pull'
alias shutdown='systemctl poweroff'

## Environment
set -gx QT_QPA_PLATFORM wayland
set -gx XDG_CURRENT_DESKTOP niri
set -gx XDG_SESSION_TYPE wayland
set -gx GNOME_SETUP_DISPLAY :0
set -gx STUDIO_JDK /usr/lib/jvm/java-21-openjdk  # Or your current JDK path
set -gx _JAVA_AWT_WM_NONREPARENTING 1
set -gx ANDROID_HOME /opt/android-sdk
set -gx PATH $PATH $ANDROID_HOME/cmdline-tools/latest/bin $ANDROID_HOME/platform-tools $ANDROID_HOME/emulator
fish_add_path $HOME/go/bin

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish
