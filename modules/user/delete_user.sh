#!/bin/bash
user_del(){
    # read username
    read -p "Enter the user name to delete: " user_name
    echo
    # check the value is empty or not 
    if [ -z "${user_name}" ]; then
        echo "User name cannot be empty"
        return 1
    fi

    # check if user exists
    if ! id "${user_name}" &>/dev/null; then
        echo "User '$user_name' does not exist"
        return 1
    fi
    # delete user 
    userdel "${user_name}"
   
    # check exit code 
    if [ $? -eq 0 ]; then
        echo "User '$user_name' deleted successfully."
    else
        echo "Failed to delete user."
    fi
}
