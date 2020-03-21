#! /bin/bash
 

# Prompt for directory name.
read -p "Enter directory name: " MAINDIR


# To correct unwanted space 
# function correctUnwantedSpace () {
#   sed -i 's|  (| (|g' $FILE
#   sed -i 's|)  |) |g' $FILE
#   sed -i 's|  }| }|g' $FILE
#   sed -i 's|{  |{ |g' $FILE
#   sed -i 's|=  {|= {|g' $FILE
#   sed -i 's|,  |, |g' $FILE
#   sed -i 's|:  |: |g' $FILE
#   sed -i 's| ;|;|g' $FILE
#   sed -i 's| \.|.|g' $FILE
#   sed -i 's| }|}|g' $FILE
# }


# # To add Indentation
# function addIndentation () {
#   sed -i 's|(| (|g' $FILE
#   sed -i 's|)|) |g' $FILE
#   sed -i 's|}| }|g' $FILE
#   sed -i 's|{|{ |g' $FILE
#   sed -i 's|={|= {|g' $FILE
#   sed -i 's|,|, |g' $FILE
#   sed -i 's|:|: |g' $FILE
#   correctUnwantedSpace
# }


# Add Indentation using RegEx pattern
function addIndentation () {
  sed -i '/[a-z](){/ s/(){/ () {/g' $FILE
  sed -i '/{[a-z]/ s/{/{ /g' $FILE
  sed -i '/["]}/ s/}/ }/g' $FILE
}

# Check if the directory entered exists. 
# Then find & store all the files with '.js' extension.
# Then invoke the function declared above to add indentation. 

if [ -e "${MAINDIR}" ] 
then
  JSFILES=$(find ./$MAINDIR -type f -name '*.js')
  for FILE in ${JSFILES}
    do
    addIndentation
  done
else 
  echo "Directory does not exists in current location!"
fi
