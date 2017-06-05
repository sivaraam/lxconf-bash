# File use for common cleanup operations
# that affescts multiple files

. common

# Function that wraps sed substitute command. 
# It gets the following as parameters,
# regexp - 1 (assumes regexp to be escaped as required)
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

  sed 's/'"$1"'/'"$2"'/' <$input_file >$output_file

  mv $output_file $input_file
}
