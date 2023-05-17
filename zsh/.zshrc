# determine architecture
if [[ $(sysctl -n machdep.cpu.brand_string) =~ "Apple" ]]; then
	IS_APPLE_SILICON=true
else
	IS_APPLE_SILICON=false
fi

# add colour and shorten prompt
PROMPT='%F{green}%n%f %F{magenta}%1~%f %# '

# add homebrew binaries to path (on Apple silicon)
if [[ $IS_APPLE_SILICON ]]; then
	PATH=/opt/homebrew/bin:$PATH
fi

# default editor
export EDITOR=nvim

# git tabcompletion
autoload -Uz compinit && compinit

# git rhs prompt configuration
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='%F{cyan}${vcs_info_msg_0_}%f'
zstyle ':vcs_info:git:*' formats '%b'

# fuzzy finder bindings and autocompletion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
