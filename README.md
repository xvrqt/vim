# Overview
This is my personal Vim settings and plugins that I use. I created this repo so that I would have an easy way to recreate my working environment anywhere. If you're new to Vim, the vimrc is well documented and maybe a good place for you to get started. If you have any suggestions to improve this file, please open and issue or a pull request, I'm always open to learning more about the world's best text editor.

![Example of the Vim environment created by this repo](https://github.com/xvrqt/vim/blob/master/imgs/vim-example.png?raw=true)

# Quickstart
Clone this repo and then symlink it to ~/.vim (or just clone it to ~/.vim).
```bash
git clone --recurse-submodules -j8 https://github.com/xvrqt/vim.git ~/.vim
```

# Plugins
This will also install several plugins for Vim

- [Goyo](https://github.com/junegunn/goyo.vim) - Distraction free writing
- [NerdTree](https://github.com/preservim/nerdtree) - File browser
- [Rust](https://github.com/rust-lang/rust.vim) - Rust syntax checking for Syntastic
- [SuperTab](https://github.com/ervandew/supertab) - Tab completion customization
- [Syntastic](https://github.com/vim-syntastic/syntastic) - Syntax highlighting, error checking
- [Airline](https://github.com/vim-airline/vim-airline) - Sexy status bar formatting
- [Commentary](https://github.com/tpope/vim-commentary) - Commands for commenting out sections of code
- [Fugitive](https://github.com/tpope/vim-commentary) - Git commands from inside Vim
- [GitGutter](https://github.com/airblade/vim-gitgutter) - Git diff symbols next to the numbers

# Maintenance
This repo uses submodules for the plugins. Since I have been diagnosed with the dumb, here's how you add, remove and update submodules.

## Add a Submodule
```bash
git submodule add <repo URL> vim/pack/xvrqt/start/<name>
```

## Remove a Submodule
```bash
git submodule deinit vim/pack/xvrqt/start/<name>
git rm -rf vim/pack/xvrqt/start/<name>
rm -rf .git/modules/vim/pack/xvrqt/start/<name>
```

## Update All Submodules
```bash
git submodule update --remote --merge
```

-----

Don't forget to follow all these up with a:
```bash
git commit
```

