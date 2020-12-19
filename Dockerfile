# Toolbox Container
# DemiCloud 2020

# This container is interactive
# so stable version isn't important
FROM alpine:latest
WORKDIR /root
# install bash before switching to it as the default shell
RUN apk update \
    && apk upgrade

RUN apk --no-cache add \
    bash \
    bash-doc \
    bash-completion

SHELL ["/bin/bash", "-c"]

RUN apk --no-cache add \
    # Basics
    coreutils{,-doc} \
    findutils{,-doc} \
    grep{,-doc} \
    less{,-doc} \
    man-pages \
    mandoc \
    mandoc-apropos \
    pciutils{,-doc} \
    usbutils{,-doc} \
    util-linux{,-doc,-bash-completion} \
    # Disk Tools
    fio{,-doc} \
    hdparm{,-doc} \
    iotop{,-doc} \
    smartmontools{,-doc} \
    udisks2{,-doc} \
    sgdisk \
    # Network Tools
    curl{,-doc} \
    iftop{,-doc} \
    iperf3{,-doc} \
    nmap{,-doc,-nping,-ncat,-scripts} \
    tcpdump{,-doc} \
    # Other
    htop{,-doc} \
    ncurses \
    neofetch{,-doc} \
    sysstat{,-doc} \
    vim{,-doc} \
    lshw{,-doc}

COPY profile /etc/profile.d/
COPY home /root/
COPY bin /usr/local/bin
RUN chmod -R +x /usr/local/bin
# run an interactive login shell
CMD [ "/bin/bash", "-l" ]