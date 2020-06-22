FROM ubuntu:latest

RUN apt-get update && apt-get install -y wget

WORKDIR /app
ENV DIGIBYTE=7.17.2
RUN wget https://github.com/digibyte/digibyte/releases/download/v${DIGIBYTE}/digibyte-${DIGIBYTE}-x86_64-linux-gnu.tar.gz
RUN tar -xvzf digibyte-${DIGIBYTE}-x86_64-linux-gnu.tar.gz

WORKDIR /app/digibyte-${DIGIBYTE}/bin
# P2P PORT
EXPOSE 12024 
# RPC PORT
EXPOSE 14022

ENTRYPOINT [ "./digibyted" ]
CMD ["-server=1", "-listen=1", "-rpcuser=$RPCUSER", "-rpcpassword=$RPCPASS", "-rpcallowip=0.0.0.0/0", "-rpcbind=0.0.0.0", "-datadir=/var/digibyte"]