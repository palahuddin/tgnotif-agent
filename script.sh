#!/bin/bash

function logging() {
        msg=$1
        CT=$(TZ=Asia/Jakarta date '+%d/%m/%Y_%H.%M.%S')
        echo "GMT+7 ${CT}: ${msg}"
}


project=$1

if [ -z "$project" ];then
  echo "tgnotif-agent <arg[0]> <arg[1]>"
  exit 1
fi

phase=$2
ids=`aws codebuild list-builds-for-project --project-name $project | jq -r '.ids[0]'`
status=`aws codebuild batch-get-builds --ids ${ids} |jq -r '.builds[].phases[].phaseStatus' |grep FAILED`
API_TOKEN="<telegram bot token>"
CHAT_ID="<chat>"
AUTHOR=`git log -1 |grep Author |awk {'print $2" "$3'}`

case $phase in
  start)
    MESSAGE=$(
    logging 
    echo "- PROJECT NAME: $1 "
    echo " [ BUILD ID: $ID ]"
    echo " [ AUTHOR: $AUTHOR ]"
    echo " "
    echo " "
    echo '[{"status" : "build starting..."}]')
    curl -s -X POST https://api.telegram.org/bot$API_TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"
    exit 1
    ;;

  prebuild)
    if [ -z "$status" ];then
        continue
    else
        MESSAGE=$(
        logging 
        echo "- PROJECT NAME: $1 "
        echo " [ BUILD ID: $ID ]"
        echo " [ AUTHOR: $AUTHOR ]"
        echo " "
        aws codebuild batch-get-builds --ids ${ids} |jq -r '.builds[].phases[] | select(.phaseStatus != null) |select(.phaseStatus | contains("FAILED"))')
        curl -s -X POST https://api.telegram.org/bot$API_TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"
    fi
    ;;
  install)
    if [ -z "$status" ];then
        continue
    else
        MESSAGE=$(
        logging 
        echo "- PROJECT NAME: $1 "
        echo " [ BUILD ID: $ID ]"
        echo " [ AUTHOR: $AUTHOR ]"
        echo " "
        aws codebuild batch-get-builds --ids ${ids} |jq -r '.builds[].phases[] | select(.phaseStatus != null) |select(.phaseStatus | contains("FAILED"))')
        curl -s -X POST https://api.telegram.org/bot$API_TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"
    fi
    ;;
  finish)
    if [ -z "$status" ];then
        MESSAGE=$(
        logging 
        echo "- PROJECT NAME: $1 "
        echo " [ BUILD ID: $ID ]"
        echo " [ AUTHOR: $AUTHOR ]"
        echo " "
        echo " "
        echo '[{"status" : "all build phases succeded"}]')
        curl -s -X POST https://api.telegram.org/bot$API_TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"
    else
        MESSAGE=$(
        logging 
        echo "- PROJECT NAME: $1 "
        echo " [ BUILD ID: $ID ]"
        echo " [ AUTHOR: $AUTHOR ]"
        echo " "
        aws codebuild batch-get-builds --ids ${ids} |jq -r '.builds[].phases[] | select(.phaseStatus != null) |select(.phaseStatus | contains("FAILED"))')
        curl -s -X POST https://api.telegram.org/bot$API_TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"
    fi
    ;;
  *)
    echo "tgnotif-agent <arg[0]> <arg[1]>"
    ;;
esac



