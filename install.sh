#!/bin/sh

# script path
script=$(
    cd -- "$(
        dirname -- "${BASH_SOURCE[0]}"
    )" &>/dev/null && pwd
)

cd $script

hacli=".hacli"
bashrc="$HOME/.bashrc"
ln -vsf $script/hacli.sh $HOME/$hacli
echo "# hacli: a hack cli" >> $bashrc
echo "source \$HOME/$hacli" >> $bashrc
