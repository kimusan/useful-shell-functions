function ask_gpt --description "ask ChatGPT a question from the command line. Requires a token and jq/curl"
    # Path to the file storing the access token
    set access_token_file ~/.config/fish/conf.d/chatgpt_access_token
    
    # Check if the access token file exists
    if test -f $access_token_file
        # Read the access token from the file
        set access_token (cat $access_token_file)
        # Check if a question is provided as an argument
        if test (count $argv) -eq 0
            echo "Usage: ask_gpt <question>"
        else
            set model "gpt-3.5-turbo"
                  # Set the messages property

            # Send the question to ChatGPT using curl
            curl -X POST -s -H "Authorization: Bearer $access_token" -H "Content-Type: application/json" -d '{"model": "'$model'", "messages": [{"role":"user", "content": "'$argv'"}]}' https://api.openai.com/v1/chat/completions|jq -r ".choices[0].message.content" 
        end
    else
        echo "Error: ChatGPT access token not found. Please store your access token in ~/.config/fish/conf.d/chatgpt_access_token"
    end
end
