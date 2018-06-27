#!/bin/bash
OLDEST=$(cat `ls -1tr /home/pioneermylo/contrib/logs/*.log* | head -n 1`)
LATEST=$(cat `ls -1tr /home/pioneermylo/contrib/logs/*.log.1 | head -n 1`)
#echo "${OLDEST} / ${LATEST}"
BIGTIME=$(echo "scale=2; (${OLDEST})/(${LATEST})" | bc)
echo "${BIGTIME}:${OLDEST}/${LATEST}"
for i in `ls -1t /home/pioneermylo/contrib/logs/*log*`
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
 echo "${DIFF}:${ONE}/${TWO}"
# echo "Done ${i}"
done 
