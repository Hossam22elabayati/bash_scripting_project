#!/bin/bash
group_rename(){
# read old group name 
read -p "enter the group name: " group_name
# read new group name
read -p "enter the new group name: " new_name
if [ -z "${group_name}" ] || [ -z "${new_name}" ]
then
        echo "group name or new name cannot be empty"
        return 1
fi
    # check if old group exists
    if ! getent group "${group_name}" > /dev/null 2>&1; then
        echo "group '${group_name}' does not exist"
        return 1
    fi

    # check if new group name already exists
    if getent group "${new_name}" > /dev/null 2>&1; then
        echo "group '${new_name}' already exists"
        return 1
    fi
# update name of group 
groupmod -n "${new_name}" "${group_name}"

# check exit code 
if [ $? -eq 0 ]
then
        echo "name changed from '${group_name}' to '${new_name}' "
else
        echo "failed to rename group '${group_name}'"
fi

}

