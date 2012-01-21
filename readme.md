**Introduction**

First a quick thanks to everyone who has posted their `.vimrc` files and vim setups online so wannabe vim users like me can learn and copy from :o). Some of the more helpful vim setups I have stumbled across include:

	
* Good ideas from Steve Francia's vim setup at [spf13-vim](https://github.com/spf13/spf13-vim)
* Lots of tips and tricks from [Stackoverflow](http://stackoverflow.com/questions/tagged/vim?sort=votes&pagesize=50)
* The vim setup from [Janus](https://github.com/carlhuda/janus) (specifically for [MacVim](http://code.google.com/p/macvim/))

----

**Installation**

For myself I store everything in the  `.vim` folder in my home directory. Though in theory you could clone the project anywhere, you will just have to create an additional symlink from `.vim` to the project folder. To get started run the following:

    git clone git://github.com/cengebretson/vim.git ~/.vim

Create a symlink to the new `.vim` directory (or wherever you cloned the project) for the `.vimrc` file.

    ln -s ~/.vim/vimrc ~/.vimrc
    
For the most part I've try to use the amazing [pathogen](https://github.com/tpope/vim-pathogen) and git submodules maintain the different vim plugins that I use. The easiest way to load and update all of the git submodules is to run the following commands (assumes you are using `.vim` for your vim setup):

    cd ~/.vim
    git submodule init
    git submodule update

----

**Other Notes**

Currently I use vim mostly with [MacVim](http://code.google.com/p/macvim/) but in the not so distant future I hope to put some time into making this setup a little more cross platform friendly.

Another thing I did with my `.vimrc` setup is turn backups and swap files off since I figure this is what version control is for. 

The font I ended up using is called `Inconsolata` which is a free font created by Raph Levien. The website [Hivelogic](http://hivelogic.com/) has a great [article](http://hivelogic.com/articles/top-10-programming-fonts/) on some of the best programming fonts.

Vim feels like one of those tools that you could work with for years but still learn new things every day. Here are some of the sites that have helped me:

* Tips from [www.zinkwazi.com](http://www.zinkwazi.com/unix/notes/vimtips.html)
* Favorite vim tricks from [Stackoverflow](http://stackoverflow.com/questions/726894/what-are-the-dark-corners-of-vim-your-mom-never-told-you-about)
* Great intro to vim at [Walking without Crutches](http://walking-without-crutches.heroku.com/)
* Another good writeup on getting [started with Vim](http://stevelosh.com/blog/2010/09/coming-home-to-vim/)

----

**Thanks!**

Chris Engebretson - [snarkydog.com](http://www.snarkydog.com)

