#!/bin/bash
curl -s -o ~/contrib/stats/summary.json https://komodostats.com/api/notary/summary.json
for ASSET in `cat ~/komodo/src/assetchains | grep komodo_asset |grep -v "function" | grep -v "PIZZA\|BEER" | awk '{print $2}'`
do
TMP_STATS_BLOCK=$(cat ~/contrib/stats/summary.json | jq --arg a "${ASSET}" '.[] | select(.ac_name==$a)|.blocks')
STATS_BLOCK=$((${TMP_STATS_BLOCK} + 0))
MY_BLOCK=$(komodo-cli -ac_name=${ASSET} getinfo | jq '.blocks')
if [ ${STATS_BLOCK} -ne ${MY_BLOCK} ]
then
  echo "BLOCK DIFFERENCE FOR ${ASSET}: ${STATS_BLOCK} AND MY ${MY_BLOCK}"
  if [ ${STATS_BLOCK} -ne $(expr ${MY_BLOCK} - 1) ]
  then
    echo ">>>>>>>ERROR: ${ASSET} ${STATS_BLOCK} AND ${MY_BLOCK}"
  fi
else
  echo "OK: ${ASSET}: Stats ${STATS_BLOCK} vs MY ${MY_BLOCK}"
fi
done
