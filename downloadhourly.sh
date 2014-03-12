#!/bin/sh
#
#Uses the API from
#http://tidesandcurrents.noaa.gov/api/
# downloads each year of data into a csv file
# Files are moved into a directory with the stationID
# file names are the year of the data
#
if [ $# -ge 2 ]; then
STATION=$1
YEAR=$2
echo "Retreiving data from station $STATION for the year $YEAR"
else
 echo "You must give a station number and year - Aborting"
 echo "Correct usage is"
 echo "$0 stationid year"
 exit 1
fi

wget http://tidesandcurrents.noaa.gov/api/datagetter? --post-data="product=hourly_height&application=NOS.COOPS.TAC.WL&begin_date=${YEAR}0101&end_date=${YEAR}1231&datum=IGLD&station=${STATION}&time_zone=GMT&units=metric&format=csv"
mv datagetter\? $3/$STATION/$YEAR.dat
sed -i 's/^Date Time/#Year, Month, Day, Hour, Minute/g' $3/$STATION/$YEAR.dat
sed -i 's/,,/,NaN, /g' $3/$STATION/$YEAR.dat
sed -i 's/,/, /g' $3/$STATION/$YEAR.dat
sed -i 's/,  /, /g' $3/$STATION/$YEAR.dat

