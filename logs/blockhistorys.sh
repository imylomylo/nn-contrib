#!/bin/bash
cat chaintimes.csv.1 | while read line
do
#  echo $line
      chainname="KMD"
      longestchainhash=$(echo ${line} | awk -F ',' '{print $3}')
      longestchainheight=$(echo ${line} | awk -F ',' '{print $2}')
      longestchaintime=$(echo ${line} | awk -F ',' '{print $1}')
      x10blockhash=$(echo ${line} | awk -F ',' '{print $5}')
      x10blockheight=$(echo ${line} | awk -F ',' '{print $6}')
      x10blocktime=$(echo ${line} | awk -F ',' '{print $4}')
      x10timesince=$(echo ${line} | awk -F ',' '{print $7}')
      x20blockhash=$(echo ${line} | awk -F ',' '{print $9}')
      x20blockheight=$(echo ${line} | awk -F ',' '{print $10}')
      x20blocktime=$(echo ${line} | awk -F ',' '{print $8}')
      x20timesince=$(echo ${line} | awk -F ',' '{print $11}')
      x30blockhash=$(echo ${line} | awk -F ',' '{print $13}')
      x30blockheight=$(echo ${line} | awk -F ',' '{print $14}')
      x30blocktime=$(echo ${line} | awk -F ',' '{print $12}')
      x30timesince=$(echo ${line} | awk -F ',' '{print $15}')
      x50blockhash=$(echo ${line} | awk -F ',' '{print $17}')
      x50blockheight=$(echo ${line} | awk -F ',' '{print $18}')
      x50blocktime=$(echo ${line} | awk -F ',' '{print $16}')
      x50timesince=$(echo ${line} | awk -F ',' '{print $19}')
      x100blockhash=$(echo ${line} | awk -F ',' '{print $21}')
      x100blockheight=$(echo ${line} | awk -F ',' '{print $22}')
      x100blocktime=$(echo ${line} | awk -F ',' '{print $20}')
      x100timesince=$(echo ${line} | awk -F ',' '{print $23}')
      echo "${x100blockheight} ${x50blockheight} ${x30blockheight} ${x20blockheight} ${x10blockheight} ${longestchainheight}"
echo '
curl -X POST https://o8vuy7md6i.execute-api.us-east-1.amazonaws.com/dev/timeanalysis -d " \
{ \
\"chainname\": \"'${chainname}'\", \
\"longestchainhash\": \"'${longestchainhash}'\", \
\"longestchainheight\": '${longestchainheight}', \
\"longestchaintime\": '${longestchaintime}', \
\"x10blockheight\": '${x10blockheight}' \
\"x10blockhash\": \"'${x10blockhash}'\" \
\"x10blocktime\": '${x10blocktime}' \
\"x10timesince\": '${x10timesince}' \
\"x20blockheight\": '${x20blockheight}' \
\"x20blockhash\": \"'${x20blockhash}'\" \
\"x20blocktime\": '${x20blocktime}' \
\"x20timesince\": '${x20timesince}' \
\"x30blockheight\": '${x30blockheight}' \
\"x30blockhash\": \"'${x30blockhash}'\" \
\"x30blocktime\": '${x30blocktime}' \
\"x30timesince\": '${x30timesince}' \
\"x50blockheight\": '${x50blockheight}' \
\"x50blockhash\": \"'${x50blockhash}'\" \
\"x50blocktime\": '${x50blocktime}' \
\"x50timesince\": '${x50timesince}' \
\"x100blockheight\": '${x100blockheight}' \
\"x100blockhash\": \"'${x100blockhash}'\" \
\"x100blocktime\": '${x100blocktime}' \
\"x100timesince\": '${x100timesince}' \
} \
"
'
  #break
curl -X POST https://o8vuy7md6i.execute-api.us-east-1.amazonaws.com/dev/timeanalysis -d " \
{ \
\"chainname\": \"${chainname}\", \
\"longestchainhash\": \"${longestchainhash}\", \
\"longestchainheight\": ${longestchainheight}, \
\"longestchaintime\": ${longestchaintime}, \
\"x10blockheight\": ${x10blockheight}, \
\"x10blockhash\": \"${x10blockhash}\", \
\"x10blocktime\": ${x10blocktime}, \
\"x10timesince\": ${x10timesince}, \
\"x20blockheight\": ${x20blockheight}, \
\"x20blockhash\": \"${x20blockhash}\", \
\"x20blocktime\": ${x20blocktime}, \
\"x20timesince\": ${x20timesince}, \
\"x30blockheight\": ${x30blockheight}, \
\"x30blockhash\": \"${x30blockhash}\", \
\"x30blocktime\": ${x30blocktime}, \
\"x30timesince\": ${x30timesince}, \
\"x50blockheight\": ${x50blockheight}, \
\"x50blockhash\": \"${x50blockhash}\", \
\"x50blocktime\": ${x50blocktime}, \
\"x50timesince\": ${x50timesince}, \
\"x100blockheight\": ${x100blockheight}, \
\"x100blockhash\": \"${x100blockhash}\", \
\"x100blocktime\": ${x100blocktime}, \
\"x100timesince\": ${x100timesince} \
} \
"
sleep 0.5
done
