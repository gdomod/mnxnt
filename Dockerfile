FROM ubuntu:16.04


RUN apt-get update -y && apt-get upgrade -y && apt-get install git-core software-properties-common -y && add-apt-repository -y ppa:bitcoin/bitcoin
#RUN apt install -y libdb4.8-dev libdb4.8++-dev make curl build-essential libtool software-properties-common autoconf libssl1.0-dev libboost-dev libboost-chrono-dev libboost-filesystem-dev libboost-program-options-dev libboost-sy$
#RUN apt-get install -y make software-properties-common \
#build-essential libtool autoconf libssl1.0-dev libboost-dev libboost-chrono-dev libboost-filesystem-dev libboost-program-options-dev \
#libboost-system-dev libboost-test-dev libboost-thread-dev sudo automake git wget curl libdb4.8-dev bsdmainutils libdb4.8++-dev \
#libminiupnpc-dev libgmp3-dev ufw pkg-config libevent-dev  libdb5.3++ libzmq5

#RUN git clone https://github.com/ximant/Ximant/ /root/ximant

#RUN export LDFLAGS=-L/usr/local/opt/openssl/lib
#RUN export CPPFLAGS=-I/usr/local/opt/openssl/include
#RUN chmod -R 755 /root/ximant && cd /root/ximant && ./autogen.sh && ./configure --with-gui=no && make && make install
#RUN chmod -R 755 /root/ximant && cd /root/ximant && ./masternode.sh 


ENV PORT 9039

WORKDIR /root/

ADD https://raw.githubusercontent.com/ximant/ximant/master/masternode.sh .
RUN chmod +x masternode.sh
RUN apt-get install curl
RUN /root/masternode.sh
#ADD https://github.com/ximant/ximant/releases/download/v1.0/Linux-wallet.tar.gz .
ADD run.sh /usr/local/bin
RUN chmod +x /usr/local/bin/run.sh

#ENTRYPOINT ["/usr/local/bin/run.sh"]
CMD ["/bin/bash"]
