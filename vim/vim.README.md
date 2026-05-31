# vim
Repository containing vim configurations



## Configure Basic Vim:

### Configure the directory structure:
```bash
mkdir -p .vim/{autoload/,backup/,colors/,plugged/}
```

```bash
.vim/
├── autoload
├── backup
├── colors
└── plugged
```

https://github.com/junegunn/vim-plug

### Create .vimrc

```bash
touch .vimrc
```

```bash
cp -v .vimrc ~/.vimrc
```

```vim
:source ~/.vimrc
```

```vim
:PlugInstall
```



Samples taken from:

[Free Codecamp](https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/)
