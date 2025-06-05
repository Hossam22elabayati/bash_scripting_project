#!/bin/bash
group_add(){
# read the group name 
read -p "enter the group name: " group_name
# check the value not empty 
if [ -z "${group_name}" ]
then
	echo "group name cannot be empty"
	return 1
fi

# check group is already exists or not 
if getent group "${group_name}" > /dev/null 2>&1; then
        echo "group '${group_name}' already exists"
        return 1
fi

# add group 
groupadd "${group_name}"

# check exit code 
if [ $? -eq 0 ];
then
       echo "group '${group_name}' added successfully"  
else
        echo "failed to add group"
fi
}

