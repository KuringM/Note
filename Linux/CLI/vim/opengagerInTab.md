["more" pagre?](https://vi.stackexchange.com/questions/5729/how-can-i-perform-a-search-when-vim-displays-content-using-more-pager)

> 将"--more-- pager"内容输出在其他地方(如:tab、buffer)
> or other Vim internal commands 

##### 寄存器
``` vim
:redir @a    redirect output of following commands to register a
:let         list every current option and its value
G<CR>        go straight to the end of the listing and make it disappear
:redir END   stop redirection
:tabnew      open a new buffer in a new window in a new tab page
"ap          put from register a

" in short
:redir @a|sil let| redir end
:"ap
```

##### use vim built-in func `put` 
``` vim
" put 放置文本 [从寄存器 x] 在行号 [line] (缺省为当前行) 之后
" execute执行 Ex 命令或命令序列，返回结果为字符串。
:tabnew
:put =execute('let')
```

##### use [capture](https://github.com/AmaiSaeta/capture.vim) plugin
``` vim
:Capture let
```
