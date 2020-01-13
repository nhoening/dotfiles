alias k=kubectl
alias kg="kubectl get"
alias kgj="kubectl get -o json"
alias kgy="kubectl get -o yaml"
alias kd="kubectl describe "
alias kdp="kubectl describe pods"
alias kctx='kubectl config set current-context'
alias ktx='kubectl config set current-context'
alias watch='watch '
alias dg="dig +noall +answer"
function kns {
    kubectl get ns $1 >/dev/null
    if [ $? -eq 0 ]; then
        kubectl config set-context $(kubectl config current-context) --namespace=$1
    else
        echo "failed to resolve that namespace!"
    fi
}
function kcontainers {
    kubectl get pod $1 -o json | jq .spec.containers[].name -r
}
function ksecret {
    k get secret $1 -o json | jq -r ".data | to_entries[] | {name: .key, value: (.value | @base64d)}"
}
function kforward {
    #PORT=$(k get pods $1 -o json | jq -r .spec.containers[].ports[].containerPort | head -n1)
    SERVICE_PORT=$(k get svc $1 -o json | jq -r .spec.ports[].port)
    PROXY_PORT=$(shuf -i 2000-65000 -n 1)
    IP=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')
    echo "connect on $IP:$PROXY_PORT"
    k port-forward svc/$1 --address=0.0.0.0 $PROXY_PORT:$SERVICE_PORT
}
function rowgrep {
    read -r firstLine
    echo "$firstLine"
    while IFS= read -r line; do
        echo "$line" | grep $@
    done
}

export KUBE_PS1_SYMBOL_ENABLE=false

source ~/.kube/kube-ps1.sh  # get this script from github
PROMPT='$(kube_ps1)'$PROMPT
