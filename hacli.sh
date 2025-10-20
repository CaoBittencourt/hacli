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

function hacli.cmds(){
    bin="$1"
    shift
    files=( "$@" )
    for file in ${files[@]}; do
        cmd=$(basename $file)
        cmd="${cmd%.*}"
        alias "$cmd"="$bin $file"
    done
}

hacli
