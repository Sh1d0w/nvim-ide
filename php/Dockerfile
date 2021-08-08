FROM sh1d0w/alpine-nvim:latest

MAINTAINER Sh1d0w <5074917+Sh1d0w@users.noreply.github.com>

WORKDIR /home/developer

# We will switch to the root user to install
# all needed packages
USER root

# Install PHP 8 and Composer
RUN apk add --no-cache \
  php \
  php-ctype \
  php-tokenizer \
  php-dom \
  php-curl \
  php-json \
  php-gd \
  php-mbstring \
  php-pdo \
  php-pdo_mysql \
  php-xml \
  php-xmlwriter \
  php-intl \
  php-pcntl \ 
  composer && \
  rm -rf /var/cache/apk/*

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

RUN echo "Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}" >> /home/developer/.config/nvim/plugins.vim

RUN nvim +'PlugInstall' +qall

RUN mkdir workspace

RUN echo "export PATH=$HOME/bin:$PATH" >> .bashrc

COPY --chown=developer nvim .config/nvim/php
COPY --chown=developer nvim/coc-settings.json .config/nvim

RUN echo "runtime ./php/init.vim" >> .config/nvim/init.vim

WORKDIR /home/developer/workspace

ENTRYPOINT ["nvim", "./workspace"]
