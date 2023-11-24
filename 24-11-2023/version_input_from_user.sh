#to implement version requests from user in a static way

#!/bin/bash

declare -A clients=(
    ["Client1"]="Version 1"
    ["Client2"]="Version 1"
)

display_clients_versions() {
    echo "Current client versions:"
    for client in "${!clients[@]}"; do
        echo "$client: ${clients[$client]}"
    done
}

update_version() {
    local client=$1
    local new_version=$2

    if [ -n "${clients[$client]}" ]; then
        clients["$client"]=$new_version
        echo "$client updated to $new_version"
    else
        echo "Error: $client not found"
    fi
}

run_interactive_update() {
    while true; do
        display_clients_versions
        read -p "Enter the client to update (or 'exit' to quit): " client

        if [ "$client" == "exit" ]; then
            break
        fi

        if [ -n "${clients[$client]}" ]; then
            read -p "Enter the new version for $client: " new_version
            update_version "$client" "$new_version"
        else
            echo "Error: $client not found"
        fi
    done
}

run_interactive_update


#to implement version requests from user in a dynamic way by reading data from config files from a server and updating them in the server

#!/bin/bash

declare -A clients

load_clients_data() {
    # Replace 'user@remote_server:/path/to/client_configs.txt' with your actual SSH details
    ssh user@remote_server "cat /path/to/client_configs.txt" | while IFS= read -r line; do
        client=$(echo "$line" | cut -d' ' -f1)
        version=$(echo "$line" | cut -d' ' -f2)
        clients["$client"]=$version
    done
}

display_clients_versions() {
    echo "Current client versions:"
    for client in "${!clients[@]}"; do
        echo "$client: ${clients[$client]}"
    done
}

update_version() {
    local client=$1
    local new_version=$2

    if [ -n "${clients[$client]}" ]; then
        clients["$client"]=$new_version
        echo "$client updated to $new_version"
    else
        echo "Error: $client not found"
    fi
}

run_interactive_update() {
    while true; do
        display_clients_versions
        read -p "Enter the client to update (or 'exit' to quit): " client

        if [ "$client" == "exit" ]; then
            break
        fi

        if [ -n "${clients[$client]}" ]; then
            read -p "Enter the new version for $client: " new_version
            update_version "$client" "$new_version"
        else
            echo "Error: $client not found"
        fi
    done
}

# Load client data from remote configuration files
load_clients_data

# Run interactive update
run_interactive_update

# Save updated client data to remote configuration files
for client in "${!clients[@]}"; do
    ssh user@remote_server "sed -i 's/^$client .*$/$client ${clients[$client]}/' /path/to/client_configs.txt"
done

