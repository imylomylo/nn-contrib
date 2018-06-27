#!/bin/bash
OLDEST=$(cat `ls -1tr *.log* | head -n 1`)
LATEST=$(cat `ls -1tr *.log.1 | head -n 1`)
#echo "${OLDEST} / ${LATEST}"
BIGTIME=$(echo "scale=2; (${OLDEST})/(${LATEST})" | bc)
echo "BIGTIME ${BIGTIME}"
for i in `ls -1t *log*`
do
# echo "Loading ${i}"
 TWO=${ONE}
 ONE=`cat ${i}`
 if [ "${ONE}" == "" ] || [ "${TWO}" == "" ]
 then
  continue
 fi
# echo "Latest: ${ONE} / Previous: ${TWO}"
 DIFF=$(echo "scale=4; (${ONE})/(${TWO})" | bc)
 echo "${DIFF}"
# echo "Done ${i}"
done 
