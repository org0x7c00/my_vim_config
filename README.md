####这是我的vim配置

包含以下插件以及配置

- [YouCompleteME](https://github.com/Valloric/YouCompleteMe) 一个自动补全的神器。这里的YCM已经编译好了，具体怎么使用后面会涉及到
- [syntastic](https://github.com/Valloric/YouCompleteMe) 语法检查插件。配合YCM食用味道更佳 :)
- [auto-pairs](https://github.com/jiangmiao/auto-pairs) 括号、引号、自动换行、缩进,就靠它了
- [nerdtree](https://github.com/scrooloose/nerdtree) 浏览文件从此不再那么麻烦 
- [ctrlp-funky](https://github.com/tacahiroy/ctrlp-funky) 用于函数导航的，貌似没有用过。目前还没有怎么配置

大概就是这些吧。

####怎么使用呢？

前面已经说过，YCM神器已经编译过了，所以就没那么麻烦了。
####安装它
依次执行以下命令：

``````
git clone https://github.com/org0x7c00/my_vim_config  ~/vim_install

cd ~/vim_install

tar -zvxf vim_tmp.tar.gz

mv vim_tmp ~/.vim

mv vimrc ~/.vimrc
``````

收工！

####更多
还有一些VIM的额外配置，转到这个页面：[my_vim_config](https://github.com/org0x7c00/my_vim_config)中的__vim_extend_config.md__