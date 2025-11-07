# hacli: hack cli
function hacli(){
    if [[ $# -eq 0 ]]; then
        dirs=$(pwd)
    else
        dirs=( "$@" )
    fi

    for dir in ${dirs[@]}; do
        if [ -f "$dir/.envrc" ]; then
            echo "Loading hacli config at \"$dir\"..."
            source "$dir/.envrc"
        fi
    done
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

function cd(){
    builtin cd "$@" && hacli
}

hacli $HOME

if [ "$(pwd)" != "$HOME" ]; then
    hacli
fi
