# When combined with molepigeon.zsh-theme, the prompt shows your targeted Kube cluster, and highlights it in blue if the cluster name contains "-stage", red if it contains "-prod".
# IKS cluster configs set the context name to <clusterName>/<clusterID>, so the context is split on slash to remove the cluster ID and save space.

autoload -Uz add-zsh-hook
add-zsh-hook precmd _zsh_molepigeon_prompt_precmd
function _zsh_molepigeon_prompt_precmd() {
    if ! context=$(kubectl config current-context 2>/dev/null) ; then
        unset ZSH_KUBECTL_PROMPT
        return 0
    fi
    context=$(echo $context | cut -d/ -f1)
    ZSH_KUBECTL_CONTEXT="${context}"
    ZSH_KUBECTL_COLOR="%{$fg_no_bold[white]%}"
    [[ "$ZSH_KUBECTL_CONTEXT" =~ "-stage" ]] && ZSH_KUBECTL_COLOR="%{$fg_bold[blue]%}"
    [[ "$ZSH_KUBECTL_CONTEXT" =~ "-prod" ]] && ZSH_KUBECTL_COLOR="%{$fg_bold[red]%}"
    ZSH_KUBECTL_PROMPT="$ZSH_KUBECTL_COLOR(☸️ $ZSH_KUBECTL_CONTEXT) "
    return 0
}
