export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

# disable update check of oh-my-zsh
export DISABLE_AUTO_UPDATE="true"

files=(
    oh-my-zsh/oh-my-zsh.sh(N)
    zsh-abbr/*.plugin.zsh(N)
    zsh-autosuggestions/*.plugin.zsh(N)
)

for file in ${files[@]}; do
    . $file
done
