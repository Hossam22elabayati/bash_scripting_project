#!/bin/bash
shopt -s expand_aliases
alias include='source'
######################################
# modules 
include ./modules/user/add_user.sh 
include ./modules/user/delete_user.sh 
include ./modules/group/add_group.sh
include ./modules/group/delete_group.sh
include ./modules/group/rename_group.sh
########################################
select var in "User" "Group" "Exit"
do
	case $var in
		User)
			select user_var in "User_Add" "User_Delete" "Exit"
			do
				case $user_var in
					User_Add)
						user_add
						;;
					User_Delete)
						user_del
						;;
					Exit)
						break
						;;
					*) echo " Invalid option." ;;
				esac
			done
			;;
		Group)
			select group_var in "Group_Add" "Group_Delete" "Group_Rename" "Exit"
			do
				case $group_var in
					Group_Add)
						group_add
						;;
					Group_Delete)
						group_del
						;;
					Group_Rename)
						group_rename
						;;
					Exit)
						break
						;;
					*) echo " Invalid option." ;;
				esac
			done
			;;
		Exit)
			echo "Exiting script. Bye!"
			exit 0
			;;
		*) echo "Invalid option." ;;
	esac
done
