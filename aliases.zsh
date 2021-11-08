# Kubectl
alias lubectl="kubectl" # common typo, also lol
alias k="kubectl"
alias ki="kubectl -n istio-system"
alias kk="kubectl -n kube-system"
alias kr="kubectl -n registry"
alias km="kubectl -n monitoring"
alias ks='kubectl -n ibm-services-system'
alias kc='kubectl config use-context'
alias kcu='kubectl config unset current-context'

alias wk="watch kubectl"
alias wki="watch kubectl -n istio-system"
alias wkk="watch kubectl -n kube-system"
alias wkr="watch kubectl -n registry"
alias wkm="watch kubectl -n monitoring"
alias wks='watch kubectl -n ibm-services-system'

alias kp="kubectl get pods"
alias kip="kubectl -n istio-system get pods"
alias kkp="kubectl -n kube-system get pods"
alias krp="kubectl -n registry get pods"
alias kmp="kubectl -n monitoring get pods"
alias ksp='kubectl -n ibm-services-system get pods'

alias wkp="watch kubectl get pods"
alias wkip="watch kubectl -n istio-system get pods"
alias wkkp="watch kubectl -n kube-system get pods"
alias wkrp="watch kubectl -n registry get pods"
alias wkmp="watch kubectl -n monitoring get pods"
alias wksp='watch kubectl -n ibm-services-system get pods'

# https://github.com/nvbn/thefuck
if command -v thefuck >/dev/null; then
    eval $(thefuck --alias)
    eval $(thefuck --alias oops)
fi

# IBM Cloud CLI
alias iks="ibmcloud ks"
alias icr="ibmcloud cr"
alias ic="ibmcloud"
alias ics="ibmcloud login --sso -a test.cloud.ibm.com"
alias icp="ibmcloud login --sso -a cloud.ibm.com"
alias regprod="ibmcloud login --sso -a cloud.ibm.com --no-region -c $IBMCLOUD_REGPROD_ACCOUNT"
alias regdev="ibmcloud login --sso -a cloud.ibm.com --no-region -c $IBMCLOUD_REGDEV_ACCOUNT"
alias regstage="ibmcloud login --sso -a cloud.ibm.com --no-region -c $IBMCLOUD_REGSTAGE_ACCOUNT"

# Git related
alias hpr="hub pull-request -d"
alias gpom="git pull --rebase origin master"
alias gpum="git pull --rebase upstream master"
alias ghk="ssh-add /Users/molepigeon/.ssh/id_github"

# Random ones
alias dcton="export DOCKER_CONTENT_TRUST=1"
alias s3="aws s3api"
cover () {
    t="/tmp/go-cover.$$.tmp"
    go test -coverprofile=$t -v $@ && go tool cover -html=$t && unlink $t
}
alias gml="gometalinter"
alias dockertools="sh /Users/molepigeon/dockertools.sh"
