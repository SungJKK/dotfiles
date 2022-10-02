FROM archlinux:latest

ARG USERNAME=sung
ARG PASSWORD=password
ARG REPOSITORY=/home/${USERNAME}/dotfiles

RUN pacman -Syu --noconfirm
RUN pacman -S base base-devel git --noconfirm

RUN echo thinkpad > /etc/hostname
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
RUN locale-gen
RUN export LANG=C
RUN echo LANG=en_US.UTF-8 > /etc/locale.conf

RUN useradd -m -r -G wheel -s /bin/bash ${USERNAME}
RUN echo "root:${PASSWORD}" | chpasswd
RUN echo "${USERNAME}:${PASSWORD}" | chpasswd
RUN echo '%wheel ALL=(ALL) ALL' | EDITOR='tee -a' visudo

RUN pacman -Syy
RUN pacman -S xdg-user-dirs --noconfirm &&\
    git clone https://aur.archlinux.org/yay.git &&\
    cd yay &&\
    makepkg -si &&\
    cd .. & rm -rf yay


ENV HOME /home/${USERNAME}
WORKDIR /home/${USERNAME}
USER ${USERNAME}
RUN LANG=C xdg-user-dirs-update --force &&\
	mkdir -p ${REPOSITORY}

ENV HOME /home/${USERNAME}
USER ${USERNAME}
WORKDIR ${REPOSITORY}
RUN git clone https://github.com/SungJKK/dotfiles .
