## Introduction

First a quick thanks to everyone who has posted their `.vimrc` files and vim setups online so wannabe vim users like me can learn and copy from :o). Some of the more helpful vim setups I have stumbled across include:

* Good ideas from Steve Francia's vim setup at [spf13-vim](https://github.com/spf13/spf13-vim)
* Lots of tips and tricks from [Stackoverflow](http://stackoverflow.com/questions/tagged/vim?sort=votes&pagesize=50)
* The vim setup from [Janus](https://github.com/carlhuda/janus) (specifically for [MacVim](http://code.google.com/p/macvim/))

----

## Installation

For myself I store everything in the  `.vim` folder in my home directory. Though in theory you could clone the project anywhere, you will just have to create an additional symlink from `.vim` to the project folder. To get started run the following:

	git clone git://github.com/cengebretson/vim.git ~/.vim

Create a symlink to the new `.vim` directory (or wherever you cloned the project) for the `.vimrc` file.

	ln -s ~/.vim/vimrc ~/.vimrc
	
For the most part I try to use the amazing [pathogen](https://github.com/tpope/vim-pathogen) and git submodules maintain the different vim plugins that I use. The easiest way to load and update all of the git submodules is to run the following commands (assumes you are using `.vim` for your vim setup):

	cd ~/.vim
	git submodule init
	git submodule update

#### Updating Submodules

To later update the submodules to the their latest versions from github you can run the following command.

	git submodule -q foreach git pull -q origin master

#### Adding new Submodules

To add a new submodule to to the pathogen bundle folder you can use the following steps...

	git submodule add https://github.com/cengebretson/super-duper-vim-plugin.git bundle/super-duper
	git submodule init
	git submodule update

#### Removing unwanted Submodules

To remove a submodule that you don't want to use, follow the steps below.

1. Delete the relevant line from the `.gitmodules` file.
2. Delete the relevant section from `.git/config` file.
3. Run `git rm --cached path_to_submodule` (with no trailing slash).
4. Commit your changes and delete the now untracked submodule files.

----

## Custom Key Mappings

Some of the custom key mappings that I have been using...

----

## Plugins

A couple of notes on some of the vim plugins and bundles that are included.

----

## Other Notes

Currently I use vim mostly with [MacVim](http://code.google.com/p/macvim/) but in the not so distant future I hope to put some time into making this setup a little more cross platform friendly.

Another thing I did with my `.vimrc` setup is turn backups and swap files off since I figure this is what version control is for.

The font I ended up using is called `Inconsolata` which is a free font created by Raph Levien. The website [Hivelogic](http://hivelogic.com/) has a great [article](http://hivelogic.com/articles/top-10-programming-fonts/) on some of the best programming fonts.

Vim feels like one of those tools that you could work with for years but still learn new things every day. Here are some of the sites that have helped me:

* Tips from [www.zinkwazi.com](http://www.zinkwazi.com/unix/notes/vimtips.html)
* Favorite vim tricks from [Stackoverflow](http://stackoverflow.com/questions/726894/what-are-the-dark-corners-of-vim-your-mom-never-told-you-about)
* Great intro to vim at [Walking without Crutches](http://walking-without-crutches.heroku.com/)
* Another good writeup on getting [started with Vim](http://stevelosh.com/blog/2010/09/coming-home-to-vim./)

----

## Setup macvim as default editor

Use `duti` to make macvim the default editor for specific file types. [Link to Duti website](http://duti.org/). For example to make macvim default for text files...

```
duti -s org.vim.macvim public.plain-text all
```

## Make use of Caps Lock key

Use Seil to override the default action of the capslock key, for example to make caps lock act as esc key. [Link to Seil](https://pqrs.org/osx/karabiner/seil.html.en)

**Thanks!**

Chris Engebretson - [snarkydog.com](http://www.snarkydog.com)

