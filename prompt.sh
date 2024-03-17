prompt_user() {
    local prompt="$1"
    read -p "$prompt" input
    echo "${input:-user42}"
}

# Örnek kullanım
group_name1=$(prompt_user "Enter the name for the first group: ")
echo "Selected group name for the first group: $group_name1"