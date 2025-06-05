#!/bin/bash
user_add(){
# read username
read -p "enter the user name: " user_name
# read password 
read -sp "enter the user password: " user_password
echo 
# check the values is not empty 
if [ -z  "${user_name}" ] || [ -z "${user_password}" ]
then 
	echo "user name cannot be empty "
	return 1
fi 

# check the user exist or not 
if id "${user_name}" &>/dev/null; then
        echo "user '$user_name' already exists"
        return 1
fi

# add username & password 
encrypted_pass=$(openssl passwd -6 "$user_password")
useradd -p "$encrypted_pass" "$user_name"
# check exit code
    if [ $? -eq 0 ]; then
        echo "user '$user_name' added successfully."
    else
        echo "failed to add user."
    fi

}
