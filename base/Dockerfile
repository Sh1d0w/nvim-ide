FROM alpine:latest as builder

MAINTAINER Sh1d0w <5074917+Sh1d0w@users.noreply.github.com>

WORKDIR /tmp

# Install dependencies
RUN apk add --no-cache \
  git \
  build-base \ 
  cmake \ 
  automake \ 
  autoconf \ 
  libtool \ 
  pkgconf \ 
  coreutils \ 
  curl \ 
  unzip \ 
  gettext-tiny-dev \ 
  && rm -rf /var/cache/apk/*

ENV CMAKE_EXTRA_FLAGS=-DENABLE_JEMALLOC=OFF

# Build nvim from source
RUN git clone https://github.com/neovim/neovim \
  && cd neovim \
  && git checkout stable \
  && make \ 
  && make install

FROM alpine:latest

COPY --from=builder /usr/local/bin /usr/local/bin
COPY --from=builder /usr/local/share/nvim /usr/local/share/nvim

RUN apk add --update \
  diffutils \
  libice \
  libsm \
  libx11 \
  libxt \
  ncurses \
  nodejs \
  npm \
  curl \
  build-base \ 
  git \
  ripgrep \
  bash

# Install Yarn
RUN npm install --global yarn

# User config
ENV UID="1000" \
  UNAME="developer" \
  GID="1000" \
  GNAME="developer" \
  SHELL="/bin/sh" \
  UHOME=/home/developer

# User configuration
RUN apk --no-cache add sudo \
# Create HOME dir
    && mkdir -p "${UHOME}" \
    && chown "${UID}":"${GID}" "${UHOME}" \
# Create user
    && echo "${UNAME}:x:${UID}:${GID}:${UNAME},,,:${UHOME}:${SHELL}" \
    >> /etc/passwd \
    && echo "${UNAME}::17032:0:99999:7:::" \
    >> /etc/shadow \
# No password sudo
    && echo "${UNAME} ALL=(ALL) NOPASSWD: ALL" \
    > "/etc/sudoers.d/${UNAME}" \
    && chmod 0440 "/etc/sudoers.d/${UNAME}" \
# Create group
    && echo "${GNAME}:x:${GID}:${UNAME}" \
    >> /etc/group

WORKDIR $UHOME

USER $UNAME

COPY --chown=developer nvim /home/developer/.config/nvim

# Install Vim Plug
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

RUN nvim +'PlugInstall' +qall

RUN nvim +'CocInstall -sync coc-lists coc-explorer coc-json' +qall


ENV TERM=xterm-256color

ENTRYPOINT ["nvim"]
