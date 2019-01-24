#!/bin/bash

PCKG_MANAGER=apt

# Color code Git information in the terminal 
$PCKG_MANAGER install git
# git config --global color.ui true  # not sure if this works in linux yet

echo "Please type in your full name, ie. Rowdy McFlurry: \c"
read fullName
echo "The username you entered is: $fullName"
git config --global user.name $fullName

echo "Please type in your email: \c"
read email
echo "The username you entered is: $email"
git config --global user.email $email