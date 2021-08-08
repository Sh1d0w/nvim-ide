<h1 align="center">
  <br>
  <a href="https://github.com/Sh1d0w/nvim-ide"><img src="https://github.com/Sh1d0w/nvim-ide/blob/master/images/nvim.png?raw=true" alt="Neovim IDE" width="200"></a>
  <br>
  Neovim IDE 
  <br>
</h1>

<h4 align="center">Pre-configured IDE docker images for many languages.</h4>

<p align="center">
  <a href="https://badge.fury.io/for/gh/Sh1d0w/nvim-ide">
    <img src="https://badge.fury.io/gh/Sh1d0w%2Fnvim-ide.svg"
         alt="Version">
  </a>
</p>

<p align="center">
  <a href="#motivation">Motivation</a> •
  <a href="#available-images">Available images</a> •
  <a href="#features">Features</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#configuration">Configuration</a> •
  <a href="#license">License</a>
</p>

![screenshot](https://github.com/Sh1d0w/nvim-ide/blob/master/images/preview.png?raw=true)

## Motivation

This is my personal Neovim configuration that I use for different languages. I've decided to dockerize it in order to make it more portable and easy to use on different machines.

## Features

TODO

## Available images

- [sh1d0w/alpine-nvim](https://hub.docker.com/repository/docker/sh1d0w/alpine-nvim) - Base image with no language specific plugins (doc TODO)
- [sh1d0w/nvim-typescript](https://hub.docker.com/repository/docker/sh1d0w/nvim-typescript) - Fully configured IDE for React/Typescript development (doc TODO)

More images will be available soon for PHP, Go, Flutter

## How To Use

First you need to install [Docker](https://www.docker.com) on your machine. Follow the instructions on the official website to install it for your platform.

After that you can setup bash alias with your prefered IDE. Open `~/.bashrc` or `~/.zshrc` if you are using ZSH and add those lines:

```bash
alias ed='f(){ docker run -it --rm -v $(cd $(dirname $1); pwd)/$(basename $1):/home/developer/workspace sh1d0w/nvim-typescript; unset -f f; }; f'
alias ef='f(){ docker run -it --rm -v $(cd $(dirname $1); pwd)/$(basename $1):/home/developer/workspace/$(basename $1) sh1d0w/nvim-typescript; unset -f f; }; f'
```

Here we are creating two aliases:

- `ed` - to edit a directory. Usage `ed /path/to/dir`
- `ef` - to edit a single file. Usage `ef /path/to/file.txt`

## Configuration

Configure themes etc.

TODO

## License

MIT
