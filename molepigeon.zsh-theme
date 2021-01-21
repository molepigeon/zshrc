# Zsh theme, modified from the tonotdo builtin: https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/tonotdo.zsh-theme
# To use this, from a terminal in this folder, run: ln -s molepigeon.zsh-theme ~/.oh-my-zsh/themes/molepigeon.zsh-theme
# And set ZSH_THEME in .zshrc to "molepigeon"
#
# Modifications:
# - Moved the clock to the left
# - Added the last command's return code after the clock
# - When combined with prompt-tweaks.zsh, the prompt shows your targeted Kube cluster, and highlights it in blue if the cluster name contains "-stage", red if it contains "-prod".
# - Git prompt appears in white, with a red * if the repo is not clean.

autoload -U colors; colors
source /Users/molepigeon/gopath/src/github.com/molepigeon/zshrc/prompt-tweaks.zsh # Change this to the location of prompt-tweaks.sh in this repo!

PROMPT='[%*] →$? $ZSH_KUBECTL_PROMPT$(parse_ibm_account)%{$fg_no_bold[green]%}%3~$(git_prompt_info)%{$reset_color%}
$ '

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[white]%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}*%{$fg_bold[white]%})"

# LS colors, made with https://geoff.greer.fm/lscolors/
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'

ZSH_THEME_IBM_PROMPT_COLOR=033
function parse_ibm_account {
  OUTPUT=$(jq '"\(.Account.Name)"' ~/.bluemix/config.json 2>/dev/null | tr -d '"')
  if [ "$(sed -e 's/.*:\(.*\)/\1/' <<< "$OUTPUT")" ]; then
    echo -n "%{$FG[$ZSH_THEME_IBM_PROMPT_COLOR]%}{☁️  $OUTPUT} "
  fi
}
