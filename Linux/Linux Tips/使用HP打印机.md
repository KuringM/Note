- Tags: #Linux #Arch #HP #Print #打印机

---
# [Archlinux使用HP打印机](https://spacexi.github.io/archlinux-hpprint/)

- 安装驱动

    ```bash
    sudo cups ghostscript gsfonts hpoj hplip
    ```
    
- 安装后

    ```bash
    sudo systemctl restart avahi-daemon.service
    sudo systemctl start cups-browsed.service
    ```
    
- 添加打印机
    
    在浏览器中输入[http://localhost:631](http://localhost:631/) 进入cups设置页面，选择Administration –> Add Printer –> Add Printer。中间要登录一下，记得用root账号或者具有root权限的用户，不然会没有权限添加打印机。
