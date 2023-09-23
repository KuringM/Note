- Tags: #Linux #Arch #pacman #yay #paru

---

# [pacman命令详解](http://blog.chinaunix.net/uid-26495963-id-3309594.html)

**1. 更新系统**

在 Archlinux 中,使用一条命令即可对整个系统进行更新:# pacman -Syu

如果你已经使用 pacman -Sy 将本地的包数据库与远程的仓库进行了同步,也可以只执行:# pacman -Su

**2. 安装包**# pacman -S 包名:例如,执行 pacman -S firefox 将安装 Firefox。你也可以同时安装多个包, 只需以空格分隔包名即可。# pacman -Sy 包名:与上面命令不同的是,该命令将在同步包数据库后再执行安装。# pacman -Sv 包名:在显示一些操作信息后执行安装。# pacman -U:安装本地包,其扩展名为 pkg.tar.gz。

**3. 删除包** 

# pacman -R 包名:该命令将只删除包,不包含该包的依赖。

# pacman -Rs 包名:在删除包的同时,也将删除其依赖。

# pacman -Rd 包名:在删除包时不检查依赖。

**4. 搜索包**

# pacman -Ss 关键字:这将搜索含关键字的包。

# pacman -Qi 包名:查看有关包的信息。

# pacman -Ql 包名:列出该包的文件。

**5. 其他用法**# pacman -Sw 包名:只下载包,不安装。

# pacman -Sc:Pacman 下载的包文件位于 /var/cache/pacman/pkg/ 目录。该命令将清理未安装的包文件。

# pacman -Scc:清理所有的缓存文件。

```bash
sudo pacman -S package_name     # 安装软件包
sudo pacman -Syyu               # 升级系统 yy标记强制刷新 u标记升级动作
sudo pacman -R package_name     # 删除软件包
sudo pacman -Rs package_name    # 删除软件包，及其所有没有被其他已安装软件包使用的依赖包
sudo pacman -Qdt                # 找出孤立包 Q为查询本地软件包数据库 d标记依赖包 t标记不需要的包 dt合并标记孤立包
sudo pacman -Rs $(pacman -Qtdq) # 删除孤立软件包
sudo pacman -Fy                 # 更新命令查询文件列表数据库
sudo pacman -F xxx              # 当不知道某个命令属于哪个包时，用来查询某个xxx命令属于哪个包
```

## TheCW teached

---

### -S command

1. 下载：`sudo pacman -S ***`
2. 更新：
    - `sudo pacman -Sy` 刷新软件源
    - `sudo pacman -Syy` 强制刷新软件源
    - `sudo pacman -Syu` 刷新软件源，并更新软件
    - `sudo pacman -Syyu` 强制刷新软件源，并更新软件
3. 查询：`sudo pacman -Ss ***`(+正则)
4. 删除缓存：`sudo pacman -Sc`

### -R command

1. 删除软件并删除依赖：`sudo pacman -Rs ***`
2. 和全局配置文件（不删除用户的配置文件）：`sudo pacman -Rns ***`

### -Q command

1. 显示所以已安装的软件：`sudo pacman -Q`
2. 显示已装软件数：`sudo pacman -Q | wc -l`
3. 显示自己安装的软件：`-q`不显示版本号等]
4. 查询本地软件：`sudo pacman -Qs ***`
5. 查询孤包：`sudo pacman -Qdt`
6. 删除全部孤包：`sudo pacman -R $(pacman -Qdtq)`

### Configurate (`/etc/pacman.conf`)

# yay安装

---

1. 安装必要软件：go git base-devel
2. 克隆源码：git clone [https://aur.archlinux.org/yay.git](https://aur.archlinux.org/yay.git)
3. cd yay
4. makepkg -si

## **yay 换源**

---

执行以下命令修改 aururl :

```
yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save
```

修改的配置文件位于 `~/.config/yay/config.json`，还可通过以下命令查看修改过的配置：

`yay -P -g`

### 解决下载速度慢的一些方法

---

**[使用全局代理qv2ray+cgproxy](https://archlinuxstudio.github.io/ArchLinuxTutorial/#/advanced/transparentProxy)**

- `sudo pacman -S qv2ray-dev-git v2ray`
- `yay -S cgproxy`
