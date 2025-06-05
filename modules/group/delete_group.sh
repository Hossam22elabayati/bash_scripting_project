#!/bin/bash
group_del(){
# read a group name 
read -p "enter the name of group: " group_name
# check the value is not empty
if [ -z "${group_name}" ]
then
        echo "group name cannot be empty"
        return 1
fi

 # check if group exists
if ! getent group "${group_name}" > /dev/null 2>&1; then
        echo "group '${group_name}' does not exist"
        return 1
fi

# delete group 
groupdel "${group_name}"

# check exit code  
if [ $? -eq 0 ]
then
       echo "group '${group_name}' deleted successfully"  
else
       echo "failed to delete group '${group_name}' "
fi
}

