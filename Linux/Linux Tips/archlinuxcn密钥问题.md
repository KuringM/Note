- Tags: #Linux #Arch #archlinuxcn

---
### 时区导致
- 刷新仓库源密钥
```bash
rm -rf /etc/pacman.d/gnupg
pacman-key --init
pacman-key --populate archlinux
pacman-key --populate archlinuxcn
```
