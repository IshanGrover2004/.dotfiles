if status is-interactive
    
    export PATH="$PATH:/home/rover/date/"

    starship init fish | source
    zoxide init fish | source

    # For starting zellij
    # if test $TERM != "screen"
    #     exec zellij
    # end
    # if status is-interactive
    #     eval (zellij setup --generate-auto-start fish | string collect)
    # end
end
