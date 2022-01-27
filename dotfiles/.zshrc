# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!usr/bin/env zsh
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# - - - - - - - - - - - - - - - - - - - -
# Profiling Tools
# - - - - - - - - - - - - - - - - - - - -

PROFILE_STARTUP=false
if [[ "$PROFILE_STARTUP" == true ]]; then
    zmodload zsh/zprof
    # http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
    PS4=$'%D{%M%S%.} %N:%i> '
    exec 3>&2 2>$HOME/startlog.$$
    setopt xtrace prompt_subst
fi

# [START oh-my-zsh]
# Path to your oh-my-zsh installation.
export ZSH="/Users/chethanuk/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git poetry)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# [END oh-my-zsh]


# [START aliases]
alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias f="fuck"
alias clone_roppen="cd ~/Work/Github/ && python clone_repos.py"
alias rgit="cd ~/Work/Github/"
alias fshutdown="sudo shutdown -r now"
alias af="alias-finder"
alias pytest="python -m pytest"
alias grsetpo='git remote set-url --push origin'
alias switchj8='sdk default java 8.0.282.hs-adpt'
alias switchj11='sdk default java 11.0.10.hs-adpt'
alias historyg="omz_history | \grep --color"
alias prestoprod="~/presto --server presto.yoda.run --catalog hive --schema legacy --user admin --progress --debug"
alias gprd="gh pr create --base develop"
alias gprm="gh pr create --base master"
alias gcane="git commit -v --amend --no-edit"
# [END aliases]


# PyENV
# [START pyenv]
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
source $(pyenv root)/completions/pyenv.zsh
# virtualenv-init
# eval "$(pyenv virtualenv-init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
# [END pyenv]

# GCloud SDK
# [START gcloud-sdk]
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
# [END gcloud-sdk]


### Added by Zinit's installer
# [START zinit]
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# [END zinit]



### End of Zinit's installer chunk

# Speed test: for i in $(seq 1 10); do /usr/bin/time /bin/zsh -i -c exit; done;

# Zstyle.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "$HOME/.zcompcache"
zstyle ':completion:*' list-colors $LS_COLORS
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*' rehash true

# History.
HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"
HISTSIZE=100000
SAVEHIST=10000
setopt appendhistory notify
unsetopt beep nomatch

setopt bang_hist                # Treat The '!' Character Specially During Expansion.
setopt inc_append_history       # Write To The History File Immediately, Not When The Shell Exits.
setopt share_history            # Share History Between All Sessions.
setopt hist_expire_dups_first   # Expire A Duplicate Event First When Trimming History.
setopt hist_ignore_dups         # Do Not Record An Event That Was Just Recorded Again.
setopt hist_ignore_all_dups     # Delete An Old Recorded Event If A New Event Is A Duplicate.
setopt hist_find_no_dups        # Do Not Display A Previously Found Event.
setopt hist_ignore_space        # Do Not Record An Event Starting With A Space.
setopt hist_save_no_dups        # Do Not Write A Duplicate Event To The History File.
setopt hist_verify              # Do Not Execute Immediately Upon History Expansion.
setopt extended_history         # Show Timestamp In History.

# - - - - - - - - - - - - - - - - - - - -
# Theme
# - - - - - - - - - - - - - - - - - - - -

# Most Themes Use This Option.
setopt promptsubst

# These plugins provide many aliases - atload''
zinit wait lucid for \
        OMZ::lib/git.zsh \
    atload"unalias grv" \
        OMZ::plugins/git/git.plugin.zsh \
        OMZ::lib/termsupport.zsh \
        OMZ::lib/grep.zsh \
        OMZ::lib/completion.zsh

# Provide A Simple Prompt Till The Theme Loads
PS1="READY >"
zinit ice wait'!' lucid
zinit ice depth=1; zinit light romkatv/powerlevel10k


# - - - - - - - - - - - - - - - - - - - -
# Annexes
# - - - - - - - - - - - - - - - - - - - -

