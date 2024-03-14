function mkfile --argument target --description "make(touch) a file including all missing folders in its path "
    mkdir -p (dirname $target)
    touch $target
end
