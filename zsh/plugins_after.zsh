# External plugins (initialized after)

# pure prompt

autoload -U promptinit; promptinit

# turn on git stash status
zstyle :prompt:pure:git:stash show yes

prompt pure

# syntax highlighting
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# history search
source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# auto suggestions
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# key binding for auto suggestion
bindkey '^O' autosuggest-accept

# bind UP DOWN for history search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind the k and j keys for history search in VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
