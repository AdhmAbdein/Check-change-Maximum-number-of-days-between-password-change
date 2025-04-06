#!/bin/bash

user=$1
threshold=30

for i in $user
do
   exp_value=$(chage -l "$i" | grep "Maximum number of days between password change" | awk '{print $NF}')
   # NF refer to number of field so we can generate the last field in datafram to fin value of expire
   if [ "$exp_value" -lt "$threshold" ]
   then
      echo "the user "$i" will change password nearly after "$exp_value" notify him"
   else
      echo "the user "$i" will change password after "$exp_value" and it is so far "
   fi

done



#################################


#!/bin/bash

user=$1
exp_value=$2
threshold=30

for i in $user
do
   change=$(chage -M "$exp_value" "$i")
   new_value=$(chage -l "$i" | grep "Maximum number of days between password change" | awk '{print NF}')
   echo "Maximum number of days to change password for user "$i" updated to become "$new_value""

   if [ "$new_value" -lt "$threshold" ]
   then
      echo "the user "$i" will change password nearly after "$new_value" notify him"
   else
      echo "the user "$i" will change password after "$new_value" and it is so far "
   fi

done

