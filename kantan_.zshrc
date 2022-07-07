# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/tomharper/.oh-my-zsh"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

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

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# General aliases
alias boom="ls -la"
alias upstream="git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)"
alias cpath='echo -n `pwd`|pbcopy'
m () { mkdir -p "$(dirname "$1")" && touch "$1" }
o () { mkdir -p "$(dirname "$1")" && touch "$1" && code "$1"; }
mcd () {
  mkdir -p $1
  cd $1
}
alias del='rm -rf'
alias notes='code /Users/tomharper/Personal/Kantan-notes'
alias tprint='echo "const tprint = (input: any) => console.log(JSON.stringify(input, null, 2))" | pbcopy'
alias jprint='echo "const jprint = (input) => console.log(JSON.stringify(input, null, 2))" | pbcopy'
alias tformat='echo "const tformat = (input: any) => JSON.stringify(input, null, 2)" | pbcopy'
alias jformat='echo "const jformat = (input) => JSON.stringify(input, null, 2)" | pbcopy'
alias ip='ipconfig getifaddr en0'
alias cip='echo -n `ip`|pbcopy'
alias bluetooth="open -b com.apple.systempreferences /System/Library/PreferencePanes/Bluetooth.prefPane"
alias spotify="open -a /Applications/Spotify.app"
alias push='git push'
alias master='git checkout master'

# Kantan-app aliases
alias cdapp='cd /Users/tomharper/Kantan/kantan-app'
alias openapp='code /Users/tomharper/Kantan/kantan-app'
alias simulate="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias appstart='cdapp && yarn start'
alias app='cdapp && simulate && yarn start'
alias appp='openapp && app'
alias appandroid='cdapp && emulator -avd Pixel_2_API_29 && yarn start'
alias loggo="cat /Users/tomharper/Kantan/snippets/initSentryGo.ts > /Users/tomharper/Kantan/kantan-app/src/sentry/initSentry.ts"
alias logstop="cat /Users/tomharper/Kantan/snippets/initSentryStop.ts > /Users/tomharper/Kantan/kantan-app/src/sentry/initSentry.ts"
alias applocal="cat /Users/tomharper/Kantan/snippets/appEnvLocal.ts > /Users/tomharper/Kantan/kantan-app/src/environment/index.ts"
alias appstaging="cat /Users/tomharper/Kantan/snippets/appEnvStaging.ts > /Users/tomharper/Kantan/kantan-app/src/environment/index.ts"
alias appphysical="cat /Users/tomharper/Kantan/snippets/appEnvPhysical.ts > /Users/tomharper/Kantan/kantan-app/src/environment/index.ts"
alias huskystop="cat /Users/tomharper/Kantan/snippets/packageJSONHuskyStop.json > /Users/tomharper/Kantan/kantan-app/package.json"
alias huskygo="cat /Users/tomharper/Kantan/snippets/packageJSONHuskyGo.json > /Users/tomharper/Kantan/kantan-app/package.json"
alias login="adb shell am start -W -a android.intent.action.VIEW -d \"$1\""
alias androidpaste="adb shell input text"

# Kantan-multiservices
alias cdmulti='cd /Users/tomharper/Kantan/kantan-multiservices'
alias openmulti='code /Users/tomharper/Kantan/kantan-multiservices'
alias dockerup='docker-compose up -d redis db'
alias bootdb='cdmulti && dockerup'
alias entershell='cdmulti && poetry shell'
alias multi='bootdb && entershell'
alias multii='openmulti && bootdb && entershell'
alias servergo='python manage.py runserver_plus'

# Kantan-gateway
alias cdgateway='cd /Users/tomharper/Kantan/kantan-gateway'
alias opengateway='code /Users/tomharper/Kantan/kantan-gateway'
alias gateway='cdgateway && yarn start'
alias gatewayy='opengateway && gateway'
# alias gatewaystop='cat /Users/tomharper/Kantan/snippets/gatewayAppStop.ts > /Users/tomharper/Kantan/kantan-gateway/src/app.ts'
# alias gatewaygo='cat /Users/tomharper/Kantan/snippets/gatewayAppStart.ts > /Users/tomharper/Kantan/kantan-gateway/src/app.ts'
gatewaygo () {
  cat /Users/tomharper/Kantan/snippets/gatewayAppStart.ts > /Users/tomharper/Kantan/kantan-gateway/src/app.ts
  cat /Users/tomharper/Kantan/snippets/dataDogGo.json > /Users/tomharper/Kantan/kantan-gateway/iac/service/templates/container-definitions.json
}
gatewaystop () {
  cat /Users/tomharper/Kantan/snippets/gatewayAppStop.ts > /Users/tomharper/Kantan/kantan-gateway/src/app.ts
  cat /Users/tomharper/Kantan/snippets/dataDogStop.json > /Users/tomharper/Kantan/kantan-gateway/iac/service/templates/container-definitions.json
}
alias tsconfiggo='cat /Users/tomharper/Kantan/snippets/stricttsconfig.json > /Users/tomharper/Kantan/kantan-gateway/tsconfig.json'
alias tsconfigstop='cat /Users/tomharper/Kantan/snippets/loosetsconfig.json > /Users/tomharper/Kantan/kantan-gateway/tsconfig.json'

# Kantan marketplace
alias cdm='cd /Users/tomharper/Kantan/kantan-marketplace'
alias cdma='cd /Users/tomharper/Kantan/kantan-marketplace-api'
alias bootmdb='docker-compose up -d'
alias runma='uvicorn marketplace_api.main:app --port 8100 --host localhost --reload'

# Kantan-fullstack

# Configuring React Native Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# asdf stuff
. $HOME/.asdf/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit

eval $(thefuck --alias)

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
