#!/bin/bash

#Input:
#   * CSV of names in col2 and gdrive URLs in col3
#Output: 
#   * text file of names in col2, formatted for text slide show in OBS
#   * pull.sh to pull down all N images, numbering them 3 to N+3

#Clean up old files that we will be generating
rm -f names pull.sh
rm -f processed/*
#create folder for images
mkdir processed
#Hold over from doing some modifications, also so we don't risk junking the orignal file
cp $1 processed.csv
#File count start offset
COUNTER=3

#While processed.csv has lines,
# print name and url for visibility
# print names on a line with 1 empty line for separation
# generate pull.sh with the commands:
#   gdown --fuzzy <raw gdrive link> (returns file named <filename> - <submitter name>
#   EXT=`file *-*| awk -F':' '{ print $1 }' | awk -F'.' '{ print $NF }'` (sets EXT env variable to file's extension)
#   mv *.$EXT processed/<COUNTER>.$EXT (only one file with a - and extension should exist in the folder at a time)


while IFS=',' read -r col1 col2 col3
do
   echo $col2 " | " $col3
   echo $col2 | tr -d '"' >> names
   echo "" >> names
   echo gdown --fuzzy $col3 >> pull.sh
   OUT="EXT=\`file *-*| awk -F':' '{ print \$1 }' | awk -F'.' '{ print \$NF }'\`"
   echo $OUT >> pull.sh
   OUT="\$EXT"
   echo "mv *.$OUT processed/"$COUNTER.$OUT >> pull.sh
   let COUNTER++
done < processed.csv

# convert pull.sh to UNIX format (Cygwin!)
# Run pull.sh
# Returns all images from CSV in the form of N.EXT
dos2unix pull.sh
chmod +x pull.sh
./pull.sh
#Cleanup processed.csv
rm -f processed.csv


