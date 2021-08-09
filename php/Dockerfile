FROM sh1d0w/alpine-nvim:latest

MAINTAINER Sh1d0w <5074917+Sh1d0w@users.noreply.github.com>

WORKDIR /home/developer

# We will switch to the root user to install
# all needed packages
USER root

# Install PHP 8 and Composer
RUN apk add --no-cache \
  php8 \
  php8-ctype \
  php8-tokenizer \
  php8-dom \
  php8-curl \
  php8-json \
  php8-gd \
  php8-mbstring \
  php8-pdo \
  php8-pdo_mysql \
  php8-xml \
  php8-xmlwriter \
  php8-intl \
  php8-pcntl \ 
  php8-phar \
  php8-posix \
  python3 \
  py3-pip \
  py3-pynvim \
  composer && \
  rm -rf /var/cache/apk/*

RUN rm /usr/bin/php && ln -s /usr/bin/php8 /usr/bin/php
# Switch back as the developer user
USER developer

# Prepare directories where we will install some extra tools
RUN mkdir -p /home/developer/tools/php-cs-fixer && \ 
  mkdir /home/developer/bin

# Install PHP Actor
RUN git clone https://github.com/phpactor/phpactor.git tools/phpactor && \ 
  cd tools/phpactor && \ 
  composer install && \
  cd /home/developer/bin && \
  ln -s /home/developer/tools/phpactor/bin/phpactor phpactor

# Install php-cs-fixer
RUN composer require --working-dir=tools/php-cs-fixer friendsofphp/php-cs-fixer && \
  cd /home/developer/bin && \
  ln -s /home/developer/tools/php-cs-fixer/vendor/bin/php-cs-fixer php-cs-fixer

# Install Coc plugins
RUN nvim +'CocInstall -sync coc-phpactor coc-php-cs-fixer' +qall

COPY --chown=developer nvim/plugins.vim .config/nvim/plugins.vim

RUN nvim +'PlugInstall' +qall

RUN mkdir -p .config/coc/extensions/@yaegassy/coc-phpstan-data && \
  chown developer:developer .config/coc/extensions/@yaegassy/coc-phpstan-data

# RUN nvim +'CocCommand phpstan.download' +qall

RUN composer global require phpstan/phpstan

RUN mkdir workspace

RUN echo "export PATH=$HOME/bin:$HOME/.composer/vendor/bin:$PATH" >> .bashrc

COPY --chown=developer nvim .config/nvim/php
COPY --chown=developer nvim/coc-settings.json .config/nvim

RUN echo "runtime ./php/init.vim" >> .config/nvim/init.vim

WORKDIR /home/developer/workspace

ENTRYPOINT ["nvim", "./workspace"]