# Load a few important annexes, without Turbo (this is currently required for annexes)
# zinit light-mode for \
zinit light-mode compile"handler" for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node \
    zinit-zsh/z-a-submods \
    zdharma/declare-zsh


# - - - - - - - - - - - - - - - - - - - -
# Plugins
# - - - - - - - - - - - - - - - - - - - -

eval $(thefuck --alias)

# Functions to make configuration less verbose
# zt() : First argument is a wait time and suffix, ie "0a". Anything that doesn't match will be passed as if it were an ice mod. Default ices depth'3' and lucid
zt(){ zinit depth'3' lucid ${1/#[0-9][a-c]/wait"${1}"} "${@:2}"; }

zt 0c light-mode patch"${pchf}/%PLUGIN%.patch" reset nocompile'!' for \
    atload'ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(__fz_zsh_completion)' \
        changyuheng/fz \
    compile'h*' \
        zdharma/history-search-multi-word
# PROMPT='$(kube_ps1)'$PROMPT
# source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
# PS1='$(kube_ps1)'$PS1
# export TERM=xterm-256color

# Recommended Be Loaded Last.
# zinit ice wait blockf lucid atpull'zinit creinstall -q .'

# These plugins should be loaded after ohmyzsh plugins
# zinit wait'0b' lucid for \
# zinit wait lucid for \
# zt 0c lucid for \
zinit light-mode compile"handler" for \
    light-mode atinit"ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20" atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    light-mode atinit"
        typeset -gA FAST_HIGHLIGHT;
        FAST_HIGHLIGHT[git-cmsg-len]=100;
        zpcompinit;
        zpcdreplay;
    " \
        zdharma/fast-syntax-highlighting




#  \
#     light-mode blockf atpull'zinit creinstall -q .' \
#     atinit"
#         zstyle ':completion:*' completer _expand _complete _ignored _approximate
#         zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#         zstyle ':completion:*' menu select=2
#         zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
#         zstyle ':completion:*:descriptions' format '-- %d --'
#         zstyle ':completion:*:processes' command 'ps -au$USER'
#         zstyle ':completion:complete:*:options' sort false
#         zstyle ':fzf-tab:complete:_zlua:*' query-string input
#         zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm,cmd -w -w'
#         zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
#         zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'exa -1 --color=always ${~ctxt[hpre]}$in'
#     " \
#     bindmap"^R -> ^H" atinit"
#         zstyle :history-search-multi-word page-size 10
#         zstyle :history-search-multi-word highlight-color fg=red,bold
#         zstyle :plugin:history-search-multi-word reset-prompt-protect 1
#     " \
#         zdharma/history-search-multi-word \
#         djui/alias-tips \
#         doron-cohen/antidot \
#         charmbracelet/glow \
#         jarun/nnn \
#         paulirish/git-open \
#         tycho-kirchner/shournal \
#         dandavison/delta \
#         Dbz/kube-aliases \
#         kutsan/zsh-system-clipboard \
#         KKRainbow/zsh-command-note.plugin \


        # OMZ::plugins/pip/pip.plugin.zsh \
        # hadenlabs/zsh-cheat \
        # luismayta/zsh-functions \
        # mafredri/zsh-async \
        # hadenlabs/zsh-core \
        # OMZ::plugins/# gcloud/gcloud.plugin.zsh
        # OMZ::plugins/autoenv/autoenv.plugin.zsh \
        # OMZ::plugins/history-substring-search/history-substring-search.plugin.zsh \
        # OMZ::plugins/history-substring-search/history-substring-search.zsh \


# export AUTOSWITCH_VIRTUAL_ENV_DIR="./.virtualenvs/"
export AUTOSWITCH_VIRTUAL_ENV_DIR=".venv"
export AUTOSWITCH_MESSAGE_FORMAT="$(tput setaf 1)Switching to %venv_name 🐍 %py_version $(tput sgr0)"

# - - - - - - - - - - - - - - - - - - - -
# Theme / Prompt Customization
# - - - - - - - - - - - - - - - - - - - -

# To Customize Prompt, Run `p10k configure` Or Edit `~/.p10k.zsh`.
[[ ! -f ~/.p10k.zsh ]] || . ~/.p10k.zsh

zt 0b lucid for MichaelAquilina/zsh-autoswitch-virtualenv \
        MichaelAquilina/zsh-you-should-use \
    atload'zstyle ":completion:*" special-dirs false' \
        OMZL::completion.zsh \
    as'completion' atpull'zinit cclear' blockf \
        zsh-users/zsh-completions \
    as'completion' nocompile mv'*.zsh -> _git' patch"${pchf}/%PLUGIN%.patch" reset \
        felipec/git-completion \
        zsh-users/zsh-autosuggestions \
        zsh-users/zsh-syntax-highlighting
    # atload"source $ZHOMEDIR/rc/pluginconfig/zsh-autosuggestions_atload.zsh"


zt 0b lucid for OMZL::history.zsh \
    OMZP::systemd/systemd.plugin.zsh \
    OMZP::sudo/sudo.plugin.zsh \
    as'completion' atpull'zinit cclear' blockf \
        OMZL::completion.zsh \
        OMZ::plugins/ansible/ansible.plugin.zsh \
        OMZ::plugins/alias-finder/alias-finder.plugin.zsh \
        OMZ::plugins/brew/brew.plugin.zsh \
        OMZ::plugins/cloudfoundry/cloudfoundry.plugin.zsh \
        OMZ::plugins/colorize/colorize.plugin.zsh \
        OMZ::plugins/command-not-found/command-not-found.plugin.zsh \
        OMZ::plugins/common-aliases/common-aliases.plugin.zsh \
        OMZ::plugins/docker-compose/docker-compose.plugin.zsh \
        OMZ::plugins/docker/_docker \
        hadenlabs/zsh-docker \
        OMZ::plugins/git-auto-fetch/git-auto-fetch.plugin.zsh \
        OMZ::plugins/git-flow-avh/git-flow-avh.plugin.zsh \
        OMZ::plugins/globalias/globalias.plugin.zsh \
        OMZ::plugins/golang/golang.plugin.zsh \
        OMZ::plugins/gradle/gradle.plugin.zsh \
        OMZ::plugins/history/history.plugin.zsh \
        OMZ::plugins/keychain/keychain.plugin.zsh \
        OMZ::plugins/nmap/nmap.plugin.zsh \
        OMZ::plugins/osx/osx.plugin.zsh \
        OMZ::plugins/pyenv/pyenv.plugin.zsh \
        OMZ::plugins/pylint/pylint.plugin.zsh \
        OMZ::plugins/python/python.plugin.zsh \
        OMZ::plugins/sbt/sbt.plugin.zsh \
        OMZ::plugins/screen/screen.plugin.zsh \
        OMZ::plugins/systemadmin/systemadmin.plugin.zsh \
        OMZ::plugins/thefuck/thefuck.plugin.zsh \
        OMZ::plugins/tig/tig.plugin.zsh \
        OMZ::plugins/zsh_reload/zsh_reload.plugin.zsh \
        OMZ::plugins/terraform/terraform.plugin.zsh \
        OMZ::plugins/kubectl/kubectl.plugin.zsh
        # TODO add rest of the plugins: https://github.com/Dbz/kube-aliases/blob/master/kube-aliases.plugin.zsh

        # OMZ::plugins/kube-ps1/kube-ps1.plugin.zsh \
        #
        # kutsan/zsh-system-clipboard \
        # dandavison/delta \
        # paulirish/git-open

# - - - - - - - - - - - - - - - - - - - -
# End Profiling Script
# - - - - - - - - - - - - - - - - - - - -

if [[ "$PROFILE_STARTUP" == true ]]; then
    unsetopt xtrace
    exec 2>&3 3>&-
    zprof > ~/zshprofile$(date +'%s')
fi


# # ripgrep
# zinit ice as"program" from"gh-r" mv"ripgrep* -> rg" pick"rg/rg"
# zinit light BurntSushi/ripgrep

# # exa
# zinit ice as"program" from"gh-r" mv"exa* -> exa"
# zinit light ogham/exa

# # bat
# zinit ice as"program" from"gh-r" mv"bat* -> bat" pick"bat/bat"
# zinit light sharkdp/bat

# # fd
# zinit ice as"program" from"gh-r" mv"fd* -> fd" pick"fd/fd"
# zinit light sharkdp/fd

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Synchronise pass account
function psync() {
  pass git pull origin master
  pass git push origin master
  pass git push backup master
}

# ## Z

# zstyle ':autocomplete:*' default-context ''
# # '': Start each new command line with normal autocompletion.
# # history-incremental-search-backward: Start in live history search mode.

# zstyle ':autocomplete:*' min-delay 0      # number of seconds (float)
# # 0:   Start autocompletion immediately when you stop typing.
# # 0.4: Wait 0.4 seconds for more keyboard input before showing completions.

# zstyle ':autocomplete:*' min-input 0      # number of characters (integer)
# # 0: Show completions immediately on each new command line.
# # 1: Wait for at least 1 character of input.

# zstyle ':autocomplete:*' ignored-input '' # (extended) glob pattern
# # '':     Always show completions.
# # '..##': Don't show completions when the input consists of two or more dots.

# zstyle ':autocomplete:tab:*' insert-unambiguous no
# # no:  (Shift-)Tab inserts top (bottom) completion.
# # yes: Tab first inserts substring common to all listed completions (if any).

# zstyle ':autocomplete:tab:*' widget-style complete-word
# # complete-word: (Shift-)Tab inserts top (bottom) completion.
# # menu-complete: Press again to cycle to next (previous) completion.
# # menu-select:   Same as `menu-complete`, but updates selection in menu.
# # NOTE: Can NOT be changed at runtime.

# zstyle ':autocomplete:tab:*' fzf-completion no
# # no:  Tab uses Zsh's completion system only.
# # yes: Tab first tries Fzf's completion, then falls back to Zsh's.
# # NOTE 1: Can NOT be changed at runtime.
# # NOTE 2: Requires that you have installed Fzf's shell extensions.

# # Order in which completions are listed on screen, if shown at the same time:
# zstyle ':completion:*:' group-order \
#   expansions history-words options \
#   executables local-directories directories suffix-aliases \
#   aliases functions builtins reserved-words
# # NOTE: This is NOT the order in which they are generated!

# # source path/to/zsh-autocomplete.plugin.zsh
# #
# # NOTE: All settings below should come AFTER sourcing zsh-autocomplete!
# #

# bindkey $key[Up]    up-line-or-search
# # up-line-or-search:  Open history menu.
# # up-line-or-history: Cycle to previous history line.

# bindkey $key[Down]  down-line-or-select
# # down-line-or-select:  Open completion menu.
# # down-line-or-history: Cycle to next history line.

# bindkey $key[Control-Space] list-expand
# # list-expand:      Reveal hidden completions.
# # set-mark-command: Activate text selection.

# bindkey -M menuselect $key[Return] .accept-line
# # .accept-line: Accept command line.
# # accept-line:  Accept selection and exit menu.

# # Uncomment the following lines to disable live history search:
# # zle -A {.,}history-incremental-search-forward
# # zle -A {.,}history-incremental-search-backward

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/chethanuk/.sdkman"
[[ -s "/Users/chethanuk/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/chethanuk/.sdkman/bin/sdkman-init.sh"

# Created by `pipx` on 2021-03-15 11:52:01
# export PATH="$PATH:/Users/chethanuk/.local/bin"
# autoload -U bashcompinit
# bashcompinit
# eval "$(register-python-argcomplete pipx)"
# END pipx

export PATH="$HOME/.poetry/bin:$PATH"
# source $HOME/.poetry/env
