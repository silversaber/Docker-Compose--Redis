#!/bin/bash

if [[ -n "$USERNAME" ]] && [[ -n "$USERPWD" ]]
then
	if [[ -n "$USERNAME2" ]] && [[ -n "$USERPWD2" ]]
	then
		htpasswd -bc /etc/nginx/user.htpasswd  $USERNAME $USERPWD $USERNAME2 $USERPWD2
		echo Done.
	else 
		htpasswd -bc /etc/nginx/user.htpasswd  $USERNAME $USERPWD
		echo Done.
	fi
else
    echo no auth file
fi
