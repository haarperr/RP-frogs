#!/bin/bash
echo "***********************************************************"
echo `date '+%d-%B-%Y_%H:%M:%S'` " - Starting procedure..."
sleep 1
echo `date '+%d-%B-%Y_%H:%M:%S'` " - killing screen game server..."
screen -X -S "Game Server" kill
sleep 5
echo `date '+%d-%B-%Y_%H:%M:%S'` " - Starting server..."
screen -S "gameserver"
sleep 1
bash /root/RunServer.sh
sleep 15
echo `date '+%d-%B-%Y_%H:%M:%S'` " - End procedure"
