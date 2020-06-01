#!/bin/bash

if [[ -n "$USERNAME" ]] && [[ -n "$USERPWD" ]]
then
	htpasswd -bc /etc/nginx/user1.htpasswd  $USERNAME $USERPWD
	htpasswd -bc /etc/nginx/user2.htpasswd  $USERNAME2 $USERPWD2
	echo Done.
else
    echo no auth file
