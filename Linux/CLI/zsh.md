- Tags: #Linux #CLI #ZSH

---

### Zsh 出现 zsh: corrupt history file /home/eddie/.zsh_history的解决办法

 > zsh是一个相当好用的shell，相信使用linux系统的朋友都不陌生，当然还有my zsh,不过有的时候会出现一些问题，例如因为有的时候系统因为默写原因强行启动的时候会破坏zsh的历史文件，导致下次使用的时候提示：zsh: corrupt history file /home/xxx/.zsh_history错误。 我们有一种暴力的解决方式，那就是删除，但是这样的话，我们以前的很多的历史命令就会没有，非常的麻烦。

1. `mv .zsh_history .zsh_history_bad`
2. `strings .zsh_history_bad > .zsh_history`
3. `fc -R .zsh_history`

### zsh 读取配置文件顺序
1. /etc/zshenv
2. $ZDOTDIR/.zshenv
3. /etc/zprofile
4. $ZDOTDIR/.zprofile
5. /etc/zshrc
6. $ZDOTDIR/.zshrc
7. /etc/zlogin
8. $ZDOTDIR/.zlogin
9. $ZDOTDIR/.zlogout
10. /etc/zlogout
