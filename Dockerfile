FROM ubuntu:16.04


RUN apt-get update -y && apt-get upgrade -y && apt-get install git-core software-properties-common -y && add-apt-repository -y ppa:bitcoin/bitcoin

ENV PORT 9039

WORKDIR /root/

ADD https://raw.githubusercontent.com/ximant/ximant/master/masternode.sh .
RUN chmod +x masternode.sh
RUN apt-get install curl
RUN /root/masternode.sh
#ADD https://github.com/ximant/ximant/releases/download/v1.0/Linux-wallet.tar.gz .
ADD run.sh /usr/local/bin
RUN chmod +x /usr/local/bin/run.sh

ENTRYPOINT ["/usr/local/bin/run.sh"]
CMD []
