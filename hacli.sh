# hacli: hack cli
function hacli(){
    dirs=( "$@" )

    if [ $# -eq 0 ]; then
        dirs=( $(pwd) )
    fi
    
    for dir in ${dirs[@]}; do
        if [ -f "$dir/.envrc" ]; then
            pushd $dir > /dev/null
            echo "Loading hacli config at \"$dir\"..."
            source .envrc
            popd > /dev/null
        fi
    done
}

function hacli.cmd(){
    bin="$1"
    
    shift
    files=( "$@" )
    
    for file in ${files[@]}; do
        cmd=$(basename $file)
        cmd="${cmd%.*}"
        alias "$cmd"="$bin $file"
    done
}

function hacli.src(){
    files=( "$@" )
    
    for file in ${files[@]}; do
        source $file
    done
}

function cd(){
    builtin cd "$@"
    
    if [ $? -eq 0 ]; then
        if [ "$PWD" != "$HOME" ]; then
            hacli $PWD
        fi
    fi
}

hacli $HOME

if [ "$PWD" != "$HOME" ]; then
    hacli $PWD
fi
