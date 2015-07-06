# Vim Configuration

Feel free to use, modify and distribute.


## Get Repo

Clone and setup the repo

```sh
$ cd $HOME
$ git clone https://github.com/xk0nsid/vimfiles.git
$ cd vimfiles
$ git submodule init
$ git submodule update
```

> You can also do the above in one step

```sh
$ cd $HOME
$ git clone --recursive https://github.com/xk0nsid/vimfiles.git
```

## Install config

```sh
$ cd $HOME/vimfiles
$ ln -s $PWD/vim $HOME/.vim
$ ln -s $PWD/.vimrc $HOME/.vimrc
```

That's it. It's as easy as that.


### You might need to install a few Pre-requisites

#### 1. vim with lua support

You need to compile vim with `+lua` support as this config uses neocomplete.
If you don't know how to compile vim you can follow
[this](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)
instructions. They are pretty self-explanatory.

#### 2. Jedi for python autocompletion

This is as easy as doing:

```sh
$ pip install jedi
```
