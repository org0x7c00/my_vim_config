这份VIM的后续配置主要是针对C语言。

首先，是高亮函数名和指针符号（包括```->```和```*```）

配置文件的路径```/usr/share/vim/vim73/syntax/c.vim```。

也许你是vim7.4，那么对应的路径是```/usr/share/vim/vim74/syntax/c.vim```

修改上述路径的c.vim，在末尾添加以下以便__高亮函数名__：

```
"highlight Functions
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi cFunctions gui=NONE cterm=bold  ctermfg=blue
```

简要说明，ctermfg后面的值表示的颜色名称

继续在添加以下代码来__高亮指针__相关的符号：

```
"Hightlight Operator
 "===========================
 "--->C pointer operators
 syn match      cPointerOperator display"->\|\.\|\:\:"
 syn match      cPointerOperator display"*"
 hi cPointerOperator gui=NONE cterm=bold ctermfg=Green
```



同样ctermfg后面也是表示颜色的。

另外，通过以下设置还可以添加对__汇编语言__关键字高亮支持，需要说明的是对AT&T格式的汇编支持不是很好。

进入vim的syntax路径：```/usr/share/vim/vim74/syntax/```,然后执行：

```
sudo mv masm.vim 1.vim
sudo mv asm.vim masm.vim
sudo mv 1.vim asm.vim
```

经测试，它对nasm格式支持不错。

接下来是一键(F5)编译+一键(F6)运行：

这个以下配置要添加到```vimrc```文件中去。

```
func! CompileGcc()
    exec "w"
    let compilecmd="!gcc "
    let compileflag="-o %< "
    if search("mpi\.h") != 0
        let compilecmd = "!mpicc "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc
func! CompileGpp()
    exec "w"
    let compilecmd="!g++ "
    let compileflag="-o %< "
    if search("mpi\.h") != 0
        let compilecmd = "!mpic++ "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc
func! RunPython()
        exec "!python %"
endfunc
func! CompileJava()
    exec "!javac %"
endfunc
func! CompileCode()
        exec "w"
        if &filetype == "cpp"
                exec "call CompileGpp()"
        elseif &filetype == "c"
                exec "call CompileGcc()"
        elseif &filetype == "python"
                exec "call RunPython()"
        elseif &filetype == "java"
                exec "call CompileJava()"
        endif
endfunc
func! RunResult()
        exec "w"
        if search("mpi\.h") != 0
            exec "!mpirun -np 4 ./%<"
        elseif &filetype == "cpp"
            exec "! ./%<"
        elseif &filetype == "c"
            exec "! ./%<"
        elseif &filetype == "python"
            exec "call RunPython"
        elseif &filetype == "java"
            exec "!java %<"
        endif
endfunc
map <F5> :call CompileCode()<CR>
imap <F5> <ESC>:call CompileCode()<CR>
vmap <F5> <ESC>:call CompileCode()<CR>
map <F6> :call RunResult()<CR>
```





