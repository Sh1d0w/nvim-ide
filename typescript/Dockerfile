FROM sh1d0w/alpine-nvim:latest

WORKDIR /home/developer

RUN nvim +'CocInstall -sync coc-prettier coc-eslint coc-cssmodules coc-tsserver' +qall

COPY --chown=developer nvim .config/nvim/typescript

COPY --chown=developer nvim/coc-settings.json .config/nvim

COPY --chown=developer nvim/memos.json .config/coc

RUN echo "runtime ./typescript/init.vim" >> .config/nvim/init.vim

RUN mkdir workspace

WORKDIR /home/developer/workspace

ENTRYPOINT ["nvim", "./workspace"]
