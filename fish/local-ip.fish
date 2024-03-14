function local-ip --description "get local IP addresses"
    ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'
end
