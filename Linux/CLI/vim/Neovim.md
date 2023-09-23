- Tags: #Linux #nvim #CLI 
- Date: 2021-12-20
---


[theniceboy/nvim](https://github.com/theniceboy/nvim)

# **安装依赖**

---

- **Python语言 程序调试 (通过 `vimspector` 实现)**
    
    [pip](https://www.notion.so/pip-f52de73fd8ff4e32bdd65af66d6e5ba8)
    
    - [ ]  安装`python python-pip python2 python2-pip`
    - [ ]  `Ueberzug` (使用 `pip`)
    - [ ]  安装 `debugpy` (使用 `pip`)
    
- **配置 `Python` 路径**
    - [ ]  确保你安装了 Python (python2 and python3)
    - [ ]  查看 `_machine_specific.vim` 文件
    - [ ]  安装 `pynvim` (使用 `pip`和`pip2`)
- **Nodejs**
    - [ ]  安装 `nodejs`,
    - [ ]  安装`npm`，然后在终端输入 `npm install -g neovim`(❌)
    - [ ]  安装`yarn`，然后在终端输入 `yarn global add neovim`
- **Ruby语言 provider**
    
    [ruby](https://www.notion.so/ruby-d13b2b1b8cca4b779b03580ddf675532)
    
    - [ ]  安装`ruby`
    - [ ]  安装`neovim RubyGem`:（`gem install neovim`) [gem](https://www.commandlinux.com/man-page/man1/gem.1.html)
    - [ ]  检查gem在$PATH路径中：(`gem environment`)(❌）
    - [ ]  在init.vim里添加ruby路径：`let g:ruby_host_prog = ‘/urs/bin/ruby’`
    - [ ]  更新`neovim RubyGem`: `gem update neovim`
    
- **标签表**
    - [ ]  安装 `ctags` 以获得类/函数/变量的三重支持
- **FZF**
    - [ ]  安装 `fzf`
    - [ ]  安装 `the_silver_searcher`  (`ag`需要)
- **其它...**
    - [ ]  安装 nerd-fonts (尽管它是可选的，但是安装之后看上去十分地酷)
    - [ ]  安装 `figlet` 以输入 ASCII 艺术字
    - [ ]  安装文件管理器`ranger`
    - [ ]  安装 `xclip` 以获得系统剪切板访问支持 (仅 `Linux` 与 `xorg` 需要)
- **检查**
    - [x]  执行 `:checkhealth`

# **快捷键**

---

## **1. 基础编辑**

### **最基本的键**

**`k`** : 切换至 **`插入`** : 一种模式 (在原版 Vim 中与 `i` 键相同)

**`Q`** : 退出当前 Vim 窗口 (在原版 Vim 中与命令 `:q` 相同)

**`S`** : 保存当前文件 (在原版 Vim 中与命令 `:w` 相同)

❗因为 `i` 键被改为了 `k` 键, 所有包含 `i` 键的命令都必须将 `i` 改为 `k` (比如 `ciw` 应被更正为 `ckw`)

[光标移动](https://www.notion.so/f94f229f616a4a2e803efafc91d4041f)

[普通模式下的操作键位](https://www.notion.so/73319a67e97e4a39abebe2b23d921857)

[插入模式](https://www.notion.so/3f78dc2036ec4a69ad759d2f88a229ef)

[可视模式下的命令](https://www.notion.so/3a5244b9dd764beaa51c1be6748a6d0a)

[窗口管理](https://www.notion.so/2b78c9fd91f549fab860fbc3a680ad2b)

用方向键更改当前窗口的大小

[标签页管理](https://www.notion.so/5e3db381fd764ae5a375d9d79750a4b7)

## 2. **插件快捷键 (截图/动图已经准备好！)**

---

### **自动补全**

### **[COC (自动补全)](https://github.com/neoclide/coc.nvim)**

[coc](https://www.notion.so/5cb9284d0d5d41319640a6a0b8c85914)

![https://user-images.githubusercontent.com/251450/55285193-400a9000-53b9-11e9-8cff-ffe4983c5947.gif](https://user-images.githubusercontent.com/251450/55285193-400a9000-53b9-11e9-8cff-ffe4983c5947.gif)

### **[Ultisnips](https://github.com/SirVer/ultisnips)**

[Ultisnips](https://www.notion.so/2b009bd8c07842a3b879cd505381dfce)

[https://camo.githubusercontent.com/858d1f6329a29afd878bc9e6c2e024f5b989391a3ad70d3923c935a703c5b75b/68747470733a2f2f7261772e6769746875622e636f6d2f5369725665722f756c7469736e6970732f6d61737465722f646f632f64656d6f2e676966](https://camo.githubusercontent.com/858d1f6329a29afd878bc9e6c2e024f5b989391a3ad70d3923c935a703c5b75b/68747470733a2f2f7261772e6769746875622e636f6d2f5369725665722f756c7469736e6970732f6d61737465722f646f632f64656d6f2e676966)

### **代码调试**

### **[vimspector (代码调试插件)](https://github.com/puremourning/vimspector)**

[vimspector](https://www.notion.so/79d30b686a434bbabbd0a2517d5ffd87)

[https://camo.githubusercontent.com/4c32f5b58f6c910e60d525cf52742be1001c34528fd46ffbd10eabd7afa333e8/68747470733a2f2f707572656d6f75726e696e672e6769746875622e696f2f76696d73706563746f722d7765622f696d672f76696d73706563746f722d6f766572766965772e706e67](https://camo.githubusercontent.com/4c32f5b58f6c910e60d525cf52742be1001c34528fd46ffbd10eabd7afa333e8/68747470733a2f2f707572656d6f75726e696e672e6769746875622e696f2f76696d73706563746f722d7765622f696d672f76696d73706563746f722d6f766572766965772e706e67)

### **文件浏览**

### **[coc-explorer - 文件浏览器](https://github.com/weirongxu/coc-explorer)**

[coc-explorer](https://www.notion.so/6eb81294f56149baadae3ef9a848c37a)

![https://user-images.githubusercontent.com/1709861/64966850-1e9f5100-d8d2-11e9-9490-438c6d1cf378.png](https://user-images.githubusercontent.com/1709861/64966850-1e9f5100-d8d2-11e9-9490-438c6d1cf378.png)

### **[rnvimr - 文件浏览器](https://github.com/kevinhwang91/rnvimr)**

- [ ]  确定你已经安装了 ranger

按 `R` 键打开 ranger (文件选择器)

在 rnvimr (ranger) 中, 你可以:

[rnvimr](https://www.notion.so/630f0bf1527248029b4a4ed328a8c1b8)

![https://user-images.githubusercontent.com/17562139/74416173-b0aa8600-4e7f-11ea-83b5-31c07c384af1.gif](https://user-images.githubusercontent.com/17562139/74416173-b0aa8600-4e7f-11ea-83b5-31c07c384af1.gif)

### **[FZF - 模糊文件查找器](https://github.com/junegunn/fzf.vim)**

[FZF](https://www.notion.so/5d7e5a8d29fa4484a776baac86302794)

[https://camo.githubusercontent.com/01c738192dc98e59cc139b2591f3c43b6dc75d06b5b57ac097c4c1acd8e8f160/68747470733a2f2f6a657373656c656974652e636f6d2f75706c6f6164732f706f7374732f322f7461672d66696e6465722d6f70742e676966](https://camo.githubusercontent.com/01c738192dc98e59cc139b2591f3c43b6dc75d06b5b57ac097c4c1acd8e8f160/68747470733a2f2f6a657373656c656974652e636f6d2f75706c6f6164732f706f7374732f322f7461672d66696e6465722d6f70742e676966)

### **[xtabline - 精致的顶栏](https://github.com/mg979/vim-xtabline)**

[xtabline](https://www.notion.so/ed35ff919a6a49acb66445914c858467)

[https://camo.githubusercontent.com/c0b1709d01adbc0763d1eecaa425944f71b86d7e3b4194d086ba42d11d8f9149/68747470733a2f2f692e696d6775722e636f6d2f795536716255352e676966](https://camo.githubusercontent.com/c0b1709d01adbc0763d1eecaa425944f71b86d7e3b4194d086ba42d11d8f9149/68747470733a2f2f692e696d6775722e636f6d2f795536716255352e676966)

### **文字编辑**

### **[vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)**

[vim-table-mode](https://www.notion.so/669cc6ff3d4f4bc19907c38d2df6e607)

See `:help table-mode.txt` for more.

### **[Undotree](https://github.com/mbbill/undotree)**

[Undotree](https://www.notion.so/09316be4400c4fc78603f76ecace4045)

[https://camo.githubusercontent.com/56430626a5444ea2f0249d71f9288775277c7f5d/68747470733a2f2f73697465732e676f6f676c652e636f6d2f736974652f6d6262696c6c2f756e646f747265655f6e65772e706e67](https://camo.githubusercontent.com/56430626a5444ea2f0249d71f9288775277c7f5d/68747470733a2f2f73697465732e676f6f676c652e636f6d2f736974652f6d6262696c6c2f756e646f747265655f6e65772e706e67)

### **[vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)**

[vim-multiple-cursors](https://www.notion.so/eaf094b5f22840bab6cf38be7e63256d)

![https://raw.githubusercontent.com/terryma/vim-multiple-cursors/master/assets/example1.gif](https://raw.githubusercontent.com/terryma/vim-multiple-cursors/master/assets/example1.gif)

![https://raw.githubusercontent.com/terryma/vim-multiple-cursors/master/assets/example2.gif](https://raw.githubusercontent.com/terryma/vim-multiple-cursors/master/assets/example2.gif)

![https://raw.githubusercontent.com/terryma/vim-multiple-cursors/master/assets/example3.gif](https://raw.githubusercontent.com/terryma/vim-multiple-cursors/master/assets/example3.gif)

![https://raw.githubusercontent.com/terryma/vim-multiple-cursors/master/assets/example4.gif](https://raw.githubusercontent.com/terryma/vim-multiple-cursors/master/assets/example4.gif)

### **[vim-surround](https://github.com/tpope/vim-surround)**

想要添加包裹符号 (`string` -> `"string"`):

```
string

```

按下: `yskw'`:

```
'string'

```

想要修改包裹符号

```
'string'

```

按下: `cs'"`:

```
"string"

```

[https://camo.githubusercontent.com/334f5a06cbee4141889dfdf18a7c51a0ea408edb4d79f4dbe77e4d8b937d5a0b/68747470733a2f2f74776f2d77726f6e67732e636f6d2f696d6167652f737572726f756e645f76696d2e676966](https://camo.githubusercontent.com/334f5a06cbee4141889dfdf18a7c51a0ea408edb4d79f4dbe77e4d8b937d5a0b/68747470733a2f2f74776f2d77726f6e67732e636f6d2f696d6167652f737572726f756e645f76696d2e676966)

### **[vim-subversive](https://github.com/svermeulen/vim-subversive)**

新的操作员: `s`:

您可以执行 `s<操作>`来使用用默认的寄存器 (或提供的显式寄存器) 的内容替换运动提供的文本对象。例如，您可以执行 `skw` 将光标下的当前单词替换为当前yank，或执行 `skp` 替换段落，依此类推

### **[vim-easy-align](https://github.com/junegunn/vim-easy-align)**

在普通或可视模式下按 `ga` + **符号** 可以根据 **符号**对齐文本

![https://raw.githubusercontent.com/junegunn/i/master/easy-align/equals.gif](https://raw.githubusercontent.com/junegunn/i/master/easy-align/equals.gif)

### **[AutoFormat](https://github.com/Chiel92/vim-autoformat)**

按 `\` `f` 开启格式化模式

### **[vim-markdown-toc (为 Markdown 文件生成目录)](https://github.com/mzlogin/vim-markdown-toc)**

在 `Markdown` 文件中, 按下 `:Gen` 打开菜单，你将会看到可选选项

![https://raw.githubusercontent.com/mzlogin/vim-markdown-toc/master/screenshots/english.gif](https://raw.githubusercontent.com/mzlogin/vim-markdown-toc/master/screenshots/english.gif)

### **缓冲区内导航**

### **[vim-easy-motion](https://github.com/easymotion/vim-easymotion)**

按 `'` 键和一个 `字母` 跳转至 `字母` (类似 Emacs 的 [AceJump](https://www.emacswiki.org/emacs/AceJump))

[https://camo.githubusercontent.com/a7ba9f1318ef3a014b52c3fcdc7406c74b6f4d9834d1391342783371a83e4a72/68747470733a2f2f662e636c6f75642e6769746875622e636f6d2f6173736574732f333739373036322f323033393335392f61386539333864362d383939662d313165332d383738392d3630303235656138333635362e676966](https://camo.githubusercontent.com/a7ba9f1318ef3a014b52c3fcdc7406c74b6f4d9834d1391342783371a83e4a72/68747470733a2f2f662e636c6f75642e6769746875622e636f6d2f6173736574732f333739373036322f323033393335392f61386539333864362d383939662d313165332d383738392d3630303235656138333635362e676966)

### **[Vista.vim](https://github.com/liuchengxu/vista.vim)**

按 `T` 打开函数与变量列表

![https://user-images.githubusercontent.com/8850248/56469894-14d40780-6472-11e9-802f-729ac53bd4d5.gif](https://user-images.githubusercontent.com/8850248/56469894-14d40780-6472-11e9-802f-729ac53bd4d5.gif)

### **[vim-signiture - 书签](https://github.com/kshenoy/vim-signature)**

[vim-signiture](https://www.notion.so/53245e7950d74ebcace54de2953c3902)

[https://camo.githubusercontent.com/bc2bf1746e30c72d7ff5b79331231e8c388d068a/68747470733a2f2f7261772e6769746875622e636f6d2f4d617474657347726f656765722f76696d2d626f6f6b6d61726b732f6d61737465722f707265766965772e676966](https://camo.githubusercontent.com/bc2bf1746e30c72d7ff5b79331231e8c388d068a/68747470733a2f2f7261772e6769746875622e636f6d2f4d617474657347726f656765722f76696d2d626f6f6b6d61726b732f6d61737465722f707265766965772e676966)

### **查找与替换**

### **[Far.vim - 查找与替换](https://github.com/brooth/far.vim)**

按下 `SPACE` `f` `r` 在工作目录中搜索

![https://cloud.githubusercontent.com/assets/9823254/20861878/77dd1882-b9b4-11e6-9b48-8bc60f3d7ec0.gif](https://cloud.githubusercontent.com/assets/9823254/20861878/77dd1882-b9b4-11e6-9b48-8bc60f3d7ec0.gif)

### **Git 相关**

### **[vim-gitgutter](https://github.com/airblade/vim-gitgutter)**

[vim-gitgutter](https://www.notion.so/4374a514978b4e018d2bac88daa3f008)

### **[fzf-gitignore](https://github.com/fszymanski/fzf-gitignore)**

按 `Space` `g` `i` 来创建一个 `.gitignore` 文件

![https://user-images.githubusercontent.com/25827968/42945393-96c662da-8b68-11e8-8279-5bcd2e956ca9.png](https://user-images.githubusercontent.com/25827968/42945393-96c662da-8b68-11e8-8279-5bcd2e956ca9.png)

![https://raw.githubusercontent.com/airblade/vim-gitgutter/master/screenshot.png](https://raw.githubusercontent.com/airblade/vim-gitgutter/master/screenshot.png)

### **其它**

### **[vim-calendar](https://github.com/itchyny/calendar.vim)**

[vim-calendar](https://www.notion.so/2f19ee45854b413e9d4a82d78e4b937d)

![https://raw.githubusercontent.com/wiki/itchyny/calendar.vim/image/image.png](https://raw.githubusercontent.com/wiki/itchyny/calendar.vim/image/image.png)

### **[Goyo - 不会分心地工作](https://github.com/junegunn/goyo.vim)**

按下 `g` `y` 开关 Goyo

[https://camo.githubusercontent.com/9457f643adee230626f366295440f3edcd2c1f4c3f975113dd3ba602976240c4/68747470733a2f2f7261772e6769746875622e636f6d2f6a756e6567756e6e2f692f6d61737465722f676f796f2e706e67](https://camo.githubusercontent.com/9457f643adee230626f366295440f3edcd2c1f4c3f975113dd3ba602976240c4/68747470733a2f2f7261772e6769746875622e636f6d2f6a756e6567756e6e2f692f6d61737465722f676f796f2e706e67)

### **[suda.vim](https://github.com/lambdalisue/suda.vim)**

想要忘记以前痛苦的 `sudo vim ...`? 只需要在 Vim 中执行 `:sudowrite` 或者 `:sw`

### **[coc-translator](https://github.com/voldikss/coc-translator)**

按下 `ts` 来 **翻译光标所在的单词**.

![https://user-images.githubusercontent.com/20282795/72232547-b56be800-35fc-11ea-980a-3402fea13ec1.png](https://user-images.githubusercontent.com/20282795/72232547-b56be800-35fc-11ea-980a-3402fea13ec1.png)

## **自定义代码片段补全**

### **Markdown**

[Markdown](https://www.notion.so/7dd2db473eed4bc3bf388ef53575fb46)

## **一些奇怪的东西**

### **按 `tx` 然后输入你想要的文字**

`tx Hello<Enter>`

```
 _   _      _ _
| | | | ___| | | ___
| |_| |/ _ \ | |/ _ \
|  _  |  __/ | | (_) |
|_| |_|\___|_|_|\___/

```

### **自定义垂直光标移动**

此 NeoVim 配置包含了一套对 Colemak 用户量身定制的垂直光标移动, 它位于 `cursor.vim` 中, 并且可以替代 “数字 + 上 / 下” 的案件组合

为了将光标向上移至 `x` 行, 可以按下 `[` 键, 并将 Colemak 键盘布局的中间行 (“arstdhneio”) 视为从 1 到 0 的数字, 按所需的数字, 再按下空格键以跳转至 `x` 行之上

要向下移动光标, 按 `'` 键而不是 `[` 键, 其余部分相同
