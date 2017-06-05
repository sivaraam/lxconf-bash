# File use for common cleanup operations
# that affescts multiple files

. common-script

# Function that wraps sed substitute command. 
# It gets the following as parameters,
# word - 1 (assumes word to be escaped as required)
# substituition - 2
# input file - 3 (which is also, effectively, the output)
#
# Effectively, it replaces the text in input file
# matching the regexp with the substituition text
# and  stores the output in the same file.
sed_substitute() {
  if [ $# -ne 3 ]
  then
    error $FUNCTION_ERR_MSG
  fi

  input_file=$3
  output_file='.'"$input_file"'~'
  
  # Copy input file under a different name to
  # preserve permissions while also storing sed output
  cp $input_file $output_file

  sed 's/\<'"$1"'\>/'"$2"'/' <$input_file >$output_file

  mv $output_file $input_file
}


# Cleanup vim-script
vim_cleanup() {
  VIM_CONFIG='vim-config'
  found=`cat $VIM_CONFIG | grep -o '[a-z]*_size'`
  for found_instance in $found
  do
    changed_instance=`echo $found_instance | tr a-z A-Z`
    sed_substitute $found_instance $changed_instance $VIM_CONFIG
  done
  echo "Vim cleanup success"
}

vim_cleanup
