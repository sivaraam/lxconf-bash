#! /bin/bash
# Script that sets up some basic things like
# installing helper scripts, important packages
# and configuring Git etc.

# source: https://stackoverflow.com/a/246128
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

. $DIR/lib/common-script

setup_scripts=`get_files_with_path ./setup`

for setup_script in $setup_scripts
do
  bash $setup_script
done
