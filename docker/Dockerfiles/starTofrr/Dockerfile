FROM star_v2:latest

RUN rm -rf quagga-1.2.4 && \
    cd /lib && \
    rm -f ./libospf.* ./libzebra.* && \
    cd /usr/local/bin && rm vtysh && \
    cd /usr/local/sbin && rm ./* && \
    cd /usr/local/etc && rm ./*

RUN apt update && apt install -y apt-transport-https
    
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak 
COPY ./sources.list /etc/apt/sources.list

# RUN curl -s https://deb.frrouting.org/frr/keys.gpg | tee /usr/share/keyrings/frrouting.gpg > /dev/null && \
#     FRRVER="frr-stable" && \
#     echo deb '[signed-by=/usr/share/keyrings/frrouting.gpg]' https://deb.frrouting.org/frr xenial $FRRVER | tee -a /etc/apt/sources.list.d/frr.list && \
#     apt update && apt install -y frr frr-pythontools

