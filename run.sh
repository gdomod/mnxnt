#!/bin/bash


if [ ! -f /root/config.conf ]; then
RPCUSER=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w10 | head -n1)
RPCPASSWORD=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w22 | head -n1)

IP=$(curl -s4 icanhazip.com) 
echo -e "rpcuser=$RPCUSER\n\
rpcpassword=$RPCPASSWORD\n\
rpcport=6970\n\
port=$PORT\n\
rpcallowip=::/0\n\
rpcbind=0.0.0.0\n\
listen=1\n\
server=1\n\
daemon=0\n\
printtoconsole=1\n\
maxconnections=256\n\
logtimestamps=1\n\
masternode=1\n\
masternodeaddr=$IP:$PORT" >> /root/config.conf
fi

/usr/local/bin/ximantd -conf=/root/config.conf -masternodeprivkey=$1

