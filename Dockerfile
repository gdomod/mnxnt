RUN apt-get update && apt-get install curl -y
ADD https://github.com/ximant/ximant/releases/download/v1.0/Linux-wallet.tar.gz .
RUN tar -xvf Linux-wallet.tar.gz --one-top-level=/usr/local --strip 1

ENV PORT 9039

ADD run.sh /usr/local/bin
RUN chmod +x /usr/local/bin/run.sh

ENTRYPOINT ["/usr/local/bin/run.sh"]

CMD []

