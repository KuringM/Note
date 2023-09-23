- Tags: #Linux #CLI #APP

---

# 从复制一个仓库开始建立自己的项目

---

1. clone你需要的项目：
    
    > git clone 代码地址
    > 
2. 进入项目目录：
    
    > cd app-demo
    > 
3. 删除原有git信息，有问题一直回车即可
    
    > rm -r .git
    > 
4. 初始化.git：
    
    > git init
    > 
5. 将本地代码添加到仓库
    
    > git add .git commit -m “说明…”
    > 
6. 在git官网上新建一个Project，注意不要生成README.md文件
7. 关联远程库
    
    > git remote add origin 远程库地址
    > 
8. 提交代码
    
    > git push --set-upstream origin master
    > 

# 指令/Commands

---

1.查看Git的使用方法 ： git

2.把当前文件夹变为一个git仓库 创建git仓库：git init

3.查看当前仓库文件变化情况：git status

4.添加修改：git add （可使用git add . 来添加当前仓库所有修改）

5.本次还没有提交的更改：git diff（比较工作区与暂存区的区别）

6.回滚，撤销提交操作：git reset

7.向Git提交自己身份（name）：git config --global user.name "xxx"

8.向Git提交自己身份（email）：git config --global user.email "xxx@xx.com"

9.向Git提交内容：git commit -m “xx” （xx为对提交的内容进行描述）

10.让Git不提交某些文件/忽略某些文件：创建文件 .gitignore 并在文件中添加文件名/文件夹名 即可 （若git已经开始追踪某些文件 则需要11）

11.让Git不再追踪某个/某些文件：git rm --cached xx （xx为文件名）

12.Git添加分支：git branch xx （xx为分支名）

13.Git切换分支：git checkout xx （xx为分支名）

14.合并分支：git merge xx（xx为分支名）

15.列出本地分支：git branch

16.删除分支:git branch -d xx (xx为分支名，-D强制删除)

17.添加远程仓库：git remote add origin xxx （xxx为远程地址）

18.设置本地分支追踪远程分支：git push --set-upstream

19.克隆仓库：git clone xxx（xxx为远程地址）

20.记住密码：git config credential.helper store

# 一个惊艳的CLI---- Lazygit
---
- [[Todo]]

# FAQ
---

### Git忽略规则(.gitignore配置）不生效原因和解决
---

  .gitignore中已经标明忽略的文件目录下的文件，git push的时候还会出现在push的目录中，或者用git status查看状态，想要忽略的文件还是显示被追踪状态。
 原因是因为在git忽略目录中，新建的文件在git中会有缓存，如果某些文件已经被纳入了版本管理中，就算是在.gitignore中已经声明了忽略路径也是不起作用的，
这时候我们就应该先把本地缓存删除，然后再进行git的提交，这样就不会出现忽略的文件了。
    
  -  解决方法: git清除本地缓存（改变成未track状态），然后再提交:
    
    1. `git rm -r --cached .`
    2. `git add .`
    3. `git commit -m 'update .gitignore'`
    4. `git push -u origin maste`

### Use git mange dotfiles

---
    
[https://news.ycombinator.com/item?id=11070797](https://news.ycombinator.com/item?id=11070797)
    
[https://catcat.cc/post/diyo4/](https://catcat.cc/post/diyo4/)
    
    1. `git init --bare $HOME/.myconf`
    2. `alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'`
    3. `~~config config status.showUntrackedFiles no~~`

### Git use ssh

---
    
[https://todebug.com/tips/](https://todebug.com/tips/)
    
    1. 首先生成密钥对：`ssh-keygen -t rsa -C "youremail"`
    2. 然后将生成的位于 ~/.ssh/ 的 id_rsa.pub 的内容复制到你 github setting 里的 ssh key 中。
    3. 复制之后，如果你还没有克隆你的仓库，那你直接使用 ssh 协议用法：git@github.com:yourusername/yourrepositoryname 克隆就行了。
    4. 如果已经使用 https 协议克隆了，那么按照如下方法更改协议： git remote set-url origin [git@github.com](mailto:git@github.com):yourusername/yourrepositoryname.git

### [ssh returns "Bad owner or permissions on ~/.ssh/config"](https://serverfault.com/questions/253313/ssh-returns-bad-owner-or-permissions-on-ssh-config)
    
I needed to have rw for user only permissions on config. This fixed it. `chmod 600 ~/.ssh/config`
    
As others have noted below, it could be the file owner. (upvote them!) `chown $USER ~/.ssh/config`
    

### 修改GitHub域名

---

- 查域名
    1. 查看github.com域名：`nslookup github.com`
    2. 查看github.global.ssl.fastly.Net域名：`nslookup github.global.ssl.fastly.Net`
- ifconfig,route在net-tools中，nslookup,dig在dnsutils中，ftp,telnet等在inetutils中,ip命令在iproute2中。
    
    执行命令：`sudo pacman -S net-tools dnsutils inetutils iproute2`
    
- 修改hosts
    
    `sudo vim /etc/hosts`添加
    
    ```
    github.com address
    github.global.ssl.fastly.Net address
    ```
    
- 刷新系统DHS缓存
    
    **Arch Linux/Manjaro with Network Manager**: `sudo systemctl restart NetworkManager.service`
    
    **Arch Linux/Manjaro with Wicd:** `sudo systemctl restart wicd.service`
    

### 一种github下载提速方法

---

- Tips
    
    使用github的镜像网站进行访问，`github.com.cnpmjs.org`，即将`github.com`替换成`github.com.cnpmjs.org`
	
