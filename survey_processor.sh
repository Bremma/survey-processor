#!/bin/bash

#Process:

# 1. Chunk file into comma separated cat names and picture list
# 2. Print Cat names into a file
# 3. Download images from google and rename with numbers
rm -f names pull.sh
rm -f processed/*
mkdir processed
sed s/open?/uc?/ $1 > processed.csv
COUNTER=3

while IFS=',' read -r col1 col2 col3
do
   echo $col2 " | " $col3
   echo $col2 | tr -d '"' >> names
   echo "" >> names
   echo "" >> names
   echo gdown $col3 >> pull.sh
   OUT="EXT=\`file *-*| awk -F':' '{ print \$1 }' | awk -F'.' '{ print \$NF }'\`"
   echo $OUT >> pull.sh
   OUT="\$EXT"
   echo "mv *.$OUT processed/"$COUNTER.$OUT >> pull.sh
   let COUNTER++
done < processed.csv

dos2unix pull.sh
chmod +x pull.sh
./pull.sh
rm -f processed.csv

