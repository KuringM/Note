- Tags: #Linux #GUI

---

[software that sucks less | suckless.org software that sucks less](https://suckless.org/)

## 常规安装

1. 安装发工具集：`base-devel`
2. 安装X组件：`xorg-server xorg-apps xorg-xinit`
3. 安装多种语言： `noto-fonts-cjk`
4.  安装终端网页浏览器：`w3m`
5. 去官网下载源码：`w3m suckless.org`
6. 解压包：`taz -zxvf dwm-6.2`
7. 编译 `cd dwm-6.2` ：`make`
8. 安装源码包：`sudo make clean install`
9. 编辑X启动脚本：`vim .xinitrc` `exec dwm`
10. 安装nvidia显卡驱动：`nvidia`
11. 启动： `startx`

---

---

[theniceboy/dwm](https://github.com/theniceboy/dwm)

[theniceboy/st](https://github.com/theniceboy/st)

[theniceboy/.config](https://github.com/theniceboy/.config)

[theniceboy/scripts](https://github.com/theniceboy/scripts)

修改config.h

开机自启：`vim /etc/X11/xinit/xinitrc`,`exec dwm`

## 修改配置后需要重新编译和安装

---

```bash
make
make clean install
```

## 安装相应的字体

---

1.`SauceCodePro Nerd Font Mono`

[https://aur.archlinux.org/packages/nerd-fonts-source-code-pro/](https://aur.archlinux.org/packages/nerd-fonts-source-code-pro/)

2.`Fira Code Nerd Font Mono`

[https://aur.archlinux.org/packages/otf-nerd-fonts-fira-code/](https://aur.archlinux.org/packages/otf-nerd-fonts-fira-code/)

```bash
yay -S otf-nerd-fonts-fira-code nerd-fonts-source-code-pro
```

## **本地化**

---

在`/etc/locale.conf` 中

```
LANG=en_US.UTF-8
LC_ADDRESS=en_US.UTF-8
LC_IDENTIFICATION=en_US.UTF-8
LC_MEASUREMENT=en_US.UTF-8
LC_MONETARY=en_US.UTF-8
LC_NAME=en_US.UTF-8
LC_NUMERIC=en_US.UTF-8
LC_PAPER=en_US.UTF-8
LC_TELEPHONE=en_US.UTF-8
LC_TIME=en_US.UTF-8
```

**关于 Noto**

只需要安装 `noto-fonts` (并非 `-all`), 它已经非常臃肿, 检查 `/usr/share/fonts/noto`

**Emoji**

```bash
yay -S ttf-linux-libertine ttf-inconsolata ttf-joypixels ttf-twemoji-color noto-fonts-emoji ttf-liberation ttf-droid
```

**中文**

```bash
yay -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei adobe-source-han-mono-cn-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts
```

## Patch

---

1. 打补丁：`pacth < ******.diff` (主目录下)

For git users, use -3 to fix the conflict easily:

```
cd program-directory
git apply path/to/patch.diff
```

For patches formatted with git format-patch:

```
cd program-directory
git am path/to/patch.diff
```

For tarballs:

```
cd program-directory
patch -p1 < path/to/patch.diff
```
