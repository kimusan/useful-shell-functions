function mcd --argument folder --description "make folder(s) and cd into it"
    mkdir -p -- $folder
    and cd -- $folder
end
