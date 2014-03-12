#!/bin/bash
#
# Takes as argument the parent directory of the data
for station in 9099064 9099018 9099090 9099044 9099004
do
 for year in {1980..2014..1}
 do
  echo $year
 ./scripts/downloadhourly.sh $station $year $1
 done
 if [ -f $1/$station/1980-2014.dat ]; then
  rm $1/$station/1980-2014.dat
 fi
 cat $1/$station/????.dat >> $1/$station/1980-2014.dat
 sed -i '/^#/d' $1/$station/1980-2014.dat
 sed 's/-/ /g' < $1/$station/1980-2014.dat > $1/$station/1980-2014.mat.txt
 sed -i 's/,/ /g' $1/$station/1980-2014.mat.txt
 sed -i 's/:/ /g' $1/$station/1980-2014.mat.txt
done
