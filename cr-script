#! /bin/bash
# Script for logging into Cyberoam
#
# Usage: {script-name} <logout-parameter>
#
# Behaviour:
#   * Logs in when no parameter given
#   * Logs out if a single parameter is passed
#   * Requires the CR_CLIENT_LOCATION environment variable to be declared
#     When not declared, asks for location and adds command to export CR_CLIENT_LOCATION to .bashrc
#

. ./common-script

USERNAME=171037-kaartic

# If CR_CLIENT_LOCATION isn't defined get it's location
# Further, add comand to export it to .bashrc
if [ ! $CR_CLIENT_LOCATION ]
then
  echo 'CR_CLIENT_LOCATION environment variable not defined.'
  while [ -z $location ] || [ ! -d $location ]
  do
    read -p 'Enter directory in which crclient executable exists: ' location
    if [ ! -z $location ] && [ ! -d $location ]
    then
      echo "Directory $location doesn't exist. Please, try again."
    fi
  done

  # Add command to export variable in future
  add_to_bashrc '\n# Location of crclient executable'
  add_to_bashrc "export CR_CLIENT_LOCATION=$location"
  notify 'Command to export CR_CLIENT_LOCATION has been added to your .bashrc file successfully!'

  # TODO Try to export it for current session
  # Temporarily use local variable
  CR_CLIENT_LOCATION=$location
fi

# Change to folder containing executable as it's execution required it (!!!)
cd $CR_CLIENT_LOCATION

# Log in if no parameters are given
if [ $# -eq 0 ]
then
  echo 'Attempting to log-in...'
 ./crclient -u $USERNAME
fi

# Log out if ONE parameter is passed
if [ $# -eq 1 ]
then
  echo 'Attempting to log out...'
  ./crclient -l
  ./crclient -l $USERNAME
fi
