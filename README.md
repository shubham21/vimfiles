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
$ ln -s $PWD/vimrc $HOME/.vimrc
```

That's it. It's as easy as that.


### You might need to install a few Pre-requisites

#### 1. vim with lua support

You need to compile vim with `+lua` support as this config uses neocomplete.
Follow the following commands to compile vim from source with `+lua` support.

```sh
sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common

sudo apt-get build-dep vim-gnome

sudo apt-get install liblua5.1-dev luajit libluajit-5.1 \
    python-dev ruby-dev libperl-dev mercurial libncurses5-dev \
    libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev \
    libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev

sudo rm -rf /usr/local/share/vim

sudo rm /usr/bin/vim

sudo mkdir /usr/include/lua5.1/include
sudo mv /usr/include/lua5.1/*.h /usr/include/lua5.1/include/

sudo ln -s /usr/bin/luajit-2.0.0-beta9 /usr/bin/luajit

cd ~
hg clone https://code.google.com/p/vim/
cd vim/src
make distclean
./configure --with-features=huge \
            --enable-rubyinterp \
            --enable-largefile \
            --disable-netbeans \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp \
            --enable-luainterp \
            --with-luajit \
	    --enable-gui=auto \
            --enable-fail-if-missing \
            --with-lua-prefix=/usr/include/lua5.1 \
            --enable-cscope
make
sudo make install
```

#### 2. Jedi for python autocompletion

This is as easy as doing:

```sh
$ pip install jedi
```

#### 3. Patched fonts for beautiful statusline
```sh
$ cd $HOME/vimfiles/patched-fonts
$ ./install.sh
```

> Note: Remember to change your terminal's font to one of the patched fonts.

#### 4. Change your bash/zsh to look like Airline
Add the following line to your `.bashrc` or `.zshrc`

```
source $HOME/vimfiles/shell.sh
```
