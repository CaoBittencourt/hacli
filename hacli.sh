# hacli: hack cli
function hacli(){
    if [ -f ".envrc" ]; then
        echo "Loading hacli config..."
        source .envrc
    fi
}

function cd(){
    builtin cd "$@" && hacli
}
