function mvdl --description "move latest downloaded file from ~/Downloads to current folder "
    set destination (default $argv[1] .)
    move ~/Downloads/(ls -t -A ~/Downloads/ | head -1) $destination
end 
