function remote-ip --description "Get my remote ip address as seen from the internet"
    curl --max-time 3 --silent http://whatismyip.akamai.com/ | grep -o "$IPV4_REGEX"
or dig -4 +short myip.opendns.com @resolver1.opendns.com
end
