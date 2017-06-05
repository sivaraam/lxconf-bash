# Temporary script to fix typo

files=`ls | grep '[^\<temp.sh\>]'`

for file in $files
do
  # Get output in temporary file as sed cannot redirect
  # output to file which is it reading from.
  # That's because pipelines are set-up before command execution
  # and >$file truncates the file

  # Work done!
  # sed '{s_\./common_common_}' <$file >"$file"'~'
  # mv "$file"'~' $file

  chmod u+x $file
done
