#!/usr/bin/env bash

declare -a extensions=("betterthantomorrow.calva"
                       "borkdude.clj-kondo"
                       "evzen-wybitul.magic-racket"
                       "k--kato.intellij-idea-keybindings"
                       "maelvalais.autoconf"
                       "ms-vscode.Go"
                       "ms-vscode.vscode-typescript-tslint-plugin"
                       "shaunlebron.vscode-parinfer"
                       "vscode-icons-team.vscode-icons"
                       "zhuangtongfa.material-theme"
                       )

for ext in "${extensions[@]}"
do
    code --install-extension "$ext"
done