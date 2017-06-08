FROM logankoester/archlinux
MAINTAINER Maciej Pijanowski <maciej.pijanowski@3mdeb.com>

RUN pacman -Sy --noconfirm && \
    pacman -S archlinux-keyring --noconfirm && \
    pacman -Su --noconfirm

RUN pacman -S --noconfirm \
    base-devel \
    sudo \
    bc \
    docbook-xml \
    docbook-xsl \
    libxml2 \
    libxslt \
    xmlto

RUN useradd builder && \
    echo "builder ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user && \
    chmod 0440 /etc/sudoers.d/user

USER builder

ENTRYPOINT sudo chown builder: /build && cd  /build && makepkg -s
